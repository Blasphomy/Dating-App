
import 'package:dating/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:dating/globals.dart' as globals;

import 'front.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({Key? key}) : super(key: key);

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  double screenHeight = 0;
  double screenWidth = 0;
  String? s;
  late String id;





  bool hidePassword = true;
  final focus = FocusNode();
  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom!=0;
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,

          body:
          Container(
            child: Column(
              children: <Widget>[
                isKeyboardVisible ? SizedBox(height: screenHeight/8) :
                Container(

                  height: screenHeight/3,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(bottomRight:Radius.circular(50))
                  ),
                  child: Center(
                    child: Image.asset("assets/images/icon2.png",
                      width: screenWidth/1.2,
                      height:  screenHeight,
                    ),
                  ),
                ),

                Container(
                  child: const Text("Welcome To HeartMatch!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                ),
                SizedBox(height: screenHeight/10),
                Form(
                  key: globalFormKey,
                  child: Container(
                    alignment:Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: screenWidth/12),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  const EdgeInsets.fromLTRB(2, 2, 2, 5),
                          child: Container(
                            //width: screenWidth/1.1,
                            margin: EdgeInsets.only(bottom: screenHeight/40),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 15,
                                  offset: Offset(2,2),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              onSaved: (input)=>
                              input=input,
                              validator: (input)=>
                              input!=null&&input.isEmpty?'Field cannot be empty':null,

                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (v){
                                FocusScope.of(context).requestFocus(focus);
                              },
                              controller: idController,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(

                                border: OutlineInputBorder(
                                  borderSide:
                                  BorderSide.none,
                                  borderRadius: BorderRadius.circular(40.0),
                                ),

                                prefixIcon:Container(
                                  decoration: const BoxDecoration(
                                      border: Border(right: BorderSide(color: Colors.black26))
                                  ),
                                  margin: const EdgeInsets.only(right: 7),
                                  child: Icon(
                                    Icons.person_outline,
                                    color: Colors.black54,
                                    size: screenHeight/25,
                                  ),
                                ) ,
                                suffixIcon: IconButton(
                                  icon : Icon(Icons.close_rounded,
                                    color: Colors.black54,
                                    size: screenHeight/25,
                                  ),
                                  onPressed: () { idController.clear(); },

                                ),

                                contentPadding: EdgeInsets.symmetric(
                                  vertical: screenHeight/50,

                                ),


                                hintText:'Login ID',


                              ),
                              maxLines: 1,
                              obscureText: false,
                            ),
                          ),
                        ),
                        Padding(
                          padding:  const EdgeInsets.fromLTRB(2, 2, 2, 1),
                          child: Container(
                            //width: screenWidth/1.1,
                            margin: EdgeInsets.only(bottom: screenHeight/40),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 15,
                                  offset: Offset(2,2),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              onSaved: (input) =>
                              input = input!,
                              validator: (input) => input!.length < 6
                                  ? "Password should be more than 6 characters"
                                  : null,
                              textInputAction: TextInputAction.done,
                              focusNode: focus,
                              controller: passController,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(

                                border: OutlineInputBorder(
                                  borderSide:
                                  BorderSide.none,
                                  borderRadius: BorderRadius.circular(40.0),
                                ),

                                prefixIcon:Container(
                                  decoration: const BoxDecoration(
                                      border: Border(right: BorderSide(color: Colors.black26))
                                  ),
                                  margin: const EdgeInsets.only(right: 7),
                                  child: Icon(

                                    Icons.lock_outline_rounded,
                                    color: Colors.black54,
                                    size: screenHeight/28,
                                  ),
                                ) ,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                  color: Theme.of(context)
                                      .colorScheme.secondary,
                                  icon: Icon(hidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                    color: Colors.black54,),
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: screenHeight/50,),
                                hintText:'Password',
                              ),
                              maxLines: 1,
                              obscureText: hidePassword,
                            ),
                          ),
                        ),




                        GestureDetector(
                          onTap: () async {
                            FocusScope.of(context).unfocus();
                            String id = idController.text.trim();
                            String password = passController.text.trim();
                            if(id.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Employee id is still empty!"),
                              ));
                            } else if(password.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Password is still empty!"),
                              ));
                            } else {
                              try {
                                if(password == "1234"&&id=="user") {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) => MainScreen())
                                  );
                                }
                               else if(password == "1234"&&id==globals.name) {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) => MainScreen())
                                  );
                                }
                                else  if(password == "1234"&&id!="user"){
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text("Userid is not correct!"),
                                  ));
                                }
                                else {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text("Password is not correct!"),
                                  ));
                                }
                              } catch(e) {
                                String error = " ";
                                if(e.toString() == "RangeError (index): Invalid value: Valid value range is empty: 0") {
                                  setState(() {
                                    error = "Employee id does not exist!";
                                  });
                                } else {
                                  setState(() {
                                    error = "Error occurred!";
                                  });
                                }

                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(error),
                                ));
                              }
                            }
                          },
                          child: Padding(
                            padding:  const EdgeInsets.fromLTRB(2, 0, 2, 2),
                            child: Center(
                              child:
                              Container(
                                height: screenHeight / 18,
                                width: screenWidth / 3,
                                margin: EdgeInsets.only(
                                    bottom: screenHeight / 40),
                                decoration: const BoxDecoration(
                                  color: Colors.pinkAccent,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(40)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF0D47A1),
                                      blurRadius: 2,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      // fontFamily: "NexaBold",
                                        fontSize: screenWidth / 25,
                                        color: Colors.white,
                                        letterSpacing: 2
                                    ),

                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(1, 2, 2, 6),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignUpUser()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.pinkAccent,
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              ),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: screenWidth / 23,
                                  color: Colors.white, // Set text color
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
