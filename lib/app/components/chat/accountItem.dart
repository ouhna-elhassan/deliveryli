import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../screens/chatScreens/chatScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AccountItem extends StatefulWidget {
  const AccountItem({super.key, required this.documentSnapshot});
  final DocumentSnapshot? documentSnapshot;

  @override
  State<AccountItem> createState() => _AccountItemState();
}

class _AccountItemState extends State<AccountItem> {
  
  @override
  Widget build(BuildContext context) {
    User user = User.fromDocument(widget.documentSnapshot!);
    return Container(
      padding:const EdgeInsets.all(5),
      margin:const EdgeInsets.all(5),
      width: 200, 
      height: 79,
      decoration: BoxDecoration(
        color: Colors.white, 
        boxShadow:const [
          BoxShadow(
            offset: Offset(1, 1), 
            color: Color.fromARGB(255, 205, 205, 205), 
            blurRadius: 3
          )
        ], 
        borderRadius: BorderRadius.circular(15)
      ),
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => ProfileImage())
            );
          },
          child:const CircleAvatar(
            radius: 33, 
            backgroundImage: NetworkImage("https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg")
          ),
        ),
        title: Text(
          user.name, 
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 17
          ),
        ), 
        subtitle: Text('my message'),
        trailing: Text(user.lastSeen),
        onTap: (){
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => ChatPage())
          );
        },
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('image'),
        backgroundColor: Color.fromARGB(255, 57, 57, 57),
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 57, 57, 57),
      body: Center(
        child: Hero(
          tag: "animation", 
          child: Image.network("https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg")
        ),
      ),
    );
  }
}