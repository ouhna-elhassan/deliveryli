import 'package:cloud_firestore/cloud_firestore.dart';


class ChatMessages {
  String from;
  String to;
  String timestamp;
  String content;
  int type;

  ChatMessages(
      {required this.from,
      required this.to,
      required this.timestamp,
      required this.content,
      required this.type});

  toJson() {
    Map map =  Map();
    map["from"] = from;
    map["to"] = to;
    map["timestamp"] = timestamp;
    map["content"] = content;
    map["type"] = type;
    return {
      'from': from,
      'to': to,
      'timestamp': timestamp,
      'content': content,
      'type': type,
    };
  }
  

  factory ChatMessages.fromDocument(DocumentSnapshot documentSnapshot) {
    String idFrom = documentSnapshot.get('from');
    String to = documentSnapshot.get('to');
    String timestamp = documentSnapshot.get('timestamp');
    String content = documentSnapshot.get('content');
    int type = documentSnapshot.get('type');

    return ChatMessages(
      from: idFrom,
      to: to,
      timestamp: timestamp,
      content: content,
      type: type
    );
  }
}