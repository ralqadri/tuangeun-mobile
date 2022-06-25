import 'textFied.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home:RegisterPage())
  );
}

class RegisterPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red[900],
      body: Container(
        padding: EdgeInsets.all(90),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/icons/logo.png',
                    height: size.height*0.15,
                  ),
                  SizedBox(height: 0.1,),
                  Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                    ),
                  )
                ],
              ),
              TextFieldContainer(
                child: Material(
                  child: TextField(
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
                    hintText:'Nama Lengkap'
                  ),
                ),
                ),
              ),
              TextFieldContainer(
                child: Material(
                  child: TextField(
                    obscureText: true,
                  decoration: InputDecoration(
                    hintText:'Login'
                  ),
                ),
                ),
              ),
              Container(
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      onPrimary: Colors.white
                    ),
                    child: Text('Register'),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Sudah Punya Akun?', style: TextStyle(color: Colors.white),),
                    GestureDetector(
                      onTap: (){},
                      child: Text(
                        ' Login Disini!',
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


