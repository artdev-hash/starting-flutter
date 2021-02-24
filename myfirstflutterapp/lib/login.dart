import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'index.dart';

class LoginValid extends StatefulWidget {
  @override
  _LoginValidState createState() => _LoginValidState();
}

class _LoginValidState extends State<LoginValid> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

//String validateemail(String value) {
  // if (validateemail(value) == "kim.dev@gmail.com") {
  //  return "* Required";
  // } else if (value.length < 6) {
  //  return "Password should be atleast 6 characters";
  // } else if (value.length > 15) {
  //   return "Password should not be greater than 15 characters";
  //  } else
  //    return null;
  // }

  // String validatePassword(String value) {
  //  if (value.isEmpty) {
  //    return "* Required";
  //   } else if (value.length < 6) {
  //    return "Password should be atleast 6 characters";
  //   } else if (value.length > 15) {
  //     return "Password should not be greater than 15 characters";
  //   } else
  //     return null;
//  }
  final passwordController = TextEditingController();

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);

  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Form(
          //autovalidate: true, //check for validation while typing
          key: formkey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Container(
                      width: 300,
                      height: 250,
                      child:
                          Image.asset('asset/images/iamthecoffeeguylogo.PNG')),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter valid email id as abc@gmail.com'),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      EmailValidator(errorText: "Enter valid email id"),
                    ])),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                  onChanged: (val) => password = val,
                  validator: passwordValidator,
                  //validator: MultiValidator([
                  //RequiredValidator(errorText: "* Required"),
                  //MinLengthValidator(6,
                  //    errorText: "Password should be atleast 6 characters"),
                  //MaxLengthValidator(15,
                  //    errorText:
                  //   "Password should not be greater than 15 characters")
                  //])
                  //validatePassword,        //Function to check validation
                ),
              ),
              TextButton(
                onPressed: () {
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    if (formkey.currentState.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomePage()));
                      print("Validated");
                    } else {
                      print("Not Validated");
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Text('New User? Create Account')
            ],
          ),
        ),
      ),
    );
  }
}
