import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/src/repositories/todo_repository.dart';

main(){

  final repository = ToDoRepository();

  test('Should bring a list of ToDoModel', () async{
    final list = await repository.fetchToDos();
    print(list[1].title);
    expect(list[1].title, 'quis ut nam facilis et officia qui');
  });

}