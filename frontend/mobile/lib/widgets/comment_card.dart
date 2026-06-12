import 'package:flutter/material.dart';

import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/comment_model.dart';
import '../providers/comment_provider.dart';

class CommentCard extends ConsumerStatefulWidget {
  final Comment comment;
  final int postId;

  /// 🔥 reply indentation
  final bool isReply;

  const CommentCard({
    super.key,
    required this.comment,
    required this.postId,
    this.isReply = false,
  });

  @override
  ConsumerState<CommentCard> createState() =>
      _CommentCardState();
}

class _CommentCardState
    extends ConsumerState<CommentCard> {

  bool showReplies = true;

  bool showReplyInput = false;

  final replyController =
      TextEditingController();

  bool isSendingReply = false;

  /// =========================================
  /// 🔥 SEND REPLY
  /// =========================================

  Future<void> sendReply() async {

    final text =
        replyController.text.trim();

    if (text.isEmpty ||
        isSendingReply) {
      return;
    }

    setState(() {
      isSendingReply = true;
    });

    try {

      await ref
          .read(commentProvider(widget.postId).notifier).addReply(
            parentId: widget.comment.id,
            content: text,
          );

      replyController.clear();

      setState(() {
        showReplyInput = false;
      });

    } catch (e) {
      //
    }

    if (mounted) {
      setState(() {
        isSendingReply = false;
      });
    }
  }

  @override
  void dispose() {
    replyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final comment = widget.comment;

    return Padding(
      padding: EdgeInsets.only(
        left: widget.isReply ? 52 : 12,
        right: 12,
        top: 6,
        bottom: 6,
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          /// =====================================
          /// 🔥 COMMENT ROW
          /// =====================================

          Row(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              /// avatar
              CircleAvatar(
                radius:
                    widget.isReply ? 14 : 18,

                backgroundImage:
                    comment.author.avatarUrl != null
                        ? NetworkImage(
                            comment.author
                                .avatarUrl!,
                          )
                        : null,

                child:
                    comment.author.avatarUrl ==
                            null
                        ? const Icon(
                            Icons.person,
                            size: 16,
                          )
                        : null,
              ),

              const SizedBox(width: 10),

              /// content
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                  children: [

                    /// bubble
                    Container(
                      padding:
                          const EdgeInsets.all(
                        12,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.grey[200],

                        borderRadius:
                            BorderRadius
                                .circular(16),
                      ),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                        children: [

                          /// name
                          Text(
                            comment.author
                                .fullName,

                            style:
                                const TextStyle(
                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),

                          const SizedBox(
                              height: 4),

                          /// content
                          Text(
                            comment.content,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 4),

                    /// =================================
                    /// 🔥 ACTION ROW
                    /// =================================

                    Padding(
                      padding:
                          const EdgeInsets.only(
                        left: 8,
                      ),

                      child: Row(
                        children: [

                          /// time
                          Text(
                            timeago.format(
                              comment.createdAt,
                            ),

                            style:
                                const TextStyle(
                              fontSize: 12,
                              color:
                                  Colors.grey,
                            ),
                          ),

                          const SizedBox(
                              width: 12),

                          /// reply
                          GestureDetector(
                            onTap: () {

                              setState(() {
                                showReplyInput =
                                    !showReplyInput;
                              });
                            },

                            child: const Text(
                              "Reply",

                              style: TextStyle(
                                fontSize: 12,
                                fontWeight:
                                    FontWeight
                                        .w600,
                                color:
                                    Colors.grey,
                              ),
                            ),
                          ),

                          /// replies toggle
                          if (comment.replies
                              .isNotEmpty) ...[

                            const SizedBox(
                                width: 12),

                            GestureDetector(
                              onTap: () {

                                setState(() {
                                  showReplies =
                                      !showReplies;
                                });
                              },

                              child: Text(
                                showReplies
                                    ? "Hide replies"
                                    : "View ${comment.replies.length} replies",

                                style:
                                    const TextStyle(
                                  fontSize: 12,
                                  fontWeight:
                                      FontWeight
                                          .w600,

                                  color:
                                      Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),

                    /// =================================
                    /// 🔥 REPLY INPUT
                    /// =================================

                    if (showReplyInput)

                      Padding(
                        padding:
                            const EdgeInsets.only(
                          top: 8,
                        ),

                        child: Row(
                          children: [

                            Expanded(
                              child: TextField(
                                controller:
                                    replyController,

                                minLines: 1,
                                maxLines: 3,

                                decoration:
                                    InputDecoration(
                                  hintText:
                                      "Write a reply...",

                                  filled: true,

                                  fillColor:
                                      Colors
                                          .grey[100],

                                  border:
                                      OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius
                                            .circular(
                                      20,
                                    ),

                                    borderSide:
                                        BorderSide
                                            .none,
                                  ),

                                  contentPadding:
                                      const EdgeInsets
                                          .symmetric(
                                    horizontal:
                                        14,

                                    vertical: 10,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(
                                width: 8),

                            CircleAvatar(
                              radius: 18,

                              backgroundColor:
                                  Colors.blue,

                              child: IconButton(
                                icon:
                                    isSendingReply
                                        ? const SizedBox(
                                            height:
                                                14,

                                            width:
                                                14,

                                            child:
                                                CircularProgressIndicator(
                                              color:
                                                  Colors.white,

                                              strokeWidth:
                                                  2,
                                            ),
                                          )
                                        : const Icon(
                                            Icons.send,
                                            color:
                                                Colors.white,

                                            size:
                                                18,
                                          ),

                                onPressed:
                                    isSendingReply
                                        ? null
                                        : sendReply,
                              ),
                            ),
                          ],
                        ),
                      ),

                    /// =================================
                    /// 🔥 REPLIES
                    /// =================================

                    if (comment.replies
                            .isNotEmpty &&
                        showReplies)

                      Padding(
                        padding:
                            const EdgeInsets.only(
                          top: 8,
                        ),

                        child: Column(
                          children:
                              comment.replies
                                  .map(
                                    (reply) =>
                                        CommentCard(
                                      comment:
                                          reply,

                                      postId:
                                          widget
                                              .postId,

                                      isReply:
                                          true,
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}