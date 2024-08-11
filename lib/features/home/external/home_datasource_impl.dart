import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:keener_challenge/core/domain/entities/task_entity.dart';
import 'package:keener_challenge/core/infra/models/task_model.dart';
import 'package:keener_challenge/core/secure_storage/keys/secure_storage_keys.dart';
import 'package:keener_challenge/core/secure_storage/secure_storage.dart';
import 'package:keener_challenge/features/home/infra/datasource/home_datasource.dart';

class HomeDatasourceImpl implements HomeDatasource {
  final FirebaseFirestore firestore;
  final SecureStorage storage;

  HomeDatasourceImpl({
    required this.firestore,
    required this.storage,
  });

  @override
  Future<List<TaskEntity>> getTasks() async {
    final id = await storage.read(key: SecureStorageKeys.userId.key);

    final result = await firestore.collection('tasks').doc(id).get();

    final List? tasks = result.data()?['tasks'];

    if (tasks == null) {
      return [];
    }

    return tasks.map((e) => TaskModel.fromJson(e)).toList();
  }

  @override
  Future<bool> deleteTask(TaskEntity entity) async {
    final id = await storage.read(key: SecureStorageKeys.userId.key);

    final value = TaskModel(
      description: entity.description,
      isCompleted: entity.isCompleted,
      title: entity.title,
    ).toJson();

    await firestore.collection('tasks').doc(id).update(
      {
        'tasks': FieldValue.arrayRemove([value]),
      },
    );
    return true;
  }
}
