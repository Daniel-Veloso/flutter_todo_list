import '../models/todo_model.dart';
import '../repositories/todo_repository.dart';

class HomeController{
  List<ToDoModel> toDos = [];
  final _repository;

  HomeController([ToDoRepository? repository])
    : _repository = repository ?? ToDoRepository();

  Future start() async{
    toDos = await _repository.fetchToDos();
  }

}