import 'package:dating/preferences.dart';
import 'package:flutter/material.dart';
import 'package:dating/globals.dart' as globals;
import 'package:flutter/services.dart';

import 'add.dart';

class SignUpUser extends StatefulWidget {
  const SignUpUser({Key? key}) : super(key: key);

  @override
  State<SignUpUser> createState() => _SignUpUserState();
}

class _SignUpUserState extends State<SignUpUser> {
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  double screenHeight = 0;
  double screenWidth = 0;
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
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        birthdayController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible =
        MediaQuery.of(context).viewInsets.bottom != 0;
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Container(
            child: Column(
              children: <Widget>[
                isKeyboardVisible
                    ? SizedBox(height: screenHeight / 8)
                    : Container(
                  height: screenHeight / 3,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(50))),
                  child: Center(
                    child: Image.asset(
                      "assets/images/icon.jpg",
                      width: screenWidth / 1.2,
                      height: screenHeight,
                    ),
                  ),
                ),
                Container(
                  child: const Text(
                    "Create Your Account!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                SizedBox(height: screenHeight / 10),
                Form(
                  key: globalFormKey,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: screenWidth / 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(2, 2, 2, 5),
                          child: Container(
                            margin: EdgeInsets.only(bottom: screenHeight / 40),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 15,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              onSaved: (input) => input = input!,
                              validator: (input) =>
                              input!.isEmpty ? 'Field cannot be empty' : null,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (v) {
                                FocusScope.of(context).requestFocus(focus);
                              },
                              controller: idController,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                prefixIcon: Container(
                                  decoration: const BoxDecoration(
                                      border:
                                      Border(right: BorderSide(color: Colors.black26))),
                                  margin: const EdgeInsets.only(right: 7),
                                  child: Icon(
                                    Icons.person_outline,
                                    color: Colors.black54,
                                    size: screenHeight / 25,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: Colors.black54,
                                    size: screenHeight / 25,
                                  ),
                                  onPressed: () {
                                    idController.clear();
                                  },
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: screenHeight / 50,
                                ),
                                hintText: 'New User ID',
                              ),
                              maxLines: 1,
                              obscureText: false,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(2, 2, 2, 1),
                          child: Container(
                            margin: EdgeInsets.only(bottom: screenHeight / 40),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 15,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Allow only digits
                              onSaved: (input) => input = input!,
                              validator: (input) =>
                              input!.length < 10 ? "Enter a valid phone number" : null,
                              textInputAction: TextInputAction.done,
                              focusNode: focus,
                              controller: passController,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(40.0),
                                ),

                                prefixIcon: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(right: BorderSide(color: Colors.black26)),
                                  ),
                                  margin: const EdgeInsets.only(right: 7),
                                  child: Icon(
                                    Icons.phone,
                                    color: Colors.black54,
                                    size: screenHeight / 28,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: screenHeight / 50),
                                hintText: 'Enter your phone number',
                                errorStyle: TextStyle(color: Colors.red),
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(2, 2, 2, 5),
                          child: Container(
                            margin: EdgeInsets.only(bottom: screenHeight / 40),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 15,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              onTap: () => _selectDate(context),
                              controller: birthdayController,
                              readOnly: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                prefixIcon: Container(
                                  decoration: const BoxDecoration(
                                      border:
                                      Border(right: BorderSide(color: Colors.black26))),
                                  margin: const EdgeInsets.only(right: 7),
                                  child: Icon(
                                    Icons.cake,
                                    color: Colors.black54,
                                    size: screenHeight / 25,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: screenHeight / 50,
                                ),
                                hintText: 'Select your birthday',
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            globals.name = idController.text;
                            globals.age = birthdayController.text;
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => ProfileSetupPage())
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 0, 2, 5),
                            child: Center(
                              child: Container(
                                height: screenHeight / 18,
                                width: screenWidth / 3,
                                margin: EdgeInsets.only(bottom: screenHeight / 40),
                                decoration: const BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.all(Radius.circular(40)),
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
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: screenWidth / 25,
                                      color: Colors.white,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
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
