import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';
import 'package:zamanisinde/screen/isVeren_screens/ana_ekran.dart';
import 'package:zamanisinde/screen/isVeren_screens/ilan_ekle.dart';
import 'package:zamanisinde/widgets/ilan_detay.dart';
import 'package:zamanisinde/widgets/insh.dart';
import 'package:zamanisinde/widgets/sartKosul.dart';

class Yonlendirici {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoutes([
      SailorRoute(
        name: '/employer',
        builder: (context, args, params) {
          return EmployerHome();
        },
      ),
      SailorRoute(
        name: '/employer/add',
        builder: (context, args, params) {
          return AddListingsScreen();
        },
      ),
      SailorRoute(
        name: '/employer/edit',
        builder: (context, args, params) {
          return EmployerHome();
        },
      ),
      SailorRoute(
        name: '/employer/listing_detail',
        builder: (context, args, params) {
          return ListingDetail(
            name: params.param("name"),
            categories: params.param("categories"),
            applicants: params.param("applicants"),
            salary: params.param("salary"),
            reference: params.param("reference"),
            postDate: params.param("postDate"),
          );
        },
        params: [
          SailorParam(name: 'name', isRequired: true),
          SailorParam(name: 'categories', isRequired: true),
          SailorParam(name: 'applicants', isRequired: true),
          SailorParam(name: 'salary', isRequired: true),
          SailorParam(name: 'reference', isRequired: true),
          SailorParam(name: 'postDate', isRequired: true)
        ],
      ),
      SailorRoute(
        name: '/construction',
        builder: (context, args, params) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.white,
            ),
            body: Construction(),
          );
        },
      ),
      SailorRoute(
        name: '/terms',
        builder: (context, args, params) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.white,
            ),
            body: Terms(),
          );
        },
      ),
    ]);
  }
}
