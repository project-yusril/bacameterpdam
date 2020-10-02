import 'dart:convert';
import 'dart:io';

import 'package:bacameterpdam/support/detailgambarmeter.dart';
import 'package:bacameterpdam/support/gambarmeter.dart';
import 'package:bacameterpdam/support/library.dart';
import 'package:bacameterpdam/support/listgambarmeter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class PagePhotoMeter extends StatefulWidget {
  PagePhotoMeter({Key key}) : super(key: key);

  @override
  _PagePhotoMeterState createState() => _PagePhotoMeterState();
}

class _PagePhotoMeterState extends State<PagePhotoMeter> {

  LibraryPdam libraryPdam=LibraryPdam();

  TextEditingController titleController=TextEditingController();

  File _gambarmeter;

  GambarMeter gambarMeter;

  String gambarMeterRoute='';

  void _getGambarMeter(BuildContext context) async {
    //final String pathRoute=(await getTemporaryDirectory()).path+ '${DateTime.now()}.png';

    var gambarmeter = await ImagePicker.pickImage(source: ImageSource.camera);
    //final File localImage= await gambarmeter.copy('$pathRoute');

    final bytes = gambarmeter.readAsBytesSync();
    final gambarmetersekarang = base64Encode(bytes);

    this.setState(() {
      _gambarmeter=gambarmeter;
      gambarMeterRoute = gambarmetersekarang;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              Container(
                height: 280,
                color: Colors.blueAccent,
                child: _gambarmeter==null?Text("Tidak Ada Gambar", style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,): Image.file(_gambarmeter, height: 355,),
              ),
              SizedBox(height: 10,),
              RaisedButton(
                child: Text("Simpan"),
                onPressed: (){
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>
                          DetailGambarMeter(GambarMeter(gambarMeterRoute,''))));
                  });
                },
              ),
              SizedBox(height: 5,),
              RaisedButton(
                child: Text("Lihat"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ListGambarMeter()));
                },
              ),
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: (){
          _getGambarMeter(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
