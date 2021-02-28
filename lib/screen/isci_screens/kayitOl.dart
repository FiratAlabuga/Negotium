import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zamanisinde/routes.dart';
import 'package:zamanisinde/services/auth.dart';



class Register extends StatefulWidget {
  final Function toggleRegister;
  Register({this.toggleRegister});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();

  String email = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(30.0, 140.0, 0.0, 0.0),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          height: 0.9,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Negotium\n',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor)),
                          TextSpan(text: '\nKayıt Ol',style: TextStyle(fontSize: 40)),
                          TextSpan(
                              text: '.',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor)),
                        ]),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (val) =>
                        val.isEmpty ? 'Lütfen E-Mail Giriniz.!' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    autocorrect: false,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    key: _passKey,
                    validator: (val) => val.length < 8
                        ? 'Parolan 8 Karakterden Uzun Olmalı!'
                        : null,
                    autocorrect: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Parola',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (val) => val != _passKey.currentState.value
                        ? 'Parolalar eşleşmeli!'
                        : null,
                    autocorrect: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Parolanı Tekrar Gir',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment(1, 0),
                    child: Text(
                      'Parolamı Unuttun?',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25)),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic res = await _auth.registerWithEmail(
                              email, _passKey.currentState.value);
                          if (res == null) {
                            setState(() =>
                                error = "Email Zaten Mevcut!");
                          }
                        }
                      },
                      color: Theme.of(context).accentColor,
                      elevation: 5,
                      child: Center(
                        child: Text(
                          'KAYIT OL',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'Montserrat'),
                        children: <TextSpan>[
                          TextSpan(text: 'Hesabın Var Mı? '),
                          TextSpan(
                            text: 'Giriş Yap!',
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () => widget.toggleRegister(),
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 10),
                        children: <TextSpan>[
                          TextSpan(text: "Kayıt olarak , şartları kabul etmiş olursunuz."),
                          TextSpan(
                              text: "Koşullar ve Durumlar ",
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  decoration: TextDecoration.underline)),
                          TextSpan(
                              text:
                                  "ve Negotium'un veri kullanım politikasına onay verirsiniz.")
                        ],
                      ),
                    ),
                    onTap: () {
                      Yonlendirici.sailor.navigate("/terms");
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
