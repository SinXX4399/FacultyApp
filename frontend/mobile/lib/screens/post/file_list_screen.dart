import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/attachment_model.dart';

class FileListScreen extends StatelessWidget {
  final List<Attachment> files;

  const FileListScreen({super.key, required this.files});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attachments")),
      body: ListView.separated(
        itemCount: files.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final file = files[index];

          return ListTile(
            leading: Icon(
              file.name?.endsWith(".pdf") == true
                  ? Icons.picture_as_pdf
                  : Icons.insert_drive_file,
              color: Colors.blue,
            ),
            title: Text(file.name ?? "File"),
            subtitle: Text(_formatSize(file.fileSize ?? 0)),
            onTap: () async {
              final url = Uri.parse(file.url);
              if (await canLaunchUrl(url)) {
                await launchUrl(url,
                    mode: LaunchMode.externalApplication);
              }
            },
          );
        },
      ),
    );
  }

  String _formatSize(int bytes) {
    if (bytes < 1024) return "$bytes B";
    if (bytes < 1024 * 1024) {
      return "${(bytes / 1024).toStringAsFixed(1)} KB";
    }
    return "${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB";
  }
}