import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/providers/mention_provider.dart';

import '../../providers/comment_provider.dart';
import '../../widgets/comment_card.dart';
import 'dart:async';
import '../../models/user_model.dart';

class CommentScreen extends ConsumerStatefulWidget {
  final int postId;

  const CommentScreen({
    super.key,
    required this.postId,
  });

  @override
  ConsumerState<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends ConsumerState<CommentScreen> {
  /// =================================================
  /// 🔹 CONTROLLERS
  /// =================================================
  Timer? mentionDebounce;

  bool showMentionOverlay = false;

  String currentMentionQuery = '';
  final textController = TextEditingController();

  final scrollController = ScrollController();

  bool isSending = false;

  /// =================================================
  /// 🔹 INIT
  /// =================================================

  @override
  void initState() {
    super.initState();

    /// initial fetch
    Future.microtask(() {
      ref.read(commentProvider(widget.postId).notifier).fetchComments();
    });

    /// infinite scroll
    scrollController.addListener(() {
      final notifier = ref.read(
        commentProvider(widget.postId).notifier,
      );

      final state = ref.read(
        commentProvider(widget.postId),
      );

      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        if (!state.isLoadingMore && state.hasMore) {
          notifier.fetchComments(
            loadMore: true,
          );
        }
      }
    });
  }

  /// =================================================
  /// 🔹 DISPOSE
  /// =================================================

  @override
  void dispose() {
    textController.dispose();
    scrollController.dispose();
    mentionDebounce?.cancel();

    super.dispose();
  }

  /// =================================================
  /// 🔹 SEND COMMENT
  /// =================================================

  Future<void> sendComment() async {
    final text = textController.text.trim();

    if (text.isEmpty || isSending) return;

    setState(() => isSending = true);

    /// dismiss keyboard
    FocusScope.of(context).unfocus();

    textController.clear();

    try {
      await ref
          .read(
            commentProvider(widget.postId).notifier,
          )
          .addComment(text);

      /// scroll to top
      if (scrollController.hasClients) {
        scrollController.animateTo(
          0,
          duration: const Duration(
            milliseconds: 300,
          ),
          curve: Curves.easeOut,
        );
      }
    } catch (e) {
      //
    }

    if (mounted) {
      setState(() => isSending = false);
    }
  }


void insertMention(User user) {

  final text =
      textController.text;

  final cursorPos =
      textController.selection.baseOffset;

  final textBeforeCursor =
      text.substring(0, cursorPos);

  final match = RegExp(
    r'@(\w*)$',
  ).firstMatch(textBeforeCursor);

  if (match == null) return;

  final newText = text.replaceRange(
    match.start,
    match.end,
    "@${user.userCode} ",
  );

  textController.value =
      TextEditingValue(
    text: newText,

    selection: TextSelection.collapsed(
      offset:
          match.start +
          user.userCode.length +
          2,
    ),
  );

  setState(() {
    showMentionOverlay = false;
  });

  ref.read(
    mentionQueryProvider.notifier,
  ).state = '';
}




  /// =================================================
  /// 🔹 BUILD
  /// =================================================

  @override
  Widget build(BuildContext context) {
    final mentionUsers =
    ref.watch(mentionProvider);


    final state = ref.watch(
      commentProvider(widget.postId),
    );

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Comments (${state.comments.length})",
          ),
        ),
        body: Column(
          children: [
            /// =========================================
            /// 🔥 COMMENTS LIST
            /// =========================================

            Expanded(
              child: state.isLoading && state.comments.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        await ref
                            .read(
                              commentProvider(
                                widget.postId,
                              ).notifier,
                            )
                            .refresh();
                      },
                      child: state.comments.isEmpty
                          ? ListView(
                              children: const [
                                SizedBox(
                                  height: 300,
                                  child: Center(
                                    child: Text(
                                      "No comments yet",
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : ListView.builder(
                              controller: scrollController,
                              padding: const EdgeInsets.only(
                                top: 8,
                                bottom: 12,
                              ),
                              itemCount: state.comments.length +
                                  (state.isLoadingMore ? 1 : 0),
                              itemBuilder: (context, index) {
                                /// 🔥 bottom loader
                                if (index >= state.comments.length) {
                                  return const Padding(
                                    padding: EdgeInsets.all(
                                      16,
                                    ),
                                    child: Center(
                                      child: SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                final comment = state.comments[index];

                                return CommentCard(
                                  comment: comment,
                                  postId: widget.postId,
                                );
                              },
                            ),
                    ),
            ),

            /// =========================================
            /// 🔥 INPUT BAR
            /// =========================================

            SafeArea(
  top: false,
  child: Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 10,
    ),

    decoration: const BoxDecoration(
      color: Colors.white,

      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
        ),
      ],
    ),

    child: Stack(
      clipBehavior: Clip.none,

      children: [

        /// =====================================
        /// 🔥 MENTION OVERLAY
        /// =====================================

        if (showMentionOverlay)

          Positioned(
            left: 0,
            right: 0,
            bottom: 70,

            child: Material(
              elevation: 8,

              borderRadius:
                  BorderRadius.circular(12),

              child: Container(
                constraints:
                    const BoxConstraints(
                  maxHeight: 220,
                ),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(
                    12,
                  ),
                ),

                child: mentionUsers.when(

                  loading: () =>
                      const Padding(
                        padding:
                            EdgeInsets.all(16),

                        child: Center(
                          child:
                              CircularProgressIndicator(),
                        ),
                      ),

                  error: (_, __) =>
                      const Padding(
                        padding:
                            EdgeInsets.all(16),

                        child: Text(
                          "Failed to load users",
                        ),
                      ),

                  data: (users) {

                    if (users.isEmpty) {

                      return const Padding(
                        padding:
                            EdgeInsets.all(16),

                        child: Text(
                          "No users found",
                        ),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,

                      itemCount: users.length,

                      itemBuilder:
                          (context, index) {

                        final user =
                            users[index];

                        return ListTile(

                          leading:
                              CircleAvatar(
                            backgroundImage:
                                user.avatarUrl !=
                                        null
                                    ? NetworkImage(
                                        user
                                            .avatarUrl!,
                                      )
                                    : null,

                            child:
                                user.avatarUrl ==
                                        null
                                    ? const Icon(
                                        Icons.person,
                                      )
                                    : null,
                          ),

                          title: Text(
                            user.fullName,
                          ),

                          subtitle: Text(
                            "@${user.userCode}",
                          ),

                          onTap: () {
                            insertMention(
                              user,
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),

        /// =====================================
        /// 🔥 INPUT ROW
        /// =====================================

        Row(
          crossAxisAlignment:
              CrossAxisAlignment.end,

          children: [

            /// input
            Expanded(
              child: TextField(
                controller:
                    textController,

                minLines: 1,
                maxLines: 5,

                textInputAction:
                    TextInputAction.newline,

                onChanged: (value) {

                  final cursorPos =
                      textController
                          .selection
                          .baseOffset;

                  if (cursorPos < 0) {
                    return;
                  }

                  final textBeforeCursor =
                      value.substring(
                    0,
                    cursorPos,
                  );

                  final match = RegExp(
                    r'@(\\w*)$',
                  ).firstMatch(
                    textBeforeCursor,
                  );

                  if (match != null) {

                    final query =
                        match.group(1) ??
                            '';

                    currentMentionQuery =
                        query;

                    mentionDebounce
                        ?.cancel();

                    mentionDebounce =
                        Timer(
                      const Duration(
                        milliseconds:
                            400,
                      ),

                      () {

                        ref.read(
                          mentionQueryProvider
                              .notifier,
                        ).state = query;

                        if (mounted) {

                          setState(() {
                            showMentionOverlay =
                                true;
                          });
                        }
                      },
                    );

                  } else {

                    mentionDebounce
                        ?.cancel();

                    ref.read(
                      mentionQueryProvider
                          .notifier,
                    ).state = '';

                    if (mounted) {

                      setState(() {
                        showMentionOverlay =
                            false;
                      });
                    }
                  }
                },

                decoration:
                    InputDecoration(
                  hintText:
                      "Write a comment...",

                  filled: true,

                  fillColor:
                      Colors.grey[100],

                  border:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius
                            .circular(
                      24,
                    ),

                    borderSide:
                        BorderSide.none,
                  ),

                  contentPadding:
                      const EdgeInsets
                          .symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 8),

            /// send button
            CircleAvatar(
              radius: 22,

              backgroundColor:
                  Colors.blue,

              child: IconButton(
                icon: isSending
                    ? const SizedBox(
                        height: 18,
                        width: 18,

                        child:
                            CircularProgressIndicator(
                          color:
                              Colors.white,

                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(
                        Icons.send,
                        color:
                            Colors.white,
                      ),

                onPressed:
                    isSending
                        ? null
                        : sendComment,
              ),
            ),
          ],
        ),
      ],
    ),
  ),
),
          ],
        ),
      ),
    );
  }
}
