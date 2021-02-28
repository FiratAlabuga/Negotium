import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:zamanisinde/model/kullanici.dart';
import 'package:zamanisinde/routes.dart';
import 'package:zamanisinde/screen/slider_screen.dart';
import 'package:zamanisinde/screen/wrapper.dart';
import 'package:zamanisinde/services/auth.dart';
import 'routes.dart';

void main() {
  Yonlendirici.createRoutes();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('tr');
    return StreamProvider<Kullanici>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Montserrat',
          accentColor: Color(0xFF45CFCF),
          primaryColor: Color(0xFF45CFCF),
          buttonTheme: ButtonTheme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).accentColor,
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Color(0xFF05A8AA),
              ),
            ),
          ),
        ),
        title: 'Negotium',
        home: SliderScreen(),
        onGenerateRoute: Yonlendirici.sailor.generator(),
        navigatorKey: Yonlendirici.sailor.navigatorKey,
      ),
    );
  }
}
