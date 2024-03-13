import 'package:hive/hive.dart';
import 'package:lalilo/model/task.dart';

class TodoService {
  late Box<Task> _todos;
  final String todosBox = "todosBox";

  Future<void> init() async {
    Hive.registerAdapter(TaskAdapter());
    _todos = await Hive.openBox(todosBox);
  }

  List<Task> getTask(final String username) {
    final tasks = _todos.values.where((element) => element.user == username);
    return tasks.toList();
  }

  void addTask(final String task, final String username) {
    _todos.add(Task(username, task, false));
  }

  Future<void> removeTask(final String task, final String username) async {
    final taskToRemove = _todos.values.firstWhere((element) => element.task == task && element.user == username);
    await taskToRemove.delete();
  }

  Future<void> updatedTask(final String task, final String username, {final bool? completed}) async   {
    final taskToUpdate = _todos.values.firstWhere((element) => element.task == task && element.user == username);
    final index = taskToUpdate.key as int;
    await _todos.put(index, Task(username, task, completed ?? taskToUpdate.completed));
  }
}
