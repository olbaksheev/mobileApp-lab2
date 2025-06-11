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
  final List<Color> rainbowColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("1. Wrap с цветными контейнерами:"),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(6, (i) {
              return Container(
                width: 60,
                height: 60,
                color: Colors.primaries[i],
                margin: EdgeInsets.all(4),
              );
            }),
          ),

          SizedBox(height: 20),

          Text("2. Column с информацией о себе:"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  "ФИО: Бакшеев Олег Евгеньевич",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  "Год рождения: 2000",
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  "Группа: ИВТз-21",
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          Text("3. Column с иконками в Row:"),
          Column(
            children: List.generate(3, (index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.star, color: Colors.orange),
                  Icon(Icons.favorite, color: Colors.red),
                  Icon(Icons.access_alarm, color: Colors.blue),
                ],
              );
            }),
          ),

          SizedBox(height: 20),

          Text("4. Stack с контейнерами цвета радуги:"),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: List.generate(7, (i) {
                return Container(
                  width: 200 - i * 20.0,
                  height: 200 - i * 20.0,
                  color: rainbowColors[i].withOpacity(0.8),
                );
              }),
            ),
          ),

          SizedBox(height: 20),

          Text("5. Wrap с текстом в контейнерах:"),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              infoContainer("ФИО: Бакшеев Олег", Colors.teal),
              infoContainer("Год: 2000", Colors.orange),
              infoContainer("Группа: ИВТз-21", Colors.green),
            ],
          ),

          SizedBox(height: 20),

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

          Text("7. Column с изображениями из ассетов:"),
          Column(
            children: List.generate(3, (i) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                height: 100,
                child: Image.asset('assets/image$i.jpg', fit: BoxFit.cover),
              );
            }),
          ),

          SizedBox(height: 20),

          Text("8. Stack с контейнерами по углам:"),
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.grey[300],
            child: Stack(
              children: [
                Positioned(top: 0, left: 0, child: colorBox(Colors.red)),
                Positioned(top: 0, right: 0, child: colorBox(Colors.green)),
                Positioned(bottom: 0, left: 0, child: colorBox(Colors.blue)),
                Positioned(bottom: 0, right: 0, child: colorBox(Colors.purple)),
              ],
            ),
          ),

          SizedBox(height: 20),

          Text("9. Wrap с иконками внутри контейнеров:"),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(6, (i) {
              return Container(
                width: 60,
                height: 60,
                margin: EdgeInsets.all(4),
                color: Colors.primaries[i],
                child: Icon(Icons.star, color: Colors.white),
              );
            }),
          ),

          SizedBox(height: 20),

          /// 10. Column с Row, содержащими контейнеры с изображениями из интернета
          Text("10. Column с картинками из интернета в Row:"),
          Column(
            children: List.generate(3, (i) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (j) {
                  return Container(
                    margin: EdgeInsets.all(4),
                    width: 80,
                    height: 80,
                    child: Image.network(
                      'https://picsum.photos/80?random=${i * 3 + j}',
                      fit: BoxFit.cover,
                    ),
                  );
                }),
              );
            }),
          ),
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
