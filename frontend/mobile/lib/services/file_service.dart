// lib/services/file_service.dart
import 'package:file_picker/file_picker.dart';
import 'api_service.dart';

class FileService {
  static Future<void> pickAndUpload() async {
   FilePickerResult? result = await FilePicker.pickFiles();

    if (result != null) {
      final file = result.files.first;

      await ApiService.uploadFile(
        filePath: file.path!,
        fileName: file.name,
      );
    }
  }
}