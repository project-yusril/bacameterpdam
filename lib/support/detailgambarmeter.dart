import 'dart:convert';
import 'dart:io';

import 'package:bacameterpdam/support/gambarmeter.dart';
import 'package:bacameterpdam/support/library.dart';
import 'package:bacameterpdam/support/listgambarmeter.dart';
import 'package:flutter/material.dart';

class DetailGambarMeter extends StatefulWidget {
  final GambarMeter gambarMeter;
  DetailGambarMeter(this.gambarMeter);

  @override
  _DetailGambarMeterState createState() => _DetailGambarMeterState(this.gambarMeter);
}

class _DetailGambarMeterState extends State<DetailGambarMeter> {
  LibraryPdam libraryPdam=LibraryPdam();

  GambarMeter gambarMeter;
  _DetailGambarMeterState(this.gambarMeter);

  TextEditingController nopelangganController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    nopelangganController.text=gambarMeter.nomorpelanggan;
    final decodebytes=base64Decode(gambarMeter.foto);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            Container(
              height: 280,
              color: Colors.blue,
              child: Image.memory(decodebytes),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: nopelangganController,
              onChanged: (valor){
                updateNomorPelanggan();
              },
              decoration: InputDecoration(
                labelText: 'nama pelanggan',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)
                )
              ),
            ),
            SizedBox(height: 5,),
            RaisedButton(
              child: Text("Simpan"),
              onPressed: (){
                setState(() {
                  _simpan();
                });
              },
            ),
            SizedBox(height: 5,),
            RaisedButton(
              child: Text("Cek Photo", style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.red
              ),),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ListGambarMeter()));
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: (){},
      ),
    );
  }

  void movetoLastScreen(){
    Navigator.pop(context, true);
  }

  void updateNomorPelanggan(){
    gambarMeter.nomorpelanggan=nopelangganController.text;
  }

  void _simpan() async {
    movetoLastScreen();
    int result;
    if(gambarMeter.id!=null) {
      result= await libraryPdam.updateGambar(gambarMeter);
    } else {
      result= await libraryPdam.insertGambar(gambarMeter);
    }
    if (result!=0) {
      _showAlert('Status','Gambar Berhasil Disimpan');
    } else {
      _showAlert('Status','Gambar gagal Disimpan');
    }
  }

  void _showAlert (String nomorpelanggan, String pesan) {
    AlertDialog alertDialog=AlertDialog(
      title: Text(nomorpelanggan),
      content: Text(pesan),
    );
    showDialog(context: context, builder: (_)=>alertDialog);
  }
}
