import 'package:deliveryli/app/services/googleMapServices.dart';
import 'package:flutter/material.dart';
import 'dart:io'; 
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'mapScreen.dart';
//import 'package:animations/animations.dart';



class Forme extends StatefulWidget {
  const Forme({super.key});

  @override
  State<Forme> createState() => _FormeState();
}

class _FormeState extends State<Forme> {

   Future showMaps(){
      return showMaterialModalBottomSheet(
        context: context, 
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(31),
          ),
        barrierColor: Color.fromARGB(255, 200, 209, 218),
        builder: (context) => const MapScreen()
      );
    }

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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 13, 101, 217),
        title:const Text(
          "Jib Liya"
        ),
      ),
      body: Padding(
        padding:const EdgeInsets.all(17), 
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Description", 
                style: TextStyle(
                  fontSize: 17, 
                  fontWeight: FontWeight.bold, 
                   fontFamily: 'FuzzyBubbles',
                ),
              ), 
              const SizedBox(height: 13,),
              Container(
                width: width*0.9,
                height: height*0.2,
                decoration: BoxDecoration(
                  color:const Color.fromARGB(255, 240, 240, 240), 
                  borderRadius: BorderRadius.circular(17), 
                  boxShadow:const [
                    BoxShadow(
                      color: Color.fromARGB(255, 198, 198, 198), 
                      offset: Offset(1, 1), 
                      blurRadius: 7
                    )
                  ], 
                ),
                child:const TextField(
                  minLines: 1,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Jib liya...'
                  ),
                ),
              ),
              const SizedBox(height: 33,),
              const Text(
                "Attachements", 
                style: TextStyle(
                  fontSize: 17, 
                  fontWeight: FontWeight.bold, 
                  fontFamily: 'FuzzyBubbles',
                ),
              ), 
              const SizedBox(height: 13,),
              GestureDetector(
                onLongPress: (){
                  setState(() {
                    _imageFile==null;
                  });
                },
                onDoubleTap: (){
                  setState(() {
                    _imageFile==null;
                  });
                },
                onTap: addImage,
                child:_imageFile==null?Container(
                  width: width*0.9,
                  height: height*0.2,
                  decoration: BoxDecoration(
                    color:const Color.fromARGB(255, 240, 240, 240), 
                    borderRadius: BorderRadius.circular(17), 
                    boxShadow:const [
                      BoxShadow(
                        color: Color.fromARGB(255, 187, 187, 187), 
                        offset: Offset(1, 1), 
                        blurRadius: 7
                      )
                    ], 
                    border: Border.all(style: BorderStyle.solid, )
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:const [
                      Icon(
                        Icons.image, 
                        size: 41,
                      ), 
                      Text(
                        "Add image here", 
                        style: TextStyle(
                          fontSize: 17, 

                        ),
                      ), 
                      
                    ],
                  ),
                ):Container(
                  width: width*0.9,
                  height: height*0.3,
                  decoration: BoxDecoration(
                    color:const Color.fromARGB(255, 240, 240, 240), 
                    borderRadius: BorderRadius.circular(17), 
                    boxShadow:const [
                      BoxShadow(
                        color: Color.fromARGB(255, 149, 149, 149), 
                        offset: Offset(3, 1), 
                        blurRadius: 5
                      )
                    ], 
                  ),
                  child: Image.file(_imageFile!, fit: BoxFit.cover,),
                ),
              ),
              const SizedBox(height: 75,),
              Container(
                width: width*0.9,
                height: 55,
                decoration: BoxDecoration(
                  color:const Color.fromARGB(255, 13, 101, 217), 
                  borderRadius: BorderRadius.circular(17), 
                  boxShadow:const [
                    BoxShadow(
                      color: Color.fromARGB(255, 192, 191, 191), 
                      offset: Offset(3, 5), 
                      blurRadius: 5
                    )
                  ], 
                ),
                child:Center(
                  child: TextButton(
                    onPressed:() {Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen()));},
                    child:const Text(
                      'Next', 
                      style: TextStyle(
                        color: Colors.white,
                         fontFamily: 'FuzzyBubbles',
                        fontSize: 17, 
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                )
              ),
            ],
          ),
        )
      ),
    );
  }
}