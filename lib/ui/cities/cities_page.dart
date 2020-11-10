import 'package:flutter/material.dart';
import 'package:weatherflutter/ui/common/header_widget.dart';

import '../ui_constants.dart';
import 'add/add_city_pages.dart';

class CitiesPage extends StatelessWidget {
  void handleNavigatePress(BuildContext context) {
    Navigator.of(context).push(
        //MaterialPageRoute(builder: (_) => AddCityPage()),
        PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 400),
            pageBuilder: (_, animation1, animation2) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0.0, 1.0),
                  end: Offset(0.0, 0.0),
                ).animate(animation1),
                child: AddCityPage(),
              );
            }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
        onPressed: () => handleNavigatePress(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            HeaderWidget(title: 'Mis Ciudades'),
            Expanded(
              child: Center(
                child: Text('No tienes ciudades :('),
              ),
            )
          ],
        ),
      ),
    );
  }
}
