import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'LoginPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  var pass;
  var confirmpass;
  final _loginkey = GlobalKey<FormState>();
  TextEditingController emailinputcontroller = TextEditingController();
  TextEditingController nameinputcontroller = TextEditingController();
  TextEditingController phoneinputcontroller = TextEditingController();
  TextEditingController passwordinputcontroller = TextEditingController();
  TextEditingController confirmpasswordinputcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = TextStyle(color: Colors.black54, fontSize: 15.0);
    TextStyle linkStyle = TextStyle(color: Color(0xff1852b0),);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.grey
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Center(
                //   child: Image.asset("assets/delivery.png",
                //     height: 200,),
                // ),
                Text("Sign Up",
                  style: TextStyle(
                      fontSize: 20
                  ),),
                SizedBox(
                  height: 20,
                ),
                Form(
                    key: _loginkey,
                    child: Column(
                      children: [

                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.email),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailinputcontroller,
                                  decoration: InputDecoration(
                                    hintText: "Email ID",
                                  ),
                                  validator: (value) {
                                    const pattern =
                                        r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                                    final regExp = RegExp(pattern);

                                    if (value!.isEmpty) {
                                      return 'Enter an email';
                                    } else if (!regExp.hasMatch(value)) {
                                      return 'Enter a valid email';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.person),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  controller: nameinputcontroller,
                                  decoration: InputDecoration(
                                    hintText: "Full Name",
                                  ),
                                  validator: (value) {
                                    if (value!.length < 3) return 'Invalid Name';
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.phone),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: TextFormField(
                                  maxLength: 10,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.phone,
                                  controller: phoneinputcontroller,
                                  decoration: InputDecoration(

                                    hintText: "Mobile",
                                  ),
                                  validator: (value) {
                                    if (value!.length != 10) {
                                      return 'Number should contain 10 characters!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.lock),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  controller: passwordinputcontroller,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                  ),
                                  validator: (value) {
                                    pass=value;
                                    if (value!.length < 6) {
                                      return 'Password must be at least 6 characters long';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.lock),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  controller: confirmpasswordinputcontroller,
                                  decoration: InputDecoration(
                                    hintText: "Confirm Password",
                                  ),
                                  validator: (value) {
                                    confirmpass=value;
                                    if (value!.length < 6) {
                                      return 'Password must be at least 6 characters long';
                                    } else if (pass!=confirmpass) {
                                      return 'not match';
                                    }else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: TextSpan(
                            style: defaultStyle,
                            children: <TextSpan>[
                              TextSpan(text: "By signing up, you're agree to our "),
                              TextSpan(
                                  text: 'Terms of Service',
                                  style: linkStyle,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('Terms & Conditions');
                                    }),
                              TextSpan(text: ' and '),
                              TextSpan(
                                  text: 'Privacy Policy',
                                  style: linkStyle,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('Privacy Policy');
                                    }),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            onPrimary: Colors.white,
                            shadowColor: Colors.greenAccent,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)
                            ),
                            minimumSize: Size(300, 40), //////// HERE
                          ),
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if(_loginkey.currentState!.validate()){
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                  email: emailinputcontroller.text,
                                  password: passwordinputcontroller.text)
                                  .then((value) => FirebaseFirestore.instance
                                  .collection('user')
                                  .doc(value.user!.uid)
                                  .set({
                                'uid': value.user!.uid,
                                'name': nameinputcontroller.text,
                                'phone': phoneinputcontroller.text,
                                'email': emailinputcontroller.text,
                                'date': DateTime.now(),
                              }).catchError((e) => showsnackbar(
                                  'Registration Failed')))
                                  .then((value) {
                                showsnackbar('Registered successfully');
                                Navigator.pop(context);
                              }).catchError(
                                      (e) => showsnackbar('Registration failed'));
                            }
                          },
                          child: Text('Sign Up'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Joined us before?"),
                            TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => LoginPage(),)
                                  );
                                },
                                child: Text("Login",
                                  style: TextStyle(
                                      color: Color(0xff1852b0)
                                  ),
                                )
                            )
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  showsnackbar(String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      backgroundColor: Colors.blue,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
