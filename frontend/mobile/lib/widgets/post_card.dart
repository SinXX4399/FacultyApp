import 'package:flutter/material.dart';
import '../../models/post_model.dart';
import '../../services/api_service.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screens/post/post_detail_screen.dart';
import '../screens/post/image_gallery_screen.dart';
import '../screens/post/file_list_screen.dart';

class PostCard extends StatefulWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late Post post;
  bool isLoading = false;
  bool get isExpired {
    return DateTime.now().isAfter(post.deadline);
  }

  Duration? get remaining {
    return post.deadline.difference(DateTime.now());
  }

  @override
  void initState() {
    super.initState();
    post = widget.post;
  }

  String _formatSize(int bytes) {
    if (bytes < 1024) return "$bytes B";
    if (bytes < 1024 * 1024) {
      return "${(bytes / 1024).toStringAsFixed(1)} KB";
    }
    return "${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB";
  }

  Future<void> acknowledge() async {
    if (post.isAcknowledged || isLoading) return;

    setState(() {
      isLoading = true;
      post.isAcknowledged = true;
      post.acknowledgedCount++;
    });

    try {
      await ApiService.acknowledgePost(post.id);
    } catch (e) {
      setState(() {
        post.isAcknowledged = false;
        post.acknowledgedCount--;
      });
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PostDetailScreen(post: post),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              blurRadius: 6,
              color: Colors.black12,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Header

            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: post.author.avatarUrl != null
                      ? NetworkImage(post.author.avatarUrl!)
                      : null,
                  child: post.author.avatarUrl == null
                      ? const Icon(Icons.person)
                      : null,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.author.fullName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat("dd MMM yyyy, hh:mm a").format(post.createdAt),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(height: 12),

            /// 🔹 Title
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.only(
                top: 8,
              ),
            ),

            /// 🔥 Preview content (3 lines max)
            LayoutBuilder(
              builder: (context, constraints) {
                final text = post.content;

                const int maxChars = 120;
                final isLong = text.length > maxChars;

                final previewText = isLong ? text.substring(0, maxChars) : text;

                return RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(text: previewText),
                      if (isLong)
                        const TextSpan(
                          text: "...more",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),

            /// 🔹 Attachments preview
            const SizedBox(height: 10),
            _buildAttachments(post),

            const SizedBox(height: 12),

            /// 🔹 Footer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.schedule,
                      color: Colors.blue,
                      size: 18,
                    ),
                    SizedBox(width: 6),
                    Text(
                      "Deadline: ${DateFormat("dd MMM yyyy").format(post.deadline)}",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: post.isAcknowledged ? null : acknowledge,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        post.isAcknowledged ? Colors.grey : Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(
                          post.isAcknowledged ? "Acknowledged" : "Acknowledge",
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 Attachments (IMAGE + FILE)
  Widget _buildAttachments(Post post) {
    if (post.attachments.isEmpty) return const SizedBox();

    final images = post.attachments.where((a) => a.type == "image").toList();

    final files = post.attachments.where((a) => a.type != "image").toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// =========================
        /// 🖼 IMAGES
        /// =========================

        /// ✅ 1 IMAGE → FULL WIDTH
        if (images.length == 1)
          Builder(
            builder: (context) {
              final image = images.first;

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ImageGalleryScreen(
                        imageUrls: [image.url],
                        initialIndex: 0,
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    image.url,
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),

        /// ✅ MULTIPLE IMAGES → GRID
        if (images.length > 1)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: images.length > 4 ? 4 : images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            ),
            itemBuilder: (context, index) {
              final image = images[index];
              final imageUrls = images.map((e) => e.url).toList();

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ImageGalleryScreen(
                        imageUrls: imageUrls,
                        initialIndex: index,
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        image.url,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    /// 🔥 "+X" overlay
                    if (index == 3 && images.length > 4)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "+${images.length - 4}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),

        /// spacing between sections
        if (images.isNotEmpty && files.isNotEmpty) const SizedBox(height: 10),

        /// =========================
        /// 📄 FILES
        /// =========================
        if (files.isNotEmpty)
          Column(
            children: [
              ...files.take(2).map((file) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    file.name?.endsWith(".pdf") == true
                        ? Icons.picture_as_pdf
                        : Icons.insert_drive_file,
                    color: Colors.blue,
                  ),
                  title: Text(
                    file.name ?? "File",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(_formatSize(file.fileSize ?? 0)),
                  onTap: () async {
                    final url = Uri.parse(file.url);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                );
              }),

              /// 🔥 "+X more files"
              if (files.length > 2)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FileListScreen(files: files),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      "+${files.length - 2} more files",
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
