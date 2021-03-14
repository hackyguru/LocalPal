import 'dart:async';
import 'package:chatApp/helper/Constants.dart';
import 'package:chatApp/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class _EventsState extends State<Events> {
  CarouselSlider carouselSlider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEF5A4C),
        title: Text(
          "Events",
          style: GoogleFonts.robotoMono(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Color(0xFFFFEEED),
      body: Container(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: 10),
                        Text("Nearby events",
                            style: GoogleFonts.robotoMono(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: carouselSlider = CarouselSlider(
                          options: CarouselOptions(
                            height: 200,
                            viewportFraction: 0.9,
                            initialPage: 0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration: Duration(seconds: 3),
                            autoPlayInterval: Duration(seconds: 3),
                            scrollDirection: Axis.horizontal,
                          ),
                          items: imgList.map((e) {
                            return Container(
                              width: 350,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(4278190106),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        e,
                                      ),
                                      fit: BoxFit.fill)),
                            );
                          }).toList()),
                    )
                  ],
                ),
              ),
              // Place the cards here and remove the sized box
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.group),
                        SizedBox(width: 10),
                        Text("Nearby communities",
                            style: GoogleFonts.robotoMono(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                      ],
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: carouselSlider = CarouselSlider(
                          options: CarouselOptions(
                            height: 200,
                            viewportFraction: 0.9,
                            initialPage: 0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration: Duration(seconds: 3),
                            autoPlayInterval: Duration(seconds: 3),
                            scrollDirection: Axis.horizontal,
                          ),
                          items: imgList.map((e) {
                            return Container(
                              width: 350,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(4278190106),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        e,
                                      ),
                                      fit: BoxFit.fill)),
                            );
                          }).toList()),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
