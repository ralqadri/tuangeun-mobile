import 'package:cached_network_image/cached_network_image.dart';
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
              CachedNetworkImage(
                imageUrl: resto.imageLink,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => bigImageCardContainer(context, resto.id % 15 == 0 ? const AssetImage('images/default2.jpg') : resto.id % 2 == 0 ? const AssetImage('images/default1.jpg') : const AssetImage('images/default3.jpg')),
                imageBuilder: (context, imageProvider) => bigImageCardContainer(context, imageProvider)
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.5),
                        child: Text(
                          resto.category,
                          style: TuangeunTheme.darkTextTheme.headline3,
                        ),
                      ),
                    ),
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
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 48),
                      child: Divider(color: Color.fromRGBO(255, 255, 255, 0.4)),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.5, top: 2.5),
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

Widget bigImageCardContainer(BuildContext context, ImageProvider img) {
  return Container(
      width: MediaQuery.of(context).size.width,
      height: 450,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: img,
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
          ]));
}
