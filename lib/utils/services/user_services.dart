import 'package:firebase_auth/firebase_auth.dart';
import 'package:interview_test_project/modules/auth/models/user_model.dart';
import 'package:interview_test_project/modules/dashboard/models/todo.dart';

import '../../constants/firebase_constants.dart';

class UserServices {
  Future<User?> currentUser() async {
    return auth.currentUser;
  }

  Future saveUser(User? comeUser) async {
    await firestore
        .collection('users')
        .doc(comeUser!.uid)
        .set({'email': comeUser.email, 'id': comeUser.uid});
  }

  Future<UserModel> readUser(String uid) async {
    var source = await firestore.collection('users').doc(uid).get();
    return UserModel.fromDoc(source);
  }

  Future<List<TodoModel>> getTodos() async {
    var snapshot = await todosCollection.get();
    var todoList = <TodoModel>[];
    for (var item in snapshot.docs) {
      todoList.add(TodoModel.fromJson(item.data()));
    }
    return todoList;
  }

  Future addTodo(TodoModel todo, String id) async {
    await todosCollection.doc(id).set({'todo': todo.todo, 'id': id});
    return getTodos();
  }

  Future updateTodo(id, todo) async {
    await todosCollection.doc(id).update({'todo':  todo.todo});
    return getTodos();
  }

  Future deleteTodo(id) async {
    await todosCollection.doc(id).delete();
    return getTodos();
  }
}
