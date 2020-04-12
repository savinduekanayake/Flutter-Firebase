import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

//Image plugin
import 'package:image_picker/image_picker.dart';

// Firebase storage plugin
//import 'package:firebase_storage/firebase_storage.dart';

class ImageUpload extends StatefulWidget {
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {

  File sampleImage;

  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      sampleImage = tempImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Image Upload'),
        centerTitle: true,
      ),
      body: new Center(
        child:  sampleImage == null? Text('Select an image') : enableUpload(),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: getImage,
          tooltip: 'Add Image',
        child: new Icon((Icons.add)),
      ) ,
    );
  }

  Widget enableUpload() {
    return Container(
      child: Column(
        children: <Widget>[
          Image.file(sampleImage, height: 300.0 , width: 300.0,),
          RaisedButton(
              elevation: 7.0,
              child: Text('upload'),
              textColor: Colors.blue,
              onPressed: (){
//                final StorageReference firebaseStorageRef =
//                      FirebaseStorage.instance.ref().child('myimage.jpg');
//
//                final StorageUploadTask task =
//                      firebaseStorageRef.putFile(sampleImage);


              }
          )
        ],
      ),
    );
  }
}
