import 'package:flutter/cupertino.dart';

import '../models/todo_model.dart';
import '../repositories/todo_repository.dart';

class HomeController{
  List<ToDoModel> toDos = [];
  final ToDoRepository _repository;
  final state = ValueNotifier<HomeState>(HomeState.start);

  HomeController([ToDoRepository? repository])
    : _repository = repository ?? ToDoRepository();

  Future start() async{
    state.value = HomeState.loading;
    try{
      toDos = await _repository.fetchToDos();
      state.value = HomeState.sucess;
    } catch (e){
      state.value = HomeState.error;
    }
  }

}

enum HomeState {start, loading, sucess, error}