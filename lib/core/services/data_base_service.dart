import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

abstract class DataBaseService {
  Future addUserData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  });

  Future<bool> ifDataExists({
    required String path,
    required String documentId,
  });
}
