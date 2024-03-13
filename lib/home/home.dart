import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lalilo/home/bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  final usernameField = TextEditingController();
  final passwordField = TextEditingController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("App to TodoApp")),
        body: BlocProvider(
          create: (context) => HomeBloc(),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeInitial) {
                return Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(labelText: "UserName"),
                      controller: usernameField,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "Password"),
                      controller: passwordField,
                    ),
                    ElevatedButton(
                      onPressed: () => BlocProvider.of<HomeBloc>(context).add(
                          LoginEvent(usernameField.text, passwordField.text)),
                      child: const Text("Login"),
                    )
                  ],
                );
              }
              return Container();
            },
          ),
        ));
  }
}
