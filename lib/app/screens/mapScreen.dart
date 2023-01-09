import 'package:deliveryli/app/screens/addPrice.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../services/googleMapServices.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
        child: SingleChildScrollView(
              controller: ModalScrollController.of(context),
              child: Container(
                width: width*1, 
                height: height*0.9,
                decoration: BoxDecoration(
                  color: Colors.white, 
                  boxShadow:const [
                    BoxShadow(
                      offset: Offset(3, 3), 
                      color: Colors.grey, 
                      blurRadius: 7
                    )
                  ],
                  borderRadius: BorderRadius.circular(19)
                ),
                child:Stack(
                  children: [
                    Container(
                      padding:const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: MapGoogle()
                    ), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 65,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 199, 199, 199),
                            borderRadius: BorderRadius.circular(15), 
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: height*0.8,
                      left: width*0.06,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin:const EdgeInsets.only(top: 11),
                            width: width*0.85, 
                            height: 43, 
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15), 
                              color:const Color.fromARGB(255, 44, 108, 161),
                              boxShadow:const [
                                BoxShadow(
                                  offset: Offset(3, 3), 
                                  color: Colors.grey, 
                                  blurRadius: 7
                                )
                              ],
                            ),
                            child: Center(
                              child: TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddPrice()));
                                }, 
                                child: Text('Submite', style: TextStyle(color: Colors.white),)
                              ),
                            ),
                          )
                        ],
                      ), 
                    ), 
                  ],
                )
              ),
            ),
          ),
      )
    );
  }
}