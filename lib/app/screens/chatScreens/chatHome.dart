import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/chat/accountItem.dart';
import '../../services/chatServices/chatNotifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatHome extends StatefulWidget {
  const ChatHome({super.key});

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  
  @override
  Widget build(BuildContext context) {
    ChatProvider chatProvider = Provider.of<ChatProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title:const Text('Messages'),
        backgroundColor: const Color.fromARGB(255, 13, 101, 217),
      ),
      body: Padding(
        padding: EdgeInsets.all(11), 
        child: StreamBuilder<QuerySnapshot>(
          stream: chatProvider.getChatUsers(1),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              var listMessages = snapshot.data!.docs;
              if (listMessages.isNotEmpty) {
                return ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: snapshot.data?.docs.length,
                  //reverse: true,
                  //controller: scrollController,
                  itemBuilder: (context, index) => AccountItem(documentSnapshot: snapshot.data?.docs[index])
                );
              } else {
                return const Center(
                  child: Text('No messages...'),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 68, 105, 134),
                ),
              );
            }
          }
        )
      )
    );
  }
}

/*
ListView.builder(
          itemCount: 7,
          itemBuilder: (index, context) {
            return AccountItem();
          }
        ),
*/