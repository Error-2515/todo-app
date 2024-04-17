import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/screens/auth/home_page.dart';
import 'package:todo_app/screens/auth/register.dart';
import 'package:todo_app/screens/auth/sign_in.dart';
import 'package:todo_app/screens/auth/tasks/create_task_screen.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        
        
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 255, 242)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
      routes: {
        '/home':(context) => HomeScreen(),
        '/sign-in':(context) => SignInScreen(),
        '/register':(context) => RegistrationScreen(),
        '/createtask':(context) => CreateTaskScreen()
      },
    );
  }
}
