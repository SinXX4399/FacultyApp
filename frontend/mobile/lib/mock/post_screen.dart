import 'package:flutter/material.dart';
import '../../widgets/post_card.dart';
import './mock_posts.dart';
import '../screens/post/comment_screen.dart';
import '../../widgets/app_scaffold.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  int selectedTab = 0;

  int _newPostCount(List posts) {
    return posts.where((p) => !p.isAcknowledged).length;
  }

  @override
  Widget build(BuildContext context) {
    final posts = mockPosts;

    final filteredPosts = selectedTab == 0
        ? posts.where((p) => !p.isAcknowledged).toList()
        : posts.where((p) => p.isAcknowledged).toList();

    return AppScaffold(
     
        title: "POSTS",
      
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
              if (_newPostCount(posts) > 0)
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
                      "${_newPostCount(posts)}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
     

      body: Column(
        children: [
          _buildTabs(posts),

          Expanded(
            child: ListView.builder(
              itemCount: filteredPosts.length,
              itemBuilder: (context, index) {
                final post = filteredPosts[index];

                return Column(
                  children: [
                    PostCard(post: post),

                    /// 🔥 Comment button (mock navigation)
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 8),
                      child: Row(
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      CommentScreen(postId: post.id),
                                ),
                              );
                            },
                            icon: const Icon(Icons.comment),
                            label: const Text("Comments"),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
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
