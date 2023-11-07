import 'package:flutter/material.dart';
import 'package:weather_app/getlocation.dart';
import 'package:weather_app/weather.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var client = WeatherData();
  var data;

  info() async {
    var position = await GetPosition();

    data = await client.getData(position.latitude, position.longitude);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: info(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.75,
                    width: size.width,
                    padding: const EdgeInsets.only(top: 30),
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(40),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff955cd1),
                          Color(0xff955cd1),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0.2, 0.85],
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          data!.cityName,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 35,
                            fontFamily: 'Maven',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Monday, 06  Nov',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 15,
                            fontFamily: 'Maven',
                          ),
                        ),
                        Image.network(
                          'https:${data!.Icons}',
                          width: size.width * 0.60,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          data!.condition,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 45,
                            fontFamily: 'Huballi',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          ' ${data!.temp.toString()}°',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 75,
                            fontFamily: 'Huballi',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/sand.png',
                                    width: size.width * 0.13,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${data!.wind}',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'Huballi',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Wind',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Huballi',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/humidity.png',
                                    width: size.width * 0.13,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    data!.humidity.toString(),
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'Huballi',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Humidity',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Huballi',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/wind.png',
                                    width: size.width * 0.13,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    data!.wind_dir.toString(),
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'Huballi',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Wind Direction',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Huballi',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Gust',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontFamily: 'Maven',
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              data!.gust.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Maven',
                                fontSize: 22,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Pressure',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontFamily: 'Maven',
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              data!.pressure.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Maven',
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'UV',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontFamily: 'Maven',
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              data!.uv.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Maven',
                                fontSize: 22,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Precipitation',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontFamily: 'Maven',
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              data!.precipitation.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Maven',
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Wind',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontFamily: 'Maven',
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              data!.wind.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Maven',
                                fontSize: 22,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Last Update',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontFamily: 'Maven',
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              data!.last_update.toString(),
                              style: const TextStyle(
                                color: Colors.red,
                                fontFamily: 'Maven',
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
