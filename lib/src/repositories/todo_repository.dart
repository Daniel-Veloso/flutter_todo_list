import 'package:dio/dio.dart';
import '../models/todo_model.dart';

class ToDoRepository{

  final Dio dio = Dio();
  final url = 'https://jsonplaceholder.typicode.com/todos';

  Future fetchToDos() async{
    
    final response = await dio.get(url);
    final list = response.data as List;

    List<ToDoModel> toDos = [];

    for(var json in list){
      final toDo = ToDoModel.fromJson(json);
      toDos.add(toDo);
    }

    return toDos;
    
  }
  
}