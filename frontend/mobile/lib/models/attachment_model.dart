class Attachment {
  final int id;
  final String url;
  final String type; // image, video, pdf, file
  final String? name;

  final int? fileSize; // bytes
  final String? mimeType;
  final String? thumbnailUrl;

  Attachment({
    required this.id,
    required this.url,
    required this.type,
    this.name,
    this.fileSize,
    this.mimeType,
    this.thumbnailUrl,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['id'],
      url: json['url'],
      type: json['type'],
      name: json['name'],
      fileSize: json['file_size'],
      mimeType: json['mime_type'],
      thumbnailUrl: json['thumbnail_url'],
    );
  }
}
