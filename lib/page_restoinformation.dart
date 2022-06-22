import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'resto_class.dart';
import 'tuangeun_theme.dart';

class RestoInformationPage extends StatelessWidget {
  RestoInformationPage(this.resto, {super.key});

  Resto resto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(resto.name),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _launchURL(resto.googleMapsLink);
        },
        icon: const Icon(
          Icons.location_on,
          color: Colors.white,
        ),
        label: Text(
          ' Open on Google Maps ',
          style: TuangeunTheme.darkTextTheme.headline5,
        ),
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 450,
                  padding: const EdgeInsets.all(16),
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(resto.imageLink),
                        fit: BoxFit.cover,
                      ),
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xCC000000),
                            Color(0x00000000),
                            Color(0x00000000),
                            Color(0xCC000000),
                          ]),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ])),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.5),
                        child: Text(
                          resto.name,
                          style: TuangeunTheme.darkTextTheme.headline1,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.5, top: 5),
                        child: Text(
                          resto.desc,
                          style: TuangeunTheme.darkTextTheme.bodyLarge,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}
