import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list/src/controllers/home_controller.dart';
import 'package:todo_list/src/models/todo_model.dart';
import 'package:todo_list/src/repositories/todo_repository.dart';

class ToDoRepositoryMock extends Mock implements ToDoRepository{  
}

main(){
  final repository = ToDoRepositoryMock();
  final controller = HomeController(repository);

  test("must fill toDo variable", () async{

    when(() => repository.fetchToDos()).thenAnswer((_) async => [ToDoModel()]);

    await controller.start();
    expect(controller.toDos.isNotEmpty, true);
  });
}