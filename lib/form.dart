import 'package:flutter/material.dart';

class form extends StatefulWidget {
  @override
  formstate createState() => formstate();
}

class formstate extends State<form> {
  final formkey = GlobalKey<FormState>();
  var name = "";
  var surname = "";
  var email = "";
  var pass = "";
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Name:', labelStyle: TextStyle(fontSize: 30)),
              controller: nameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please enter the name';
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Surname:', labelStyle: TextStyle(fontSize: 30)),
              controller: surnameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please enter the surname';
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Email:', labelStyle: TextStyle(fontSize: 30)),
              controller: emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please enter eamil';
                } else if (!value.contains('@')) {
                  return 'please enter valide email';
                }
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'password:',
                  labelStyle: TextStyle(fontSize: 30),
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 20)),
              controller: passController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please enter password';
                }
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    setState(() {
                      name = nameController.text;
                      surname = surnameController.text;
                      email = emailController.text;
                      pass = passController.text;
                    });
                  }
                },
                child: Text('Submit')),
            Center(child: Text('Output', style: TextStyle(fontSize: 30))),
            Center(
                child: Text('your entered details',
                    style: TextStyle(fontSize: 20))),
            Text('name: $name', style: TextStyle(fontSize: 20)),
            Text('surname: $surname', style: TextStyle(fontSize: 20)),
            Text('email: $email', style: TextStyle(fontSize: 20)),
            Text('pass: $pass', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
