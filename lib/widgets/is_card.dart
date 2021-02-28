import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'detaylar.dart';

class JobCard extends StatefulWidget {
  @override
  _JobCardState createState() => _JobCardState();

  final DocumentSnapshot job;

  JobCard(this.job);
}

class _JobCardState extends State<JobCard> {
  bool loading;
  dynamic userData;
  @override
  void initState() {
    super.initState();
    loading = true;
    userData = "";
    getUserData().then((snapshot) {
      setState(() {
        userData = snapshot.data;
        loading = false;
      });
    });
  }

  Future<DocumentSnapshot> getUserData() async {
    return await widget.job['user'].get();
  }

  @override
  Widget build(BuildContext context) {
    String date =
        DateFormat.MMMMd().format(widget.job.data['beginTime'].toDate());
    String startTime =
        DateFormat.jm().format(widget.job.data['beginTime'].toDate());
    String endTime =
        DateFormat.jm().format(widget.job.data['endTime'].toDate());

    return new GestureDetector(
        onTap: () => Navigator.of(context).push(new PageRouteBuilder(
              pageBuilder: (_, __, ___) => new DetailPage(widget.job),
            )),
        child: Stack(
          children: <Widget>[
            Card(
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Colors.white70),
                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        widget.job.data['name'],
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.4 + 10,
                          0,
                          0,
                          0),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.attach_money,
                                size: 25,
                              ),
                              Text(widget.job['salary'].toString() + "/TL"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.location_on, size: 20),
                              Text(loading ? "Yükleniyor" : userData['city'])
                            ],
                          ),
                        ],
                      ),
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.4 + 5,
                          10,
                          10,
                          10),
                      width: MediaQuery.of(context).size.width * 0.55,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.calendar_today,
                                size: 20,
                              ),
                              Text(" " + date)
                            ],
                          ),
                        ],
                      ),
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.4 + 10,
                          0,
                          10,
                          10),
                      width: MediaQuery.of(context).size.width * 0.55,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.timer,
                            size: 20,
                          ),
                          Text(" " + startTime + " - " + endTime)
                        ],
                      ),
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.4 + 10,
                          0,
                          10,
                          10),
                      width: MediaQuery.of(context).size.width * 0.55,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        loading
                            ? "Yayınlayan: Yükleniyor..."
                            : "Yayınlayan: " + userData['businessName'],
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.4 + 10,
                          0,
                          0,
                          0),
                    )
                  ],
                ),
              ),
              elevation: 10,
              margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            Card(
                child: _pic(context, widget.job),
                elevation: 5,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )),
          ],
        ));
  }
}

Container _pic(BuildContext context, DocumentSnapshot job) {
  return (Container(
    height: 180,
    width: MediaQuery.of(context).size.width * 0.4,
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: Image(
          image: NetworkImage(
              "https://source.unsplash.com/featured/?" + job.data['name']),
          fit: BoxFit.cover,
        )),
    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
  ));
}
