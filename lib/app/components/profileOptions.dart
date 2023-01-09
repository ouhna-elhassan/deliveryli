import 'package:flutter/material.dart';

class ProfileOptions extends StatefulWidget {
  final IconData icon; 
  final String title;
  final VoidCallback onPressed;

  const ProfileOptions({
    super.key, 
    required this.icon, 
    required this.title, 
    required this.onPressed,
  });

  @override
  State<ProfileOptions> createState() => _ProfileOptionsState();
}

class _ProfileOptionsState extends State<ProfileOptions> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding:const EdgeInsets.all(7),
      width: MediaQuery.of(context).size.width*0.8,
      height: 49,
      decoration: BoxDecoration(
        color:const Color.fromARGB(255, 237, 242, 245),
        borderRadius: BorderRadius.circular(15), 
         boxShadow:const [
          BoxShadow(
            color: Color.fromARGB(255, 193, 193, 193), 
            offset: Offset(1, 3), 
            blurRadius: 5
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 55, 
                height: 55, 
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 217, 227, 241),
                  borderRadius: BorderRadius.circular(15), 
                
                ),
                child:Icon(
                  widget.icon, 
                  color: Color.fromARGB(255, 36, 87, 197),
                ),
              ),
              const SizedBox(width: 11,),
              Text(
                widget.title,
                style:const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          IconButton(
            onPressed: widget.onPressed,
            icon:const Icon(Icons.arrow_forward_ios)
          )
        ],
      ),
    );
  }
}