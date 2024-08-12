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
  Future<Stream<List<TaskEntity>>> getTasks() async {
    final id = await storage.read(key: SecureStorageKeys.userId.key);

    final snapshots = firestore.collection('tasks').doc(id).snapshots();

    return snapshots.map(
      (snapshot) {
        if (snapshot.exists) {
          List<Map<String, dynamic>> tasksData =
              List<Map<String, dynamic>>.from(snapshot.get('tasks'));

          return tasksData.map((task) => TaskModel.fromJson(task)).toList();
        } else {
          return [];
        }
      },
    );
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
