import 'package:flutter/material.dart';
import '../../components/buttonItem.dart';
import '../../components/sliderContent.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../navigationBar.dart';
//import '../home.dart';
//import '../../components/splash.dart';
import 'dart:async';


class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key,required this.phoneNumber});

  final String phoneNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {


  List<Widget> items = const [Text('')];

  Container otpInput(TextEditingController controller){
    return Container(
      padding: const EdgeInsets.all(3),
      width: 40, 
      height: 53, 
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 211, 211, 211), 
        borderRadius: BorderRadius.circular(15), 
      ),
      child: TextFormField(
        controller: controller,
        decoration:const InputDecoration(
          border: InputBorder.none, 
        ),
      ),
    );
  }

  String otp = "";

  _verifyPhone(context) async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async{ 
        await FirebaseAuth.instance.signInWithCredential(credential);
        print("Sign In");
      },
      verificationFailed: (FirebaseAuthException e) {
        print("${e.code}");
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async{
         print("############################");
        otp = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},       
    ).onError((error, stackTrace) => print("############################ $error"));
  }
  TextEditingController smscode = TextEditingController();

  @override
  void initState() {
    _verifyPhone(context); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


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
                    image: "assets/images/5.png",
                    title: "Verification",
                    subTitle :"Enter your OTP code number."
                  ),
                  SizedBox(height: height*0.05,),
                  Container(
                    width: 300, 
                    height: 49,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: smscode,
                      decoration:const InputDecoration(
                        hintText: 'OTP code'
                      ),
                      onFieldSubmitted: (value) async{
                        String code = smscode.text;
                        // Create a PhoneAuthCredential with the code
                        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: otp, smsCode: code);
                        // Sign the user in (or link) with the credential
                        await FirebaseAuth.instance.signInWithCredential(credential).then((value) async{
                          if (value.additionalUserInfo!.isNewUser){
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => NavBar()) 
                            );
                          }else{
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => NavBar()) 
                            );
                          }
                        });
                      },
                    ), 
                  ),
                  SizedBox(height: height*0.03,),
                  ButtonItem(
                    color: const Color.fromARGB(255, 27, 46, 53),
                    title: "send",
                    onPressed: () async{
                      //print("##########################:");
                      String code = smscode.text;
                      // Create a PhoneAuthCredential with the code
                      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: otp, smsCode: code);
                      // Sign the user in (or link) with the credential
                      await FirebaseAuth.instance.signInWithCredential(credential).then((value) async{
                        if (value.additionalUserInfo!.isNewUser){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => NavBar()) 
                          );
                        }else{
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => NavBar()) 
                          );
                        }
                      });
                    }
                  ),
                  SizedBox(height: height*0.05,),
                  const Text(
                  'Didn’t you receive any code ?',
                  style: TextStyle(
                    fontFamily: 'FuzzyBubbles',  
                  ),
                  textAlign: TextAlign.center,
                ), 
                const Text(
                  "Resend New Code",
                  style: TextStyle(
                    fontFamily: 'FuzzyBubbles',  
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
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