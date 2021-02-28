import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamanisinde/screen/isVeren_screens/ana_ekran.dart';
import 'package:zamanisinde/screen/isci_screens/anaEkran.dart';
import 'package:zamanisinde/screen/isci_screens/kayitOl_bilgler.dart';
import 'package:zamanisinde/widgets/loading.dart';

class HomeWrapper extends StatefulWidget {
  final Function setRegister;
  HomeWrapper({this.setRegister});

  @override
  HomeWrapperState createState() => HomeWrapperState();
}

class HomeWrapperState extends State<HomeWrapper> {
  @override
  Widget build(BuildContext context) {
    try {
      if (Provider.of<DocumentSnapshot>(context) == null) {
        return Loading();
      } else if (Provider.of<DocumentSnapshot>(context).data["registered"]) {
        if (Provider.of<DocumentSnapshot>(context).data["employer"]) {
          return EmployerHome();
        }
        return SeekerHome();
      }
      return Registration(setRegister: widget.setRegister);
    } catch (err) {
      print(err.toString());
    }
    return Registration();
  }
}
