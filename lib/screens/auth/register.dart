import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/custom_text_input.dart';

class RegistrationScreen extends StatelessWidget{
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context){
    final TextEditingController _name = TextEditingController();
    final TextEditingController _email = TextEditingController();
    final TextEditingController _password = TextEditingController();
    final auth = FirebaseAuth.instance;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('register here'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              //*navigate back to sign in page
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)
          ),
        ),
        body: Column(
          children: [
            customTextInput(
              controller: _name,
              icon: Icon(Icons.person),
              isObscure: false,
              hint: 'enter your name'),
              customTextInput(
              controller: _email,
              icon: Icon(Icons.email),
              isObscure: false,
              hint: 'enter your email'),
              customTextInput(
              controller: _password,
              icon: Icon(Icons.password),
              isObscure: true,
              hint: 'enter your password'),
              ElevatedButton(onPressed: () {
                //*create user and navigate to homescreen
                final String email = _email.text;
                final String password = _password.text;
                auth.createUserWithEmailAndPassword(email: email, password: password);
      
                Navigator.pushNamed(context, '/home');
              }, child: Text('Register'))
          ],
      
        ),
      ),
    );
  }
}