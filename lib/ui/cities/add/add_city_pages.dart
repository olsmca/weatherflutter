import 'package:flutter/material.dart';
import 'package:weatherflutter/ui/common/header_widget.dart';

import '../../ui_constants.dart';

class AddCityPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[HeaderWidget(title: 'Agregar Ciudad')],
        ),
      ),
    );
  }
}
