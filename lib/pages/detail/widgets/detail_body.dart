import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/apps/utils/const.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/pages/home/widgets/home_temperature.dart';

class DetailBody extends StatelessWidget {
  final List<WeatherDetail> weatherDetails;
  const DetailBody({super.key, required this.weatherDetails});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemBuilder: (context, index) {
        DateTime dateTime = DateTime.parse(weatherDetails[index].dt_txt);
        String formatDay = DateFormat('EEEE').format(dateTime);
        String formatTime = DateFormat('HH:mm').format(dateTime);
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xffA3D7FC),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              // dung cho Expanded chiếm hết chiều rộng
              Expanded(
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 15,
                      children: [
                        HomeTemperature(
                          temperature: weatherDetails[index].main.temp,
                          fontSize: 25,
                        ),
                        Text(
                          weatherDetails[index].listWeather[0].main,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 23,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      formatDay,
                      style: TextStyle(
                        color: Color(0xff1CA0FF),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      formatTime,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 4,
                child: Image.asset(
                  AssesCustom.getLinkImage(
                    weatherDetails[index].listWeather[0].main,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, _) {
        return const SizedBox(height: 10);
      },
      itemCount: 20,
    );
  }
}
