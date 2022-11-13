import '../models/todo_model.dart';
import '../repositories/todo_repository.dart';

class HomeController{
  List<ToDoModel> toDos = [];
  final _repository;
  HomeState state = HomeState.start;

  HomeController([ToDoRepository? repository])
    : _repository = repository ?? ToDoRepository();

  Future start() async{
    state = HomeState.loading;
    try{
      toDos = await _repository.fetchToDos();
      state = HomeState.sucess;
    } catch (e){
      state = HomeState.error;
    }
  }

}

enum HomeState {start, loading, sucess, error}