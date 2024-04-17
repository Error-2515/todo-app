import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final db=FirebaseFirestore.instance;
    final auth= FirebaseAuth.instance;
    final userid= auth.currentUser?.uid;
    final docRef = db.collection('App').doc('task').collection(userid!);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(72, 0, 255, 242),
          actions: [
        
            ElevatedButton(
                onPressed: () {
                  auth.signOut();
                  Navigator.pop(context);
                },
                child: const Text("Sign Out")),
          ],
          title: const Text("Home Page"),
          centerTitle: true,),
        floatingActionButton: IconButton(
          onPressed: (){ 
            //*navigate to create task
            Navigator.pushNamed(context, '/createtask');
          },
          icon: Icon(Icons.add),
        ),
        body: StreamBuilder(stream: docRef.snapshots(), builder: (context,snapshot){
          if(snapshot.hasData){
            //*show data
            return ListView.builder(itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,index) {
              final DocumentSnapshot docSnap= snapshot.data!.docs[index];
              return Slidable(
                endActionPane: ActionPane(motion: ScrollMotion(), children: [
                  SlidableAction(
                    icon: Icons.delete,
                    backgroundColor: Colors.red,
                    onPressed: (context) async{
                    final docid= docSnap.id;
                    await docRef.doc(docid).delete();
                  })
                ]),
                child: Card(child: ListTile(title: Text(docSnap['title'])),));
            });
          }
          return Center(child: CircularProgressIndicator());
        })
        ),
    );
    
  }
}