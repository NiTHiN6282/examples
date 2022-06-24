import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test1/authentication/home.dart';
import 'package:test1/authentication/registerpage.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isHidden = true;
  final _loginkey = GlobalKey<FormState>();
  TextEditingController emailinputcontroller = TextEditingController();
  TextEditingController nameinputcontroller = TextEditingController();
  TextEditingController phoneinputcontroller = TextEditingController();
  TextEditingController passwordinputcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                Text("Login",
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
                              Icon(Icons.lock),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: TextFormField(
                                  controller: passwordinputcontroller,
                                  obscureText: _isHidden,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    suffix: InkWell(
                                      onTap: _togglePasswordView,
                                      child: Icon(
                                        _isHidden ? Icons.visibility : Icons.visibility_off,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    RegExp regex =
                                    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
                                    if (value!.isEmpty) {
                                      return 'Please enter password';
                                    } else if(value.length<6){
                                      return 'Password must contain atleast 6 characters';
                                    }
                                    else{
                                      if (!regex.hasMatch(value)) {
                                        return 'Enter valid password';
                                      } else {
                                        return null;
                                      }
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
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            onPrimary: Colors.white,
                            shadowColor: Colors.greenAccent,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            minimumSize: Size(300, 40), //////// HERE
                          ),
                          onPressed: () async {
                            if(_loginkey.currentState!.validate()){
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                  email: emailinputcontroller.text,
                                  password: passwordinputcontroller.text)
                                  .then((value) => FirebaseFirestore.instance
                                  .collection('user')
                                  .doc(value.user!.uid)
                                  .get()
                                  .then((value) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Home()
                                      ));
                              }))
                                  .catchError(
                                      (e) => showsnackbar('Login failed'));
                            }
                          },
                          child: Text('Login'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("New User?"),
                            TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(),));
                                },
                                child: Text("Register",
                                  style: TextStyle(
                                      color: Color(0xff1852b0)
                                  ),
                                )
                            )
                          ],
                        )
                      ],
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );


  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  showsnackbar(String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      backgroundColor: Colors.blue,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
