import 'package:flutter/material.dart';
import 'package:midterm_02/repositories/todo_repository.dart';
import 'package:midterm_02/screens/todos.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController userId = TextEditingController();

  @override
  void dispose() {
    userId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: userId,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Please enter User ID',
                labelText: 'User ID',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter valid User ID!';
                }

                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(
                    context,
                    Todos.routeName,
                  );

                  TodoRepository.userId = userId.text;
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
