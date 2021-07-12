
import 'package:api_v2/Services/AuthService.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  var emailController=TextEditingController();
  var usernameController=TextEditingController();
  var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(decoration: InputDecoration(
              hintText: "Email"
            ),
              controller: emailController,
             ),
            TextFormField(decoration: InputDecoration(
              hintText: "UserName"
            ),
              controller: usernameController,
             ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
              hintText: "Password"
            ),
              controller: passwordController,
             ),
            ElevatedButton(onPressed: () {
              //Login();
             AuthService().signUp(emailController.text,passwordController.text);
              //AuthService().signIn(emailController.text,passwordController.text);
            }, child: Text("Login"))
          ],
        ),
      ),),
    );
  }
  void Login()async{

    var parameter={
      "name": usernameController.text,
      "email":  emailController.text,
      "password": passwordController.text
    };
    var response= await Dio().post("https://retail.amit-learning.com/api/register",
      data: parameter,
        options: Options(headers: {"Token":"sa0.sa0.sa0.0.sa"})
    );
    print('${response.data}');
  }
}
