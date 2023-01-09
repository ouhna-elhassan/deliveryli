import 'package:deliveryli/app/screens/orders.dart';
import 'package:flutter/material.dart';

class AddPrice extends StatefulWidget {
  const AddPrice({super.key});

  @override
  State<AddPrice> createState() => _AddPriceState();
}

class _AddPriceState extends State<AddPrice> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 13, 101, 217),
        title:const Text('Price'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15), 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: width*0.85, 
                height: height*0.35,
                decoration: BoxDecoration(
                  color: Colors.white, 
                  borderRadius: BorderRadius.circular(15), 
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(3, 3), 
                      blurRadius: 5, 
                      color: Color.fromARGB(255, 197, 197, 197)
                    )
                  ]
                ),
                child: Column(
                  children: [
                     
                    Row(
                      children: [
                        Icon(Icons.location_on),  
                        Text(
                          " --- INPT, madinat alirfan, Rabat", 
                          style: TextStyle(
                            //color: Colors.white, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 11,),
                        Container(
                      height: height*0.08, 
                      width: 3, 
                      color: Color.fromARGB(255, 183, 183, 183),
                    ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.directions),  
                        Text(
                          " --- INPT, madinat alirfan, Rabat", 
                          style: TextStyle(
                            //color: Colors.white, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(11),
                          width: width*0.75, 
                          height: height*0.17,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15), 
                            color: Color.fromARGB(255, 243, 243, 243)
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ), 
              Container(
                padding: EdgeInsets.all(9),
                width: width*0.85, 
                height: height*0.2,
                decoration: BoxDecoration(
                  color: Colors.white, 
                  borderRadius: BorderRadius.circular(15), 
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(3, 3), 
                      blurRadius: 5, 
                      color: Color.fromARGB(255, 225, 225, 225)
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Set price", 
                      style: TextStyle(
                        //color: Colors.white, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 170, 
                          height: height*0.06, 
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15), 
                            border: Border.all(
                              width: 2, 
                              color: Color.fromARGB(255, 103, 103, 103)
                            )
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "Average", 
                      style: TextStyle(
                        //color: Colors.white, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Container(
                          width: 170, 
                          height: height*0.06,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15), 
                            border: Border.all(
                              width: 2, 
                              color: Color.fromARGB(255, 255, 255, 255)
                            )
                          ),
                          child:const Center(
                            child:  Text(
                              "19DH", 
                              style: TextStyle(
                                color: Colors.white, 
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: width*0.85, 
                height: height*0.08,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 13, 101, 217),
                  borderRadius: BorderRadius.circular(15), 
                  boxShadow:const [
                    BoxShadow(
                      offset: Offset(3, 3), 
                      blurRadius: 5, 
                      color: Color.fromARGB(255, 197, 197, 197)
                    )
                  ]
                ),
                child:  Center(
                  child: TextButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => const Order(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            return child;
                          },
                        )
                      );
                    },
                    child: Text(
                    "Submite", 
                    style: TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold
                    ),
                  ),)
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}