import 'package:flutter/material.dart';
//import '../items/appBarItem.dart';
import '../../components/chat/messageItem.dart';
import '../../components/chat/inputItem.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../services/chatServices/chatNotifier.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  TextEditingController controller = TextEditingController();

  List<String> list = [
    'sf ana wahd 15min ndoz ghha nsali chi l3ibat',
    "sf ana wahd 15min ndoz ghha nsali chi l3ibat",
    "sf ana wahd 15min ndoz ghha nsali chi l3ibat",
    "https://scx2.b-cdn.net/gfx/news/2019/2-nature.jpg",
    "mrhba b nas dyalna t9dr doz wahd chwiya rani gha f chamber", 
    "sf ana wahd 15min ndoz ghha nsali chi l3ibat",
    "https://images.pushsquare.com/e863359fe6e07/multiversus-tom-and-jerry-all-unlockables-moves-how-to-win-guide-ps5-ps4-1.large.jpg", 
    "mrhba b nas dyalna t9dr doz wahd chwiya rani gha f chamber", 
    'mrhba b nas dyalna t9dr doz wahd chwiya rani gha f chamber', 
    "sf ana wahd 15min ndoz ghha nsali chi l3ibat", 
    "sf ana wahd 15min ndoz ghha nsali chi l3ibat"
  ];

  ScrollController scrollController = ScrollController();
  

  @override
  Widget build(BuildContext context) {
    ChatProvider chatProvider = Provider.of<ChatProvider>(context, listen: false);
    return Scaffold(
      //appBar: appBarItem(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 13, 101, 217),
        title: Text(
          "Messages"
        ),
      ),
      body: Padding(
        padding:const EdgeInsets.all(11),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: chatProvider.getChatMessage(33),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    var listMessages = snapshot.data!.docs;
                    if (listMessages.isNotEmpty) {
                      return ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: snapshot.data?.docs.length,
                        reverse: true,
                        controller: scrollController,
                        itemBuilder: (context, index) => messageType(snapshot.data?.docs[index], context)
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
            ), 
            buildMessageInput(
              context,
              1,
              scrollController,
            ),
          ],
        )
      ),
    );
  }
}