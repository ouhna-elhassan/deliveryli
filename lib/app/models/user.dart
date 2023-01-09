import 'package:cloud_firestore/cloud_firestore.dart';

class User {
 final String id;
 final String lastSeen;
 final String name;
 final bool online;
 final List<dynamic> roomId;
 final String timestamp; 

 const User(
      {required this.id,
      required this.lastSeen,
      required this.name,
      required this.online,
      required this.roomId, 
      required this.timestamp}
  );

  factory User.fromDocument(DocumentSnapshot documentSnapshot) {
    String id = documentSnapshot.get('id');
    String lastSeen = documentSnapshot.get('lastSeen');
    String name = documentSnapshot.get('name');
    bool online = documentSnapshot.get('online');
    List<dynamic> roomId = documentSnapshot.get('roomId');
    String timestamp = documentSnapshot.get('timestamp');

    return User(
      id: id,
      lastSeen: lastSeen,
      name: name,
      online: online,
      roomId: roomId, 
      timestamp: timestamp,
    );
  }
}