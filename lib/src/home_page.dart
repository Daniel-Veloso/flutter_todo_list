import 'package:flutter/material.dart';
import 'controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  _sucess() {
    return ListView.builder(
      itemCount: controller.toDos.length,
      itemBuilder: (context, index) {
        var toDo = controller.toDos[index];
        return ListTile(
          leading: Checkbox(
            value: toDo.completed,
            onChanged: (bool? value) {},
          ),
          title: Text(toDo.title.toString()),
        );
      },
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controller.start();
        },
        child: const Text('Tentar novamente'),
      ),
    );
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.error:
        return _error();
      case HomeState.sucess:
        return _sucess();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Todo\'s'),
        actions: [
          IconButton(
            onPressed: (){
              controller.start();
            },
            icon: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}
