import 'package:flutter/material.dart';


class ButtonItem extends StatefulWidget {
  final Color color;
  final String title;
  final VoidCallback onPressed;

  const ButtonItem({
    super.key, 
    required this.color, 
    required this.title, 
    required this.onPressed
  });

  @override
  State<ButtonItem> createState() => _ButtonItemState();
}

class _ButtonItemState extends State<ButtonItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.85,
      height: 49,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(35), 
        boxShadow:const [
          BoxShadow(
            color: Color.fromARGB(255, 176, 176, 176), 
            offset: Offset(3, 3), 
            blurRadius: 2
          )
        ]
      ),
      child: Center(
        child: TextButton(
          onPressed: widget.onPressed,
          child:Text(
            widget.title,
            style:const TextStyle(
              color: Colors.white,
              fontFamily: 'FuzzyBubbles',
              fontWeight: FontWeight.bold
            ),
          )
        ),
      ),
    );
  }
}