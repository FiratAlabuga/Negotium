import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamanisinde/model/kullanici.dart';
import 'package:zamanisinde/services/auth.dart';

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Kullanici>(context);
    final AuthService _auth = AuthService();
    return Scaffold(
      backgroundColor: color,
      body: Column(children: [
        Text(user.uid),
        Text(user.kayitVarmi.toString()),
      ]),
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text("Yet Tutucu"),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(Icons.exit_to_app),
            label: Text("Çıkış Yap"),
          )
        ],
      ),
    );
  }
}
