import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamanisinde/model/kullanici.dart';
import 'package:zamanisinde/services/fireStore.dart';
import 'ana_wrapper.dart';
import 'isci_screens/girisYap.dart';
import 'isci_screens/kayitOl.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool showRegister = false;

  void toggleRegister() {
    setState(() => showRegister = !showRegister);
  }

  void setRegister() {
    setState(() => showRegister = false);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Kullanici>(context);
    final _firestore = user == null ? null : FirestoreService(uid: user.uid);
    switch (user) {
      case null:
        if (showRegister) {
          return Register(toggleRegister: toggleRegister);
        }
        return Login(toggleRegister: toggleRegister);
      default:
        return StreamProvider<DocumentSnapshot>.value(
          value: user == null ? false : _firestore.userData,
          child: HomeWrapper(setRegister: setRegister),
        );
    }
  }
}
