import 'package:flutter/material.dart';
import 'controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  _sucess(){
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('item $index'),
          );
        },
      );
  }

  _error(){
    return Center(
      child: ElevatedButton(
        onPressed: (){},
        child: const Text('Tentar novamente'),
      ),
    );
  }

  _loading(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _start(){
    return Container();
  }

  stateManagement(HomeState state){
    switch (state) {
      case HomeState.start :
        return _start();
      case HomeState.loading :
        return _loading();
      case HomeState.error :
        return _error();
      case HomeState.sucess :
        return _sucess();
      default:
        return _start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Todo\'s'),
      ),
      body: stateManagement(HomeState.sucess), 
    );
  }
}
