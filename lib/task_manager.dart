import 'task.dart';

class TaskManager {
  final List<Task> _tasks = [];

  void addTask(String title, String description) {
    final task = Task(title: title, description: description);
    _tasks.add(task);
    print('\n✅ Tarefa "${task.title}" criada!');
  }

  void listTasks() {
    if (_tasks.isEmpty) {
      print('\n📭 Nenhuma tarefa encontrada.');
      return;
    }
    print('\n--- Lista de Tarefas ---');
    _tasks.forEach(print);
  }

  void deleteTask(int id) {
    int lengthBefore = _tasks.length;
    _tasks.removeWhere((t) => t.id == id);
    _tasks.length < lengthBefore 
      ? print('\n🗑️ Tarefa removida.') 
      : print('\n⚠️ ID não encontrado.');
  }

  void toggleTaskStatus(int id) {
    try {
      var task = _tasks.firstWhere((t) => t.id == id);
      task.isCompleted = !task.isCompleted;
      print('\n🔄 Status alterado!');
    } catch (_) {
      print('\n⚠️ Tarefa não encontrada.');
    }
  }

  void editTask(int id, String title, String desc) {
    try {
      var task = _tasks.firstWhere((t) => t.id == id);
      if (title.isNotEmpty) task.title = title;
      if (desc.isNotEmpty) task.description = desc;
      print('\n📝 Tarefa editada!');
    } catch (_) {
      print('\n⚠️ Tarefa não encontrada.');
    }
  }
}
