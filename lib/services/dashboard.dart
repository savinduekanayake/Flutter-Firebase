import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_firestore/services/crud.dart';


//==============CRUD OPARATIONS ===========
class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  String carModel;
  String carColor;

  Stream cars;  //Querysnapshot cars

  crudMedthods crudObj = new crudMedthods();

  Future<bool> addDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add data', style: TextStyle(fontSize: 15.0),),
          content: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Enter car Name'),
                onChanged: (value){
                  this.carModel = value;
                },
              ),
              SizedBox(height: 5.0,),
              TextField(
                decoration: InputDecoration(hintText: 'Enter car color'),
                onChanged: (value){
                  this.carColor = value;
                },
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
                child: Text('Add'),
              textColor: Colors.blue,
              onPressed: (){
                  print('hi1');
                  Navigator.of(context).pop();
                  Map carData = {'carName': this.carModel, 'color': this.carColor};
                  crudObj.addData(carData).then((result){
                    print('hi2');
                    dialogTrigger(context);
                    print('hi3');
                  }).catchError((e) {
                    print(e);
                  });
              },
            )
          ],
        );
      }
    );
  }

  Future<bool> updateDialog(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Update data', style: TextStyle(fontSize: 15.0),),
            content: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Enter car Name'),
                  onChanged: (value){
                    this.carModel = value;
                  },
                ),
                SizedBox(height: 5.0,),
                TextField(
                  decoration: InputDecoration(hintText: 'Enter car color'),
                  onChanged: (value){
                    this.carColor = value;
                  },
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Update'),
                textColor: Colors.blue,
                onPressed: (){

                  Navigator.of(context).pop();
                  Map carData = {'carName': this.carModel, 'color': this.carColor};
                  crudObj.updateData(selectedDoc, carData).then((result){
//                    dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              )
            ],
          );
        }
    );
  }

  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
        context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Job Done', style: TextStyle(fontSize: 15.0),),
            content: Text('Added'),
            actions: <Widget>[
              FlatButton(
                child: Text('Alright'),
                textColor: Colors.blue,
                onPressed: () {
                  print('hi4');
                  Navigator.of(context).pop();
                },
              )
            ],
          );
      }
    );
  }

  @override
  void initState(){
    crudObj.getData().then((results) {
      setState(() {
        cars = results;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                addDialog(context);
              }
          ),
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: (){
                crudObj.getData().then((results) {
                  setState(() {
                    cars = results;
                  });
                });
              }
          ),
        ],
      ),
      body: _carList(),
    );
  }

  Widget _carList() {
    if(cars != null) {
      //+++++++++ Collection().getdocuments()
//      return ListView.builder(
//        itemCount: cars.documents.length,
//        padding: EdgeInsets.all(5.0),
//        itemBuilder: (context, i) {
//          return new ListTile(
//            title: Text(cars.documents[i].data['carname']),
//            subtitle: Text(cars.documents[i].data['color']),
//          );
//        },
//      );
        //++++++Strams to realtime
        return StreamBuilder(
          stream: cars,
          builder: (context , snapshot){
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              padding: EdgeInsets.all(5.0),
              itemBuilder: (context, i) {
                return new ListTile(
                  title: Text(snapshot.data.documents[i].data['carname']),
                  subtitle: Text(snapshot.data.documents[i].data['color']),
                  onTap: (){
                    updateDialog(context, snapshot.data.documents[i].documentID);
                  },
                  onLongPress: (){
                    crudObj.deleteData(snapshot.data.documents[i].documentID);
                  },
                );
              },
            );
          },
        );
    }else {
      return Text('Loading, Please wait...');
    }
  }
}
