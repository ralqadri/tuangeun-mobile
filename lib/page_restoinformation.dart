import 'package:cached_network_image/cached_network_image.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'resto_class.dart';
import 'rating_class.dart';
import 'tuangeun_theme.dart';
import 'list_restoratinglistpage.dart';

class RestoInformationPage extends StatelessWidget {
  RestoInformationPage(this.resto, this.restoid, {super.key});

  Resto resto;
  String restoid;

  // JSON parsing for resto list according to category
  Future<List<Rating>> fetchRestoRatings(http.Client client) async {
    final response = await client
        .get(Uri.parse('http://localhost:8000/api/ratings/$restoid'));

    return compute(parseRestoRatings, response.body);
  }

  List<Rating> parseRestoRatings(String responseBody) {
    final parsed = jsonDecode(responseBody);
    // final parsedData = parsed['data'] as List;
    // print(parsed['data']);

    return parsed['data'].map<Rating>((json) => Resto.fromJson(json)).toList();
  }

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
                  errorWidget: (context, url, error) => bigImageCardContainer(
                      context,
                      resto.id % 15 == 0
                          ? const AssetImage('images/default2.jpg')
                          : resto.id % 2 == 0
                              ? const AssetImage('images/default1.jpg')
                              : const AssetImage('images/default3.jpg')),
                  imageBuilder: (context, imageProvider) =>
                      bigImageCardContainer(context, imageProvider)),
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
                    SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12.5, top: 5, bottom: 5),
                        child: Text(
                          resto.desc,
                          style: TuangeunTheme.darkTextTheme.bodyLarge,
                        ),
                      ),
                    ),
                    const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 28),
                        child: Divider(
                            color: Color.fromRGBO(255, 255, 255, 0.4),
                            thickness: 2)),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: FutureBuilder<List<Rating>>(
                          future: fetchRestoRatings(http.Client()),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                  child:
                                      Text('An error has occured!, $restoid'));
                            } else if (snapshot.hasData) {
                              return RestosRatingListPage(
                                  restoratings: snapshot.data!);
                            } else {
                              return Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Loading $restoid comments...',
                                    style:
                                        TuangeunTheme.darkTextTheme.headline3,
                                  )
                                ],
                              ));
                            }
                          }),
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
