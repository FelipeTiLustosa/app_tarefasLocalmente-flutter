// lib/services/storage_service.dart
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String TASKS_KEY = 'tasks_data';
  
  static Future<void> saveTasks(List<dynamic> tasks) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String tasksJson = jsonEncode(tasks);
      await prefs.setString(TASKS_KEY, tasksJson);
      print('Dados salvos com sucesso: $tasksJson'); // Debug log
    } catch (e) {
      print('Erro ao salvar dados: $e'); // Debug log
    }
  }
  
  static Future<List<dynamic>?> loadTasks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? tasksJson = prefs.getString(TASKS_KEY);
      print('Dados carregados: $tasksJson'); // Debug log
      
      if (tasksJson != null && tasksJson.isNotEmpty) {
        return jsonDecode(tasksJson);
      }
    } catch (e) {
      print('Erro ao carregar dados: $e'); // Debug log
    }
    return null;
  }
}