import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'resto_class.dart';
import 'tuangeun_theme.dart';

class PlainRestoInformationPage extends StatelessWidget {
  PlainRestoInformationPage(this.resto, {super.key});

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
        ),
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
