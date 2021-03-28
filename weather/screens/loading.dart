import 'package:flutter/material.dart';
import 'package:flutter_application_3/data/my_location.dart';
import 'package:flutter_application_3/data/network.dart';
import 'package:flutter_application_3/screens/weather.dart';

const apikey = '2556da65cf9c3eb123cbff680178bc7c';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double latitude3;
  double longitude3;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric');

    var weatherData = await network.getJsonData();
    print(weatherData);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
        parseWeatherData: weatherData,
      );
    }));
  }

  // void fetchDate() async {

  //     var myJson = parsingData['weather'][0]['description']; //전환
  //     var myJson2 = parsingData['wind']['speed'];
  //     var myJson3 = parsingData['id'];
  //     print(myJson);
  //     print(myJson2);
  //     print(myJson3);
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: null,
          child: Text(
            "Get my location",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
        ),
      ),
    );
  }

  get(String s) {}
}
