import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
            child: Image.asset(
          'assets/welcome.jpg',
          fit: BoxFit.fitHeight,
        )),
        SafeArea(
            child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 250),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/logo.png',
                    height: 70,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Text('Hola, \nBienvenido',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Que te parece si agregamos, \n una nueva Ciudad',
                      textAlign: TextAlign.start)
                ]),
          ),
        ))
      ],
    ));
  }
}
