import 'package:flutter/material.dart';
import 'package:loginsignup/Createaccount.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
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
              "Sign in to continue!",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
              ),),
            SizedBox(
            height: size.height / 10,
          ),  
           Container(
            width: size.width,
            alignment: Alignment.center,
            child: field(size, "Email",Icons.account_box, _email),
            ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 18.0),
             child: Container(
              width: size.width,
              alignment: Alignment.center,
              child: field(size, "password",Icons.lock, _password),
              ),
           ),
          SizedBox(
            height: size.height / 10,
          ),
          customButton(size),  
        SizedBox(
            height: size.height / 20,
          ), 
        GestureDetector(
          onTap: () => 
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => Createaccount())),
          child: Text(
             "Create Account?",
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
      onTap: (){},
      child: Container(
        height: size.height / 14,
        width: size.width / 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        alignment: Alignment.center,
        child: Text(
          "Login",style: TextStyle(
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