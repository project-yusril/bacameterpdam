import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageCatatMeter extends StatefulWidget {
  @override
  _PageCatatMeterState createState() => _PageCatatMeterState();
}

class _PageCatatMeterState extends State<PageCatatMeter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.blue,
        body: Column(
      children: <Widget>[
        SafeArea(
          child: Container(
            color: Colors.blue,
            height: 60,
            child: Center(
              child: Text(
                "Catat Meter",
                style: GoogleFonts.merriweather()
                    .copyWith(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Placeholder()
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Icon(
                        Icons.list,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
