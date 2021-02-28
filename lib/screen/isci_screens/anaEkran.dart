import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamanisinde/model/kullanici.dart';
import 'package:zamanisinde/screen/isci_screens/ayarlar.dart';
import 'package:zamanisinde/screen/isci_screens/gecmis.dart';
import 'package:zamanisinde/screen/isci_screens/kesfet.dart';
import 'package:zamanisinde/services/fireStore.dart';
import 'package:zamanisinde/widgets/insh.dart';

class SeekerHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SeekerHomeState();
  }
}

class ExploreWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Kullanici>(context);
    return StreamProvider<QuerySnapshot>.value(
      value: FirestoreService(uid: user.uid).jobData,
      child: Explore(),
    );
  }
}

class HistoryWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Kullanici>(context);
    return StreamProvider<DocumentSnapshot>.value(
      value: FirestoreService(uid: user.uid).userData,
      child: History(),
    );
  }
}

class _SeekerHomeState extends State<SeekerHome> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ExploreWrapper(),
    Construction(),
    HistoryWrapper(),
    Settings(),
  ];

  Widget getWidget(int index) {
    return _children[index];
  }

  void onTabTapped(int index) {
    if (index < _children.length) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getWidget(_currentIndex),
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
              primaryColor: Theme.of(context).accentColor),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: new Icon(Icons.assignment),
                  //title: new Text("Keşfet"),
                  label: 'Keşfet'
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.message),
                  //title: new Text("Mesajlar"),
                    label: 'Mesajlar'
                ),
                BottomNavigationBarItem(
                    icon: new Icon(Icons.library_books),
                    //title: new Text("Tarih"),
                    label: 'Tarih'
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.person),
                  //title: new Text("Profil"),
                    label: 'Profil'
                ),
              ]),
        ));
  }
}
