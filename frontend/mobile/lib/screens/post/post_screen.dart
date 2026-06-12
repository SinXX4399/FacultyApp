import 'package:flutter/material.dart';
import 'package:mobile/widgets/app_scaffold.dart';
import '../../widgets/post_card.dart';
import '../../widgets/post_shimmer.dart';
import '../../providers/post_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key});

  @override
  ConsumerState<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  final ScrollController _controller = ScrollController();
  int selectedTab = 0;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(postProvider.notifier).fetchPosts();
    });

    _controller.addListener(() {
      final state = ref.read(postProvider);

      if (_controller.position.pixels >=
              _controller.position.maxScrollExtent - 200 &&
          state.hasMore &&
          !state.isLoading) {
        ref.read(postProvider.notifier).fetchPosts();
      }
    });
  }

  int _newPostCount(List posts) {
    return posts.where((p) => !p.isAcknowledged).length;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postProvider);

    final filteredPosts = selectedTab == 0
        ? state.posts.where((p) => !p.isAcknowledged).toList()
        : state.posts.where((p) => p.isAcknowledged).toList();

    return  AppScaffold(
        title: "POSTS",
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
              if (_newPostCount(state.posts) > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "${_newPostCount(state.posts)}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
            ],
          )
        ],
      
      body: Column(
        children: [
          _buildTabs(state.posts),
          Expanded(
            child: state.isLoading && state.posts.isEmpty
                ? _buildLoading()
                : RefreshIndicator(
                    onRefresh: () => ref
                        .read(postProvider.notifier)
                        .fetchPosts(refresh: true),
                    child: ListView.builder(
                      controller: _controller,
                      itemCount: filteredPosts.length + 1,
                      itemBuilder: (context, index) {
                        if (index < filteredPosts.length) {
                          return PostCard(post: filteredPosts[index]);
                        } else {
                          return state.hasMore
                              ? const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                )
                              : const SizedBox();
                        }
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (_, __) => const PostShimmer(),
    );
  }

  Widget _buildTabs(List posts) {
    final newCount = posts.where((p) => !p.isAcknowledged).length;
    final oldCount = posts.where((p) => p.isAcknowledged).length;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          _tab("New ($newCount)", 0),
          const SizedBox(width: 10),
          _tab("Old ($oldCount)", 1),
        ],
      ),
    );
  }

  Widget _tab(String title, int index) {
    final active = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: active ? Colors.red : Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: active ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
