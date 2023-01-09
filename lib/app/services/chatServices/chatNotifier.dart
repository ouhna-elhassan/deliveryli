import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import '../../models/chatMessage.dart';


FirebaseStorage firebaseStorage = FirebaseStorage.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class ChatProvider extends ChangeNotifier{

  void sendChatMessage(String content, int type, String currentUserId, String peerId) {
    DocumentReference documentReference = firebaseFirestore
      .collection("room")
      .doc(DateTime.now().millisecondsSinceEpoch.toString());
    ChatMessages chatMessages = ChatMessages(
      from: currentUserId,
      to: peerId,
      timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      type: type
    );

    FirebaseFirestore.instance.runTransaction((transaction) async {
      await transaction.set(
        documentReference, 
        chatMessages.toJson()
      );
    });
  }

  Stream<QuerySnapshot> getChatMessage(int limit) {
    return firebaseFirestore
      .collection("room")
      .orderBy("timestamp", descending: true)
      .limit(limit)
      .snapshots();
  }

  Stream<QuerySnapshot> getChatUsers(int limit){
    return firebaseFirestore 
      .collection("users")
      .where("roomId", arrayContains: "123456")
      //.orderBy("timestamp") 
      //.limit(limit)
      .snapshots();
  }

  UploadTask uploadImageFile(File image, String filename) {
    Reference reference = firebaseStorage.ref().child(filename);
    UploadTask uploadTask = reference.putFile(image);
    return uploadTask;
  }

}