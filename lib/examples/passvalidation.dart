

import 'package:flutter/material.dart';

class PassValidation extends StatefulWidget {
  const PassValidation({Key? key}) : super(key: key);

  @override
  State<PassValidation> createState() => _PassValidationState();
}

class _PassValidationState extends State<PassValidation> {
  final _formKey = GlobalKey<FormState>();

  // regular expression to check if string
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double password_strength = 0;

  // 0: No password
  // 1/4: Weak
  // 2/4: Medium
  // 3/4: Strong
  //   1:   Great

  //A function that validate user entered password
  bool validatePassword(String pass){
    String _password = pass.trim();

    if(_password.isEmpty){
      setState(() {
        password_strength = 0;
      });
    }else if(_password.length < 6 ){
      setState(() {
        password_strength = 1 / 4;
      });
    }else if(_password.length < 8){
      setState(() {
        password_strength = 2 / 4;
      });
    }else{
      if(pass_valid.hasMatch(_password)){
        setState(() {
          password_strength = 4 / 4;
        });
        return true;
      }else{
        setState(() {
          password_strength = 3 / 4;
        });
        return false;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  onChanged: (value){
                    _formKey.currentState!.validate();
                  },
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please enter password";
                    }else{
                      //call function to check password
                      bool result = validatePassword(value);
                      if(result){
                        // create account event
                        return null;
                      }else{
                        return " Password should contain Capital, small letter & Number & Special";
                      }
                    }
                  },
                  decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Password"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: LinearProgressIndicator(
                  value: password_strength,
                  backgroundColor: Colors.grey[300],
                  minHeight: 5,
                  color: password_strength <= 1 / 4
                      ? Colors.red
                      : password_strength == 2 / 4
                      ? Colors.yellow
                      : password_strength == 3 / 4
                      ? Colors.blue
                      : Colors.green,
                ),
              ),
              ElevatedButton(onPressed: password_strength != 1 ? null : (){
                //perform click event
              }, child: Text("Submit form"))
            ],
          ),
        ),
      ),
    );
  }
}