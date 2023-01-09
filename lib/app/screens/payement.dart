import 'package:flutter/material.dart';


class Carte extends StatefulWidget {
  Carte({Key? key}) : super(key: key);

  @override
  State<Carte> createState() => _CarteState();
}


class _CarteState extends State<Carte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Cards'),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 13, 101, 217),
      ),
      body: SingleChildScrollView(
      
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Container(
                decoration:const BoxDecoration(
                  color: Color.fromARGB(255, 13, 101, 217),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(66))
                ) ,
                height: MediaQuery.of(context).size.height*0.2,
                width: MediaQuery.of(context).size.width*1,
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: -50,
                child:  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:Row(children: [
                      Container(
                         margin: EdgeInsets.only(
                    left: 44,
                    right: 14
                  ),
                  decoration: BoxDecoration(
                    color:Color.fromARGB(255, 131, 205, 63),
                    borderRadius: BorderRadius.circular(17),
                    boxShadow:const [
                      BoxShadow(
                        offset: Offset(3, 3),
                        color: Color.fromARGB(255, 176, 189, 228),
                        blurRadius: 10,
                        
                      )
                    ]
                  ),
                  height: MediaQuery.of(context).size.height*0.25,
                  width: MediaQuery.of(context).size.width*0.6,
                  padding: EdgeInsets.all(11),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:const [
                      Text(
                        'VISA',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 80,),
                      Text(
                        '**** **** **** 4567',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 7,),
                      Text(
                        'Test user',
                        style: TextStyle(
                          color: Color.fromARGB(255, 225, 225, 225),
                        ),
                      )
                    ],
                  ),
                  
                ),
                Container(
                  margin:const EdgeInsets.only(
                    left: 14,
                    right: 14
                  ),
                  decoration: BoxDecoration(
                    color:const Color.fromARGB(255, 243, 176, 43),
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 3),
                        color: Color.fromARGB(255, 176, 189, 228),
                        blurRadius: 10,
                        
                      )
                    ]
                  ),
                  padding: EdgeInsets.all(11),
                  height: MediaQuery.of(context).size.height*0.25,
                  width: MediaQuery.of(context).size.width*0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:const [
                      Text(
                        'VISA',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 80,),
                      Text(
                        '**** **** **** 4567',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 7,),
                      Text(
                        'Test user',
                        style: TextStyle(
                          color: Color.fromARGB(255, 225, 225, 225),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 14,
                    right: 14
                  ),
                  padding: EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color:Color.fromARGB(255, 225, 77, 244),
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 3),
                        color: Color.fromARGB(255, 176, 189, 228),
                        blurRadius: 10,
                        
                      )
                    ]
                  ),
                  height: MediaQuery.of(context).size.height*0.25,
                  width: MediaQuery.of(context).size.width*0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:const [
                      Text(
                        'VISA',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 80,),
                      Text(
                        '**** **** **** 4567',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 7,),
                      Text(
                        'OUHNA ELHASSAN',
                        style: TextStyle(
                          color: Color.fromARGB(255, 225, 225, 225),
                        ),
                      )
                    ],
                  ),
                ),
                    ],)
                  )
              ),
            ],
          ),
          const SizedBox(height: 70,),
          Padding(
          padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width*0.07,
          right: MediaQuery.of(context).size.width*0.07,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container( 
            width: MediaQuery.of(context).size.width*1,
            height: 70, 
            decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(15), 
              border: Border.all(
                width: 2, 
                color: Color.fromARGB(255, 128, 184, 130)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const [
                Icon(Icons.add_box_outlined), 
                SizedBox(width: 7,),
                Text(
                  "Add new card"
                )
              ],
            ),
          ),
          const SizedBox(height: 25,),
          const Text(
            'Other payements methodes',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 17,),
          Container(
            padding:const EdgeInsets.only(left:7),
            width: MediaQuery.of(context).size.width*0.9,
            height: 60,
            decoration: BoxDecoration(
              color:const Color.fromARGB(255, 240, 240, 240),
              borderRadius: BorderRadius.circular(15), 
              boxShadow:const [
                BoxShadow(
                  color: Color.fromARGB(255, 221, 221, 221), 
                  offset: Offset(1, 1), 
                  blurRadius: 1
                )
              ]
            ),
            child: Row(
              children:const [
                Icon(Icons.paypal_outlined, color: Color.fromARGB(255, 76, 101, 173), size: 33,), 
                SizedBox(width: 21,),
                Text(
                  'Add your payapl accounte',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            )
          ),
          const SizedBox(height: 19,),
          Container(
            padding:const EdgeInsets.only(left:7),
            width: MediaQuery.of(context).size.width*0.9,
            height: 60,
            decoration: BoxDecoration(
              color:const Color.fromARGB(255, 240, 240, 240),
              borderRadius: BorderRadius.circular(15), 
              boxShadow:const [
                BoxShadow(
                  color: Color.fromARGB(255, 221, 221, 221), 
                  offset: Offset(1, 1), 
                  blurRadius: 1
                )
              ]
            ),
            child: Row(
              children:const [
                Icon(Icons.monetization_on_rounded, color: Color.fromARGB(255, 76, 101, 173), size: 33,), 
                SizedBox(width: 21,),
                Text(
                  'Cash on delivery',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            )
          ),
          const SizedBox(height: 25,),
          const Text(
            'My wallet',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 7,),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.9,
            child: ElevatedButton(
            onPressed: null,
            child: Text('1500 DH'),
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith((states) => const Color.fromARGB(255, 57, 131, 191),),
              foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
            ),
            ),
          ),
          
          
          
        ],
      ),
      )
        ],
      )
    ),
    );
  }
}