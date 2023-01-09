import 'package:flutter/material.dart';

class SliderContent extends StatefulWidget {
  final int index; 
  final double height;
  final double width; 
  final String image;
  final String title;
  final String subTitle;

  const SliderContent({
    super.key, 
    required this.index,
    required this.height,
    required this.width,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  State<SliderContent> createState() => _SliderContentState();
}

class _SliderContentState extends State<SliderContent> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: widget.width*0.9,
      height: widget.height*0.45, 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            widget.image,
            height:widget.height*0.3 ,
          ), 
          const SizedBox(height: 17,), 
          Text(
            widget.title,
            style:const TextStyle(
              fontFamily: 'FuzzyBubbles',
              fontWeight: FontWeight.bold,
              fontSize: 15
            ),
          ),
          const SizedBox(height: 17,), 
          FittedBox(
            fit: BoxFit.contain,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: widget.width*0.79,
                  child:Text(
                    widget.subTitle,
                    style:const TextStyle(
                      fontFamily: 'FuzzyBubbles',  
                    ),
                    textAlign: TextAlign.center,
                  ), 
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}