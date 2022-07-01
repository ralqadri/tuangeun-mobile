import 'dart:js';
import 'package:flutter/material.dart';
import 'package:tuangeun/home.dart';
import 'textField.dart';
import 'registerPage.dart';

void main() {
  runApp(
    MaterialApp(home:LoginPage())
  );
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: Colors.red[900],
      body: Container(
        padding: EdgeInsets.all(100),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'icons/logo.png',
                    height: size.height*0.15,
                  ),
                  SizedBox(height: 0.1,),
                  Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                    ),
                  )
                ],
              ),
              TextFieldContainer(
                child: Material(
                  child: TextFormField(
                  decoration: InputDecoration(
                    hintText:'Email'
                  ),
                ),
                ),
              ),
              TextFieldContainer(
                child: Material(
                  child: TextField(
                    obscureText: true,
                  decoration: InputDecoration(
                    hintText:'Password'
                  ),
                ),
                ),
              ),
              Container(
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ElevatedButton(
                    onPressed: (){
                      showDialog(
                        context: context, 
                        builder: (context) => AlertDialog(
                          title: const Text('Login'),
                          content: const Text('Login success!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst), 
                              child: const Text('OK'),
                            )
                          ],
                        )
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      onPrimary: Colors.white
                    ),
                    child: Text('Login'),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Belum Punya Akun?', style: TextStyle(color: Colors.white),),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text(
                        ' Register Disini!',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),),
                    )
                  ],
                )
            ],
          ),
        ),
    );
  }
}