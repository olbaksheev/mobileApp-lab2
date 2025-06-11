import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лабораторная работа №2',
      home: Scaffold(
        appBar: AppBar(title: Text('Бакшеев Олег Евгеньевич')),
        body: SingleChildScrollView(child: MyHomePage()),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("6. Wrap с изображениями из интернета:"),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(5, (i) {
              return Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.all(4),
                child: Image.network(
                  'https://picsum.photos/100?random=$i',
                  fit: BoxFit.cover,
                ),
              );
            }),
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget infoContainer(String text, Color color) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(8),
      color: color,
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }

  Widget colorBox(Color color) {
    return Container(width: 50, height: 50, color: color);
  }
}
