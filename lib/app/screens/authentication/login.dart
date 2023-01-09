import 'package:flutter/material.dart';
import '../../components/buttonItem.dart';
import '../../components/sliderContent.dart';
import 'verification.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  List<Widget> items = const [Text('')];

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    TextEditingController number = TextEditingController();
    
    String phone = '';

    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(9), 
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height*0.1,),
                  SliderContent(
                    index: 0,
                    height: height,
                    width: width,
                    image: "assets/images/4.png",
                    title: "Registration",
                    subTitle: "Un texte de mots perçuensemble cohérent, porteur."
                  ),
                  SizedBox(height: height*0.07,),
                  Container(
                    width: 300, 
                    height: 49,
                    padding:const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2, 
                        color: Colors.grey
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: number,
                        decoration:const InputDecoration(
                          border: InputBorder.none, 
                          hintText: "(+212)",
                          hintStyle: TextStyle(
                            color: Colors.black, 
                            fontWeight: FontWeight.bold
                          ),
                          suffixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(Icons.call, color: Colors.black,),
                          ),
                          
                        ),
                        onChanged: (value){
                          phone = value;
                        },
                        onFieldSubmitted: (value){
                          if(number.text.toString().length<9){
                            print("nnnnnnnnnnnnnnnnnnnn");
                          }
                          else{
                            //String phon = _number.text.toString();
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context)=>OtpScreen(phoneNumber: '+212' + number.text.toString(),))
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.03,),
                  ButtonItem(
                    color: const Color.fromARGB(255, 79, 81, 254),
                    title: "Send", 
                    onPressed: (){
                      if(number.text.toString().length<9){
                        print("nnnnnnnnnnnnnnnnnnnn");
                      }
                      else{
                        //String phon = _number.text.toString();
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context)=>OtpScreen(phoneNumber: '+212' + number.text.toString(),))
                        );
                      }
                    }
                  ),
                  SizedBox(height: height*0.15,),
                ],
              ),
            ),
          )
        )
      )
    );
  }
}