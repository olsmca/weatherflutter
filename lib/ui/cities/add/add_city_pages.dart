import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weatherflutter/data/data_constants.dart';
import 'package:weatherflutter/model/city.dart';
import 'package:weatherflutter/ui/common/debouncer.dart';
import 'package:weatherflutter/ui/common/header_widget.dart';
import 'package:http/http.dart' as http;
import 'package:weatherflutter/ui/common/loader_widget.dart';
import 'package:weatherflutter/ui/ui_constants.dart';

class AddCityPage extends StatefulWidget {
  @override
  _AddCityPageState createState() => _AddCityPageState();
}

class _AddCityPageState extends State<AddCityPage> {
  final debouncer = Debouncer();
  List<City> cities = [];
  bool loading = false;

  void onChangedText(String text) {
    debouncer.run(() {
      if (text.isNotEmpty) requestSearch(text);
    });
  }

  void requestSearch(String text) async {
    setState(() {
      loading = true;
    });

    final url = "${api}search/?query=$text";
    final response = await http.get(url);
    final data = jsonDecode(response.body) as List;

    print(data);
    setState(() {
      loading = false;
      cities = data.map((e) => City.fromJson(e)).toList();
    });
    print(cities);
  }

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
          children: <Widget>[
            HeaderWidget(title: 'Agregar Ciudad'),
            ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: TextField(
                    onChanged: onChangedText,
                    decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        filled: true,
                        hintText: 'Buscar Ciudad',
                        fillColor: Colors.grey[200],
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        )))),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cities.length,
                itemBuilder: (context, index) {
                  final city = cities[index];
                  return ListTile(
                    title: Text(
                      city.title,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: primaryColor,
                      ),
                      onPressed: () {},
                    ),
                  );
                },
              ),
            ),
            if (loading)
              Center(
                //child: CircularProgressIndicator(),
                child: LoaderWidget(),
              )
          ],
        ),
      ),
    );
  }
}
