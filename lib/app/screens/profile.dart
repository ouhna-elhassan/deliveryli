import 'package:deliveryli/app/screens/payement.dart';
import 'package:deliveryli/app/screens/profileInfos.dart';
import 'package:flutter/material.dart';
import '../components/profileOptions.dart' ;

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Profile'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 13, 101, 217),
        elevation: 0,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
           Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Container(
                decoration:const BoxDecoration(
                  color:  Color.fromARGB(255, 13, 101, 217),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(141), bottomRight: Radius.circular(141)), 
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 152, 152, 152), 
                      offset: Offset(3, 3), 
                      blurRadius: 3
                    )
                  ]
                ) ,
                height: MediaQuery.of(context).size.height*0.25,
                width: MediaQuery.of(context).size.width*1,
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child:  Column(
                  children: [
                    Container(
                      width: 100, 
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        image:const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('https://expertphotography.b-cdn.net/wp-content/uploads/2020/08/social-media-profile-photos-3.jpg',)
                        )
                      ),
                    ),
                    SizedBox(height: 21,),
                    const Text(
                    'Test User',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold, 
                      color: Colors.white,
                      fontFamily: 'FuzzyBubbles'

                    ),
                  ),
                  SizedBox(height: 5,),
                  const Text(
                    '0612345678',
                    style:TextStyle(
                     fontFamily: 'FuzzyBubbles',
                      fontSize: 15,
                      fontWeight: FontWeight.bold, 
                      color: Colors.white,  
                    ),
                  ),
                  SizedBox(height: 31,),
                  ],
                )
              ),
            ],
          ),
          const SizedBox(height: 15,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 15,),
              ProfileOptions(
                title:'Personal inforations',
                icon: Icons.person, 
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => ProfileInfos())
                  );
                }
              ),
              const SizedBox(height: 15,),
              ProfileOptions(
                title:'Payements',
                icon: Icons.monetization_on, 
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => Carte())
                  );
                }
              ),
              const SizedBox(height: 15,),
              ProfileOptions(
                title:'Settings',
                icon: Icons.settings, 
                onPressed: (){}
              ),
              const SizedBox(height: 15,),
              ProfileOptions(
                title:'Help center',
                icon: Icons.help_center, 
                onPressed: (){}
              ),
              const SizedBox(height: 15,),
              ProfileOptions(
                title:'Sign Out',
                icon: Icons.logout, 
                onPressed: (){}
              ),
              const SizedBox(height: 15,),
            ],
          )
        ],
      ),
    );
  }
}