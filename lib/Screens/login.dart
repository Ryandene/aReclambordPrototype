import 'package:areclambord_client_new/Screens/homePage.dart';
import 'package:areclambord_client_new/Screens/registration.dart';
import 'package:areclambord_client_new/components/constants.dart';
import 'package:areclambord_client_new/components/rounded_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void validation() {
    if(email.text.trim().isEmpty || email.text.trim() == null && password.text.trim().isEmpty || password.text.trim() == null){
      showInSnackBar("Please Enter your email and password!");
      return;
    }
    if(email.text.trim().isEmpty || email.text.trim() == null){
      showInSnackBar("Email is empty");
      return;
    }
    if(password.text.trim().isEmpty || password.text.trim() == null){
      showInSnackBar("Password is empty");
      return;
    }
  }

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
    ]);
  }

  void showInSnackBar(String value) {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text(value)
    ));
  }

  Widget button({@required Function ontap, @required String name}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: size.height*0.07,
      child: RaisedButton(
        color: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: new Text(
          name, 
          style: TextStyle(
            color: Colors.white,
            fontSize: 18
          )
        ),
        onPressed: ontap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double defaultLoginSize = size.height - (size.height*0.2);
    //double defaultRegisterSize = size.height - (size.height*0.1);
    // double viewInsert = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
            child: Container(
              width: size.width,
              height: defaultLoginSize,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
              
                children: [
                  Text(
                    "Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Login to your aReclambord account",
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  SizedBox(height: 40),

                  new Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/addMall.png')
                      )
                
                    ),
                  ),

                  // Image.asset('assets/images/addMall.png'),

                  SizedBox(height: 40),

                  RoundedInput(
                    controller: email,
                    icon: Icons.email, 
                    hint: 'Email', 
                    obscureText: false
                  ),

                  RoundedInput(
                    controller: password,
                    icon: Icons.lock, 
                    hint: 'Password', 
                    obscureText: true,
                  ),

                  SizedBox(height: 10),

                  button(
                    name: "LOGIN",
                    ontap: () {
                      // validation();
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => HomePage()));
                    }
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),
                  ),
                  SizedBox(height: 10),
                  button(
                    name: "SIGN UP",
                    ontap: () {
                      // validation();
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => SignUpScreen()));
                    }
                  ),

                ],
              ),
              ),
            ),
          ),
        ],
      )
      
    );
  }
}