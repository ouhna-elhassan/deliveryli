import 'package:flutter/material.dart';
import '../screens/forme.dart';


class HomeCategory extends StatefulWidget {
  const HomeCategory({super.key, required this.img, required this.title, required this.desc});
  final String img;
  final String title;
  final String desc;
  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
 
  @override
  Widget build(BuildContext context) {
     double widht = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){

        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context)=>Forme())
        );
        
      },
      child: Container(
      width: widht*0.6, 
      height: 99,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow:const [
          BoxShadow(
            color: Color.fromARGB(255, 190, 204, 213), 
            offset: Offset(3, 3),
            blurRadius: 3
          )
        ],
        borderRadius: BorderRadius.circular(17)
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 5),
          Image.asset('assets/images/${widget.img}', width: widht*0.2, height: 77, fit: BoxFit.cover,),
          SizedBox(width: widht*0.015),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  //fontSize: 15 ,
                  color: Color.fromARGB(255, 0, 0, 0), 
                  fontWeight: FontWeight.bold, 
                  fontFamily: 'FuzzyBubbles'
                ),
              ), 
              Container(
                width: widht*0.3, 
                height: 7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), 
                  color: Color.fromARGB(255, 77, 206, 129), 
                  boxShadow:const [
                    BoxShadow(
                      color: Color.fromARGB(255, 184, 184, 184), 
                      offset: Offset(3, 3),
                      blurRadius: 3
                    )
                  ],
                ),
              ),
              Container(
                width: widht*0.3, 
                constraints:const BoxConstraints(minWidth: 21, maxWidth: 145),
                child: Text(
                widget.desc,
                style: TextStyle(
                  fontSize: 13 ,
                  color: Color.fromARGB(255, 0, 0, 0), 
                  fontFamily: 'FuzzyBubbles'
                ),
                maxLines: 2, 
                textAlign: TextAlign.start,
              ),
              )
            ],
          ), 
        ],
      ),
    ),
    );
  }
}