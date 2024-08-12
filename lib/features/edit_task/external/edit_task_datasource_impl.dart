import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:keener_challenge/core/domain/entities/task_entity.dart';
import 'package:keener_challenge/core/infra/models/task_model.dart';
import 'package:keener_challenge/core/secure_storage/keys/secure_storage_keys.dart';
import 'package:keener_challenge/core/secure_storage/secure_storage.dart';
import 'package:keener_challenge/features/edit_task/infra/datasource/edit_task_datasource.dart';

class EditTaskDatasourceImpl implements EditTaskDatasource {
  final FirebaseFirestore firestore;
  final SecureStorage storage;

  EditTaskDatasourceImpl({
    required this.firestore,
    required this.storage,
  });
  @override
  Future<bool> editTask(List<TaskEntity> entity) async {
    final id = await storage.read(key: SecureStorageKeys.userId.key);

    List<Map<String, dynamic>> arrayMap = entity
        .map(
          (entity) => TaskModel(
            isCompleted: entity.isCompleted,
            title: entity.title,
            description: entity.description,
          ).toJson(),
        )
        .toList();

    await firestore.collection('tasks').doc(id).update(
      {
        'tasks': arrayMap,
      },
    );
    return true;
  }
}
