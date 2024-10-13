import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginsignup/methods.dart';

class Createaccount extends StatefulWidget {
  const Createaccount({super.key});

  @override
  State<Createaccount> createState() => _CreateaccountState();
}

class _CreateaccountState extends State<Createaccount> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [ 
          SizedBox(
            height: size.height / 20,
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: size.width / 1.2,
           child:IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios))),
           SizedBox(
            height: size.height / 50,
          ),
          Container(
            width: size.width / 1.3,
            child: Text(
              "Welcome",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              ),),
          Container(
            width: size.width / 1.3,
            child: Text(
              "Create Account to continue!",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              ),),
            SizedBox(
            height: size.height / 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Container(
              width: size.width,
              alignment: Alignment.center,
              child: field(size, "Name",Icons.account_box,_name),
              ),
          ),  
           Container(
            width: size.width,
            alignment: Alignment.center,
            child: field(size, "Email",Icons.account_box,_email),
            ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 18.0),
             child: Container(
              width: size.width,
              alignment: Alignment.center,
              child: field(size, "password",Icons.lock,_password),
              ),
           ),
          SizedBox(
            height: size.height / 20,
          ),
          customButton(size), 
          SizedBox(
            height: size.height / 20,
          ), 
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),     
        ],
      ),
    );
  }
  Widget customButton(Size size){
    return GestureDetector(
      onTap: (){
        if(_name.text.isNotEmpty &&
          _email.text.isNotEmpty &&
          _password.text.isNotEmpty){

            setState(() {
              isLoading = true;
            });

            createaccount(_name.text, _email.text, _password.text).then((user){
              if(user != null){
                setState(() {
                  isLoading = false;
                });
                print("Login successful");
              }else{
                print("Login failed");
              }
            });
          }else{
            print("Please enter fields");
          }
            },
      child: Container(
        height: size.height / 14,
        width: size.width / 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        alignment: Alignment.center,
        child: Text(
          "Create Account",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  Widget field(Size size, String hintText, IconData icon,TextEditingController cont){
    return Container(
      height: size.height / 15,
      width: size.width / 1.3,
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}