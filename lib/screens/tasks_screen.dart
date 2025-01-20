import 'package:flutter/material.dart';
import '../widgets/task_form.dart';
import '../widgets/task_tile.dart';
import '../models/task.dart';
import '../services/storage_service.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  TasksScreenState createState() => TasksScreenState();
}

class TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Future<void> loadTasks() async {
    setState(() => isLoading = true);

    try {
      final loadedTasks = await StorageService.loadTasks();
      if (loadedTasks != null) {
        setState(() {
          tasks = loadedTasks.map((item) => Task.fromJson(item)).toList();
        });
      }
    } catch (e) {
      print('Erro ao carregar tarefas: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> saveTasks() async {
    try {
      await StorageService.saveTasks(
        tasks.map((task) => task.toJson()).toList(),
      );
    } catch (e) {
      print('Erro ao salvar tarefas: $e');
    }
  }

  void addTask(Task task) async {
    setState(() => tasks.add(task));
    await saveTasks();
  }

  void updateTask(int index, Task task) async {
    setState(() => tasks[index] = task);
    await saveTasks();
  }

  void deleteTask(int index) async {
    setState(() => tasks.removeAt(index));
    await saveTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Tarefas'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
      ),
      body: isLoading
    ? const Center(child: CircularProgressIndicator())
    : tasks.isEmpty
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.inbox,
                  size: 96,
                  color: Colors.blue.shade300,
                ),
                const SizedBox(height: 16),
                Text(
                  'Nenhuma tarefa adicionada!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.blue.shade600),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: tasks.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              return TaskTile(
                task: tasks[index],
                onEdit: () async {
                  final result = await showModalBottomSheet<Task>(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => TaskForm(task: tasks[index]),
                  );
                  if (result != null) {
                    updateTask(index, result);
                  }
                },
                onDelete: () => deleteTask(index),
              );
            },
          ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await showModalBottomSheet<Task>(
            context: context,
            isScrollControlled: true,
            builder: (context) => const TaskForm(),
          );
          if (result != null) addTask(result);
        },
        label: const Text('Nova Tarefa'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
