import 'package:bacameterpdam/page/photometer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                color: Colors.blue,
                height: 60,
                child: Center(
                  child: Text(
                    "PDAM Tirta Pancur Aji",
                    style: GoogleFonts.merriweather()
                        .copyWith(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              height: 120,
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            image: AssetImage("assets/images/y.png"))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Text(
                          "Sudah Terbaca",
                          style: GoogleFonts.merriweather()
                              .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Text(
                              "12.000",
                              style: GoogleFonts.robotoSlab()
                                  .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Text(
                              "Rumah",
                              style: GoogleFonts.robotoSlab()
                                  .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 6,
            ),
            InkWell(
              child: Container(
                height: 120,
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: AssetImage("assets/images/n.png"))),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Text(
                            "Belum Terbaca",
                            style: GoogleFonts.merriweather()
                                .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 6),
                              child: Text(
                                "2.000",
                                style: GoogleFonts.robotoSlab()
                                    .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 6),
                              child: Text(
                                "Rumah",
                                style: GoogleFonts.robotoSlab()
                                    .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PagePhotoMeter()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
