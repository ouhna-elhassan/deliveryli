import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../authentication/login.dart';

class PageSelector extends StatefulWidget {
  const PageSelector({super.key});

  @override
  State<PageSelector> createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {

  final  images = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
  ];

  static const titles = [
    "You look for a delevery freelancer ",
    "Are you a delivery freelancer",
    "Get started with us !",
  ];

  static const subTitles = [
    "Find easeilly some one to do something for you",
    "Create your personale services and let others look for you",
    "Delivery Liya is an Easy and Fast P2P platform for you",
  ];

  Container startedButton(BuildContext context){
    return Container(
      width: 300,
      height: 49,
      decoration: BoxDecoration(
        color:const Color.fromARGB(255, 79, 81, 254),
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
          onPressed: (){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>const LoginPage())
            );
          },
          child:const Text(
            "Get Started",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'FuzzyBubbles',
              fontWeight: FontWeight.bold
            ),
          )
        ),
      ),
    );
  }

  //the template of slider contente : image + title + subTitle
  Container item(index, double height, double width, String image, String title, String subTitle){
    return Container(
      width: width*0.9,
      height: height*0.45, 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height:height*0.3 ,
          ), 
          const SizedBox(height: 17,), 
          Text(
            title,
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
                  width: width*0.79,
                  child:Text(
                    subTitle,
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

  List<Widget> items = const [Text(''),Text(''),Text('')];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    items = [
      item(0, height, width, images[0], titles[0], subTitles[0]),
      item(1, height, width, images[1], titles[1], subTitles[1]),
      item(2, height, width, images[2], titles[2], subTitles[2])
    ];

    final Uri toLaunch =
        Uri(scheme: 'https', host: 'www.google.com', path: '/');

    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: images.length, 
        child: Builder(
          builder: (BuildContext context) => Padding(
            padding:const EdgeInsets.all(9), 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height*0.1,),
                Expanded(
                  child: TabBarView(
                    children: items,
                  )
                ), 
                SizedBox(height: height*0.03,),
                startedButton(context),
                const SizedBox(height: 21,),
                const TabPageSelector(
                  selectedColor: Color.fromARGB(255, 27, 46, 53),
                ),  
                SizedBox(height: height*0.09,), 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Learn more about",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'FuzzyBubbles'
                      ),
                    ),
                    TextButton(
                      onPressed: () async{
                        if (!await launchUrl(
                          toLaunch,
                          mode: LaunchMode.externalApplication,
                        )) {
                          throw 'Could not launch';
                        }
                        launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
                      },
                      child:const Text(
                        "Delivery Liya",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 2, 161),
                          fontFamily: 'FuzzyBubbles',
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: height*0.03,),   
              ],
            ),
          )
        ),
      ),
    );
  }
}