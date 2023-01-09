import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../models/chatMessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../screens/chatScreens/imageView.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
//String currentUserId = auth.currentUser!.uid;
String currentUserId = "1234567";
Column messageText(DocumentSnapshot? documentSnapshot){
  ChatMessages chatMessages = ChatMessages.fromDocument(documentSnapshot!);
  return Column(
    crossAxisAlignment:chatMessages.from==currentUserId?CrossAxisAlignment.end:CrossAxisAlignment.start,
    children: [
      Container(
        padding:const EdgeInsets.fromLTRB(19, 19, 19, 19),
        margin:const EdgeInsets.all(7),
        constraints:const BoxConstraints(minWidth: 21, maxWidth: 277),
        decoration: BoxDecoration(
          color:chatMessages.from==currentUserId?const Color.fromARGB(255, 226, 227, 227):const Color.fromARGB(255, 53, 94, 128),
          borderRadius: BorderRadius.circular(27),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 192, 192, 192), 
              blurRadius: 1, 
              offset: Offset(2, 3)
            )
          ]
        ),
        child: Text(
          chatMessages.content,
          style:TextStyle(
            color: chatMessages.from==currentUserId?Colors.black:Colors.white
          ),
        ),
      )
    ]
  );
}

Column messageImage(DocumentSnapshot? documentSnapshot, BuildContext context){
  ChatMessages chatMessages = ChatMessages.fromDocument(documentSnapshot!);
  return Column(
    crossAxisAlignment:chatMessages.from==currentUserId?CrossAxisAlignment.end:CrossAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: ((context) => ImageView(image: chatMessages.content)))
          );
        },
        onDoubleTap: () {
          Fluttertoast.showToast(msg: 'hello hello');
        },
        child: Container(
          padding:const EdgeInsets.fromLTRB(5, 5, 5, 5),
          margin:const EdgeInsets.all(7),
          width: 211, 
          height: 311,
          decoration: BoxDecoration(
            color:chatMessages.from==currentUserId?const Color.fromARGB(255, 226, 227, 227):const Color.fromARGB(255, 53, 94, 128),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              chatMessages.content,
              fit: BoxFit.cover,
            ),
          ),
        ),
      )
    ]
  );
}

Column messageType(DocumentSnapshot? documentSnapshot, BuildContext context){
  ChatMessages chatMessages = ChatMessages.fromDocument(documentSnapshot!);
  return chatMessages.type==1?messageText(documentSnapshot):messageImage(documentSnapshot, context);
}