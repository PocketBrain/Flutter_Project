import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Weather',
              style: TextStyle(color: Colors.black87),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
            iconTheme: const IconThemeData(color: Colors.black54),
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            actions: <Widget>[
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            ],
          ),
          body: _buildBody()),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _weatherDescript(),
                _temperature(),
                const Divider(),
                _temForecast(),
                const Divider(),
                _footRate(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Image _headerImage() {
  return const Image(
    image: NetworkImage(
        'https://phonoteka.org/uploads/posts/2021-07/1625190033_49-phonoteka-org-p-zastavka-prognoz-pogodi-krasivie-zastavki-51.jpg'),
    fit: BoxFit.cover,
  );
}

Column _weatherDescript() {
  return Column(
    children: const <Widget>[
      Text(
        'Tuesday - March 8',
        style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
      ),
      Divider(),
    ],
  );
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
            size: 50,
          ),
        ],
      ),
      const SizedBox(width: 16.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: const <Widget>[
              Text(
                '15°C  Clear',
                style: TextStyle(color: Colors.deepPurple, fontSize: 20),
              ),
            ],
          ),
          Row(
            children: const <Widget>[
              Text(
                'Saint Petersburg',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Wrap _temForecast() {
  return Wrap(
    spacing: 10.0,
    children: List.generate(7, (int index) {
      return Chip(
        label: Text(
          '${index + 20}°C',
          style: const TextStyle(fontSize: 15.0),
        ),
        avatar: Icon(
          Icons.wb_cloudy,
          color: Colors.blue.shade300,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: const BorderSide(color: Colors.grey),
        ),
        backgroundColor: Colors.grey.shade100,
      );
    }),
  );
}

Row _footRate() {
  var stars = Row(
    children: const <Widget>[
      Icon(Icons.brightness_1,
          size: 20, color: Color.fromARGB(255, 151, 149, 148)),
      Icon(Icons.brightness_2,
          size: 20, color: Color.fromARGB(255, 151, 149, 148)),
      Icon(Icons.brightness_3,
          size: 20, color: Color.fromARGB(255, 151, 149, 148)),
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      const Text(
        'Погода честно выдумана',
        style: TextStyle(fontSize: 15.0),
      ),
      stars,
    ],
  );
}
