import '../models/todo_model.dart';
import '../repositories/todo_repository.dart';

class HomeController{
  List<ToDoModel> toDos = [];
  final repository = ToDoRepository();

  Future start() async{
    toDos = await repository.fetchToDos();
  }
  
}