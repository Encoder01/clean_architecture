import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_test_project/modules/auth/bloc/auth_bloc.dart';
import 'package:interview_test_project/modules/auth/models/user_model.dart';
import 'package:interview_test_project/modules/dashboard/bloc/todo_bloc.dart';
import 'package:interview_test_project/modules/dashboard/models/todo.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../constants/functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String version = '';
  String appName = '';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TodoBloc>(context).add(TodoGet());
    getInfo();
    checkConnectivity();
  }

  checkConnectivity() {
    Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile || event == ConnectivityResult.wifi) {
        showSnackBar(context, 'İnternet var');
      } else {
        showSnackBar(context, 'İnternet yok');
      }
    });
  }

  getInfo() async {
    var packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    appName = packageInfo.appName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: floatingActionButtons(context),
        appBar: AppBar(
          title: const Text('HomePage'),
          actions: [
            IconButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(AuthExitEvent());
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
          if (state is TodoLoaded) {
            return ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (context, index) {
                  return todoListItem(state.todos[index], index);
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }

  todoListItem(todoItem, index) {
    return ListTile(
      leading: Text('${index + 1}'),
      title: Text(todoItem.todo),
      trailing: popupMenuButton(todoItem),
    );
  }

  PopupMenuButton<int> popupMenuButton(todoItem) {
    return PopupMenuButton(
      onSelected: (value) {
        switch (value) {
          case 1:
            BlocProvider.of<TodoBloc>(context).add(TodoUpdate(
                todoItem.id, TodoModel(todo: 'Updated Todo', id: todoItem.id)));
            break;
          case 2:
            BlocProvider.of<TodoBloc>(context).add(TodoDelete(
              todoItem.id,
            ));
            break;
          default:
            print('Böyle Bir İşlem Yok');
            break;
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(
            child: Text('Update'),
            value: 1,
          ),
          const PopupMenuItem(
            child: Text('Delete'),
            value: 2,
          ),
        ];
      },
    );
  }

  Column floatingActionButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            showSnackBar(context, 'Name Application $appName and  version $version');
          },
          child: const Icon(Icons.verified_sharp),
        ),
        SizedBox(
          height: 20,
        ),
        FloatingActionButton(
          onPressed: () {
            var id = const Uuid().v4();
            BlocProvider.of<TodoBloc>(context)
                .add(TodoAdd(todo: TodoModel(todo: 'Added Todo', id: id)));
          },
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
