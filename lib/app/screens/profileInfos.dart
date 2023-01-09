import 'package:deliveryli/app/components/buttonItem.dart';
import 'package:flutter/material.dart';

import 'dart:io'; 
import 'package:image_picker/image_picker.dart';

class ProfileInfos extends StatefulWidget {
  const ProfileInfos({super.key});

  @override
  State<ProfileInfos> createState() => _ProfileInfosState();
}

class _ProfileInfosState extends State<ProfileInfos> {

  bool edit = true;
  
  //String hint = "Ouhna elhassan";

  File? _imageFile;
  final _picker = ImagePicker();

  Future<void> addImage() async{
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Widget infos(String txt, IconData icon){
    TextEditingController controller = TextEditingController();
    return GestureDetector(
               onTap: (){
                  setState(() {
                        edit = !edit;
                        //controller.text = hint;
                      });
                },
              child: Container(
              width: MediaQuery.of(context).size.width*0.85, 
              height: 55, 
              padding:const EdgeInsets.all(5),
              margin:const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11), 
                color:Color.fromARGB(255, 240, 240, 240), 
              ),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none, 
                  hintText: txt, 
                  suffixIcon:  Icon(Icons.edit, color: Color.fromARGB(255, 13, 101, 217),),
                  enabled: edit,
                  prefixIcon: Icon(icon, color: Color.fromARGB(255, 13, 101, 217),),
              ),
            )
            ),
            );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit profile"),
        backgroundColor: Color.fromARGB(255, 13, 101, 217), 
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(
          11
        ),
        child: Center(
          child: SingleChildScrollView( 
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: addImage,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  _imageFile == null?Container(
                    width: 130, 
                    height:  130, 
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://expertphotography.b-cdn.net/wp-content/uploads/2020/08/social-media-profile-photos-3.jpg"), fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(41), 
                      border: Border.all(
                        color: Color.fromARGB(255, 13, 101, 217), 
                        width: 3, 
                      )
                    ),
                  ):Container(
                    width: 130, 
                    height:  130, 
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:FileImage(_imageFile!) , fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(41), 
                      border: Border.all(
                        color: Color.fromARGB(255, 13, 101, 217), 
                        width: 3, 
                      )
                    ),
                  ), 
                  Container(
                    width: 35, 
                    height: 35, 
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.circular(45)
                    ),
                    child: Icon(
                      Icons.add_a_photo_outlined, 
                      size: 31,
                      color: Color.fromARGB(255, 13, 101, 217),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 41,),
            infos("Test User", Icons.person),
            const SizedBox(height: 11,),
            infos("testuser@gmail.com", Icons.email),
            const SizedBox(height: 11,),
            infos("0612345678", Icons.phone),
            const SizedBox(height: 11,),
            infos("********", Icons.lock),
            const SizedBox(height: 41,),
            ButtonItem(color: Color.fromARGB(255, 13, 101, 217), title: "Submite", onPressed: (){})
          ],
        ),
        ),
        )
      ),
    );
  }
}