import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:keener_challenge/core/domain/entities/task_entity.dart';
import 'package:keener_challenge/core/infra/models/task_model.dart';
import 'package:keener_challenge/core/secure_storage/keys/secure_storage_keys.dart';
import 'package:keener_challenge/core/secure_storage/secure_storage.dart';
import 'package:keener_challenge/features/add_task/infra/datasource/add_task_datasource.dart';

class AddTaskDatasourceImpl implements AddTaskDatasource {
  final FirebaseFirestore firestore;
  final SecureStorage storage;

  AddTaskDatasourceImpl({
    required this.firestore,
    required this.storage,
  });

  @override
  Future<bool> addTask(TaskEntity entity) async {
    final id = await storage.read(key: SecureStorageKeys.userId.key);

    final value = TaskModel(
      description: entity.description,
      isCompleted: entity.isCompleted,
      title: entity.title,
    ).toJson();

    final docRef = firestore.collection('tasks').doc(id);

    final docSnapshots = await docRef.get();

    if (docSnapshots.exists) {
      await docRef.update(
        {
          'tasks': FieldValue.arrayUnion([value]),
        },
      );
    } else {
      await firestore.collection('tasks').doc(id).set(
        {
          'tasks': FieldValue.arrayUnion([value]),
        },
      );
    }
    return true;
  }
}
