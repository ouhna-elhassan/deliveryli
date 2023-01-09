import 'package:flutter/material.dart';



class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {

  

  List ids = [
    "#AD56gD6hg7",
    "#SG0fs4phg1", 
    "#L0xKn76Pmd", 
  ];
  List locs = [
    "Hay al irfan, avenu allal alfasi...", 
    "Agdal, avenu de france...", 
    "Hay al irfan, avenu allal alfasi...", 
  ];
  List names = [
    "Ahmed amine", 
    "Test driver",
    "ibrahim ait",
  ];
  List prices = [
    "30 DH", 
    "27 DH",
    "33 DH"
  ];

  Container itemOrder(int index){
    return Container(
      margin: EdgeInsets.all(7),
      padding: EdgeInsets.all(11),
      width: 300, 
      height: 200, 
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(15), 
        boxShadow:const [
          BoxShadow(
            color: Color.fromARGB(255, 193, 193, 193), 
            offset: Offset(1, 1), 
            blurRadius: 3
          )
          
        ], 
        
        border: Border.all(
          width: 2, 
          color: Color.fromARGB(255, 13, 101, 217),
        )
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 120, 
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 53, 105, 147), 
                  borderRadius: BorderRadius.circular(15), 
                  boxShadow:const [
                    BoxShadow(
                      color: Color.fromARGB(255, 221, 221, 221), 
                      offset: Offset(1, 1), 
                      blurRadius: 1
                    )
                  ]
                ),
                child: Center(
                  child: Text(
                    prices[index], 
                    style: TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold, 
                      fontSize: 17
                    ),
                  ),
                ), 
              ), 
              Text(
                ids[index], 
                style: TextStyle(
                  //color: Colors.white, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 17
                ),
              ),
            ],
          ), 
          const SizedBox(height: 7,), 
          Row(
            children: [
               Text(
                names[index], 
                style: TextStyle(
                  //color: Colors.white, 
                  //fontWeight: FontWeight.bold, 
                  fontSize: 17
                ),
              ),
               Icon(Icons.star_border_outlined, color: Colors.green, ),
               Text(
                "4.8", 
                style: TextStyle(
                  color: Color.fromARGB(255, 181, 167, 58), 
                  //fontWeight: FontWeight.bold, 
                  fontSize: 17
                ),
              ),
            ],
          ), 
          const SizedBox(height: 7,), 
          Divider(thickness: 2,), 
          const SizedBox(height: 3,), 
          Text(
            locs[index],
            style: TextStyle(
              color: Colors.grey,
              //fontWeight: FontWeight.bold, 
              fontSize: 15
            ),
          ),
          const SizedBox(height: 3,), 
          const Divider(thickness: 2,), 
          //const SizedBox(height: 11,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 120, 
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white, 
                  borderRadius: BorderRadius.circular(15), 
                  boxShadow:const [
                    BoxShadow(
                      color: Color.fromARGB(255, 221, 221, 221), 
                      offset: Offset(1, 1), 
                      blurRadius: 1
                    )
                  ], 
                  border: Border.all(
                    width: 2, 
                    color: Colors.red
                  )
                  
                ),
                child: const Center(
                  child: Text(
                    "DECLINE", 
                    style: TextStyle(
                      color: Colors.red, 
                      fontWeight: FontWeight.bold, 
                      fontSize: 17
                    ),
                  ),
                ),
              ),
              Container(
                width: 120, 
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green, 
                  borderRadius: BorderRadius.circular(15), 
                  boxShadow:const [
                    BoxShadow(
                      color: Color.fromARGB(255, 221, 221, 221), 
                      offset: Offset(1, 1), 
                      blurRadius: 1
                    )
                  ]
                  
                ),
                child: const Center(
                  child: Text(
                    "ACCEPT", 
                    style: TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold, 
                      fontSize: 17
                    ),
                  ),
                ),
              )
            ],
          ) 
        ],
      ),
    );
  }
  bool _isLoading = false;

  setLoading() async{
     _isLoading = await Future.delayed(
      const Duration(seconds: 3),
      () => true,
    );
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
   setLoading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 13, 101, 217),
        title: Text("Orders"),
      ), 
      body:_isLoading?Padding(
        padding: EdgeInsets.all(11), 
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, index) => itemOrder(index),
        ),
      ):Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}