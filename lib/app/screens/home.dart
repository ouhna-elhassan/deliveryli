import 'dart:ui';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../components/homeCategory.dart';
//import 'mapScreen.dart';
import 'forme.dart';
//import 'package:hover_effect/hover_effect.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

  

    return Scaffold(
      key: _key,
      appBar: AppBar(
        toolbarHeight: height*0.23,
        backgroundColor:const Color.fromARGB(255, 13, 101, 217),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tskhr Liya",
            ), 
            SizedBox(height: height*0.01,), 
            const Text(
              "wath are you looking for",
              style: TextStyle(
                fontSize: 15 ,
                color: Color.fromARGB(255, 241, 241, 241),
                fontFamily: 'FuzzyBubbles'
              ),
            ), 
            SizedBox(height: height*0.063,), 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width*0.75, 
                  height: 53, 
                  padding: const EdgeInsets.only(left: 11) ,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(19)
                  ),
                  child: Center(
                    child: TextFormField(
                      decoration:const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Searsh for drivers", 
                        icon: Icon(Icons.search)
                      ),
                    ),
                  ),
                ),
                //SizedBox(width: width*0.02,),
                Container(
                  width: MediaQuery.of(context).size.width*0.13, 
                  height: 53, 
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(19)
                  ),
                  child: Center(
                    child: Icon(
                      Icons.settings, 
                      color: Color.fromARGB(255, 176, 176, 176),
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
            //SizedBox(height: 15,), 
            //Text("All categories")
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: height*0.01,), 
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.5, 
                height: height*0.58, 
                padding: const EdgeInsets.only(left: 11),
                decoration:const BoxDecoration(
                  color: Color.fromARGB(255, 13, 101, 217),
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.elliptical(
                      400,
                      500
                    )
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 184, 184, 184), 
                      offset: Offset(3, 3),
                      blurRadius: 3
                    )
                  ]
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const [
                    Icon(
                      Icons.sort_rounded, 
                      size: 51, 
                      color: Colors.white,
                    ),
                  ],
                )
              ),
              const Positioned(
                top: 22,
                left: 90,
                child: HomeCategory(img: "33.png", title: "Jib Liya", desc: "Jib liya chihaja mn wahd lblasa",),
              ),
              const Positioned(
                top: 180,
                left: 120,
                child: HomeCategory(img: "38.png", title: "Di mn 3ndi", desc: "i mn 3ndi chihaja lwahd lblasa",)
              ),
              const Positioned(
                top: 330,
                left: 90,
                child: HomeCategory(img: "39.png",title: "blasa l blasa", desc: "di had lhaja mn dik lblasa ldik lblasa",)
              ),
            ],
          )
        ],
      ),
      )
    );
  }
}