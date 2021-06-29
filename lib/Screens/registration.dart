import 'package:areclambord_client_new/Screens/homePage.dart';
import 'package:areclambord_client_new/components/Reg_rounded_input.dart';
import 'package:areclambord_client_new/components/constants.dart';
import 'package:areclambord_client_new/components/rounded_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}


class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  List<DropdownMenuItem<int>> listDrop = [];

  String valuechoose;
  List listItem = [
    "Vender", "Buyer"
  ];

  void validation() {
    if(email.text.trim().isEmpty || email.text.trim() == null && password.text.trim().isEmpty || password.text.trim() == null){
      showInSnackBar("Please Enter your email and password!");
      return;
    }
    if(fname.text.trim().isEmpty || fname.text.trim() == null){
      showInSnackBar("First name is empty");
      return;
    }
    if(lname.text.trim().isEmpty || lname.text.trim() == null){
      showInSnackBar("Last Name is empty");
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

  Widget button({@required Function ontap}) {
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
          "Sign Up", 
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
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Create your new aReclambord account",
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  SizedBox(height: 40),

                  new Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/addMall.png')
                      )
                
                    ),
                  ),

                  // Image.asset('assets/images/addMall.png'),

                  // SizedBox(height: 40),

                  RoundedInput(
                    controller: fname,
                    icon: Icons.person, 
                    hint: 'First Name', 
                    obscureText: false
                  ),
                  
                  RoundedInput(
                    controller: lname,
                    icon: Icons.person, 
                    hint: 'Last Name', 
                    obscureText: false
                  ),

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
                  // SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Container(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow, width: 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: new DropdownButton(
                        value: valuechoose,
                        hint: new Text("Select acc type"),
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        isExpanded: true,
                        onChanged: (newValue) {
                          setState(() {
                            valuechoose = newValue;                      
                          });
                        },
                        items: listItem.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  button(
                    ontap: () {
                      // validation();
                      Navigator.push(context, MaterialPageRoute(
                      builder: (context) => HomePage()));
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