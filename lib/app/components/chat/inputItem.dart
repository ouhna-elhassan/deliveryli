import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import '../../services/chatServices/chatNotifier.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
//String currentUserId = auth.currentUser!.uid;
String currentUserId = "1234567";

Future<void> getImage(BuildContext context, ScrollController scrollController) async {
  ImagePicker imagePicker = ImagePicker();
  XFile? pickedFile;
  pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    File imageFile = File(pickedFile.path);
    if (imageFile != null) {
      uploadImageFile(context, imageFile, scrollController);
      /*
        setState(() {
          isLoading = true;
        });
        uploadImageFile();
      */
    }
  }
}

void uploadImageFile(BuildContext context, File imageFile, ScrollController scrollController) async {
  ChatProvider chatProvider = Provider.of<ChatProvider>(context, listen: false);
  String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  UploadTask uploadTask = chatProvider.uploadImageFile(imageFile!, fileName);
  try {
    TaskSnapshot snapshot = await uploadTask;
    var imageUrl = await snapshot.ref.getDownloadURL();
    /*setState(() {
      isLoading = false;
      onSendMessage(imageUrl, MessageType.image);
    });*/
    chatProvider.sendChatMessage(imageUrl, 2, currentUserId, "123456");
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300), curve: Curves.easeOut
    );
  } on FirebaseException catch (e) {
    /*setState(() {
      isLoading = false;
    });*/
    Fluttertoast.showToast(msg: e.message ?? e.toString());
  }
}


Widget buildMessageInput(BuildContext context , int type, 
   ScrollController scrollController) {
    
  ChatProvider chatProvider = Provider.of<ChatProvider>(context, listen: false);
  TextEditingController controller = TextEditingController();
  String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //UploadTask uploadTask = chatProvider.uploadImageFile(imageFile!, fileName);
  
  return SizedBox(
    width: double.infinity,
    height: 77,
    child: Row(
      children: [
        Container(
          margin:const EdgeInsets.only(top: 5),
          width: MediaQuery.of(context).size.width*0.93,
          height: 77,
          padding:const EdgeInsets.all(11),
          decoration: BoxDecoration(
            color:const Color.fromARGB(255, 233, 233, 233),
            borderRadius: BorderRadius.circular(17)
          ),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  decoration:const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Your message'
                  ),
                  //focusNode: focusNode,
                  textInputAction: TextInputAction.send,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.sentences,
                  controller: controller,
                  //decoration:
                      //kTextInputDecoration.copyWith(hintText: 'write here...'),
                  onSubmitted: (value) {
                    
                    print('####################################"');
                    String content = controller.text;
                    if (content.trim().isNotEmpty) {
                      controller.clear();
                      chatProvider.sendChatMessage(content, type, currentUserId, "123456");
                      scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 300), curve: Curves.easeOut
                      );
                    } else {
                      Fluttertoast.showToast(
                        msg: 'Nothing to send', backgroundColor: Colors.grey
                      );
                    }
                  },
                )
              ),
              Container(
                margin: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                  onPressed: (){
                    getImage(context, scrollController);
                  },
                  icon:const Icon(
                    Icons.camera_alt,
                    size: 28,
                  ),
                  color:const Color.fromARGB(255, 175, 175, 175),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 4),
                decoration: BoxDecoration(
                  color:const Color.fromARGB(255, 55, 116, 165),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                  onPressed: (){
                    String content = controller.text;
                     print('$content####################################"');
                     
                    if (content.trim().isNotEmpty) {
                      controller.clear();
                      chatProvider.sendChatMessage(content, type, currentUserId, "123456");
                      scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 300), curve: Curves.easeOut
                      );
                    } else {
                      Fluttertoast.showToast(
                        msg: 'Nothing to send', backgroundColor: Colors.grey
                      );
                    }
                  },
                  icon: const Icon(Icons.send_rounded),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}