import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/custom_text_input.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _title =TextEditingController() ;
    final auth= FirebaseAuth.instance;
    final userid= auth.currentUser?.uid;
    final db= FirebaseFirestore.instance;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
      
          }, icon: Icon(Icons.arrow_back),),
        ),
        body: Column(
          children: [
            customTextInput(
              controller: _title,
              icon: Icon(Icons.abc),
              isObscure: false,
              hint: 'enter task name'),
            ElevatedButton(onPressed: () async{
              //*create task and navigate to home
              final docRef = db.collection('App').doc('task').collection(userid!);
              final title= _title.text;
              final task = {
                'title': title
      
              };
              await docRef.add(task);
              Navigator.pop(context);
            }, child: Text('create task'))
          ],
        ),
      ),
    );
  }
}