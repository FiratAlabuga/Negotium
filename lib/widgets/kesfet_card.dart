import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zamanisinde/screen/isci_screens/is_Listesi.dart';
import 'package:zamanisinde/widgets/veri.dart';

class DiscoverCard extends StatelessWidget {
  final Kategori industry;
  final QuerySnapshot jobs;

  DiscoverCard(this.industry, this.jobs);

  @override
  Widget build(BuildContext context) {
    return (GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                new Container(child: JobListings(industry.heading, jobs))),
      ),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Image(
                image: NetworkImage("https://source.unsplash.com/" +
                    industry.image +
                    "/400x300"),
                width: 150,
                height: 85,
                fit: BoxFit.cover,
              )),
          Container(
            width: 150,
            height: 50,
            child: Column(
              children: <Widget>[
                Container(
                  height: 10,
                ),
                Text(industry.heading,
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 15))
              ],
            ),
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
