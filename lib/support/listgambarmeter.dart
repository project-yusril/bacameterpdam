import 'dart:convert';
import 'dart:io';

import 'package:bacameterpdam/page/photometer.dart';
import 'package:bacameterpdam/support/detailgambarmeter.dart';
import 'package:flutter/material.dart';
import 'package:bacameterpdam/support/library.dart';
import 'package:bacameterpdam/support/gambarmeter.dart';
import 'package:sqflite/sqflite.dart';

class ListGambarMeter extends StatefulWidget {
  @override
  _ListGambarMeterState createState() => _ListGambarMeterState();
}

class _ListGambarMeterState extends State<ListGambarMeter> {

  LibraryPdam libraryPdam=LibraryPdam();
  List<GambarMeter> gambarList;

  @override
  Widget build(BuildContext context) {
    if(gambarList==null){
      gambarList=List<GambarMeter>();
      updateListView();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("List IDPEL"),
      ),
      body: ListView.builder(
        itemCount: gambarList==null? 0: gambarList.length,
        itemBuilder: (BuildContext context, int posisi)
      {
        return Card(
          child: ListTile(
            title: Text(this.gambarList[posisi].nomorpelanggan),
            subtitle: Text(this.gambarList[posisi].nomorpelanggan),
            leading: Image.memory(base64Decode(this.gambarList[posisi].foto)),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: (){
                hapuslistgambar(context, gambarList[posisi]);
              },
            ),
            onTap: (){
              navigationKamera(this.gambarList[posisi]);
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_box),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PagePhotoMeter()));
        },
      ),
    );
  }

  void navigationKamera(GambarMeter gambarMeter) async {
    bool result= await Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailGambarMeter(gambarMeter)));
    if (result==true){
      updateListView();
    }
  }

  void hapuslistgambar(BuildContext context, GambarMeter gambarMeter) async {
    int result = await libraryPdam.hapusGambar(gambarMeter.id);
    if(result!=0) {
      _cekSnackBar(context, 'Hapus IDPEL Sukses');
      updateListView();
    }
  }

  void _cekSnackBar(BuildContext context, String pesan) {
    final snackbar=SnackBar(
      content: Text(pesan),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }

  void updateListView() {
    final Future<Database> dbFuture = libraryPdam.initDataBase();
    dbFuture.then((database) {
      Future<List<GambarMeter>> gambarmeterListFuture = libraryPdam
          .ambilGambarMaplist();
      gambarmeterListFuture.then((gambarlist) {
        setState(() {
          this.gambarList = gambarlist;
          this.gambarList.length = gambarlist.length;
        });
      });
    });
  }

}
