import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 600,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/5,
                      height: MediaQuery.of(context).size.width/5,
                      margin: EdgeInsets.only(bottom: 30),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 5),
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('user.png'),
                        ),
                      ),
                    ),
                    textField(hintText: "Sukiyem"),
                    SizedBox(height:10),
                    textField(hintText: "sukiyemgawl@gmail.com"),
                    SizedBox(height: 10),
                    textField(hintText: "sukiyemgawl"),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 35,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.amber),
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            "Update",
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                            ),
                          ),    
                        ),
                      ),
                    ),
                  ]
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget textField ({required String hintText}) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            letterSpacing: 2,
            color: Colors.white54,
            fontWeight: FontWeight.bold
          ),
          fillColor: Colors.black38,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none
          )
        ),
      ),
    );
  }
}