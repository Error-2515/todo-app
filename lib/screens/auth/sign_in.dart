import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:todo_app/widgets/custom_text_input.dart";

class SignInScreen extends StatelessWidget{
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context){
    final TextEditingController _Email = TextEditingController();
    final TextEditingController _Password = TextEditingController();
    final auth = FirebaseAuth.instance;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
             Center(
               child: Text(
                'sign-in screen',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
                         ),
             ),
             CustomTextInput(
              controller: _Email ,
              icon: Icon(Icons.email),
              isObscure: false,
              hint: 'enter your email',
              keyboard: TextInputType.emailAddress,),
              CustomTextInput(
              controller: _Password ,
              icon: Icon(Icons.password),
              isObscure: true,
              hint: 'enter your password',
              keyboard: TextInputType.emailAddress,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(onPressed: () async{
                  //*authenticate and navigate to home
                  final String email= _Email.text;
                  final String password= _Password.text;
                  await auth.signInWithEmailAndPassword(email: email, password: password);
                  Navigator.pushReplacementNamed(context, '/home');
                }, child: Text('sign-in')),
              ),
              TextButton(onPressed: () {
                //*Navigate to register screen
                Navigator.pushReplacementNamed(context, '/register');
              }, child: Text('register here'))
              
              
          ],
        ),
      ),
    );
  }
}

