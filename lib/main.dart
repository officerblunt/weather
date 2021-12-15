import 'package:flutter/material.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/services/weather_api.dart';
import 'package:weather/views/additional_information.dart';
import 'package:weather/views/currentWeather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePage_State createState() => HomePage_State();
}

class HomePage_State extends State<HomePage> {
  WeatherApi client = WeatherApi();
  Weather? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather("Санкт-Петербург");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text("weatherApp By maga"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  currentWeather(
                      Icons.wb_cloudy, "${data!.temp} °C", "${data!.cityName}"),
                  SizedBox(height: 20.0),
                  Divider(),
                  SizedBox(height: 20.0),
                  additionalInformation(
                      "${data!.wind} м/c",
                      "${data!.humidity} %",
                      "${data!.pressure} гПа",
                      "${data!.feels_like} °C"),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
