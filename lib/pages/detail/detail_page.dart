import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/pages/detail/widgets/detail_body.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff1D6CF3), Color(0xff19D2FE)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(CupertinoIcons.location, size: 30),
              SizedBox(width: 15),
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TypewriterAnimatedText(
                    "Ho Chi Minh City",
                    speed: Duration(milliseconds: 100),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(CupertinoIcons.search),
              onPressed: () {},
            ),
            SizedBox(width: 10),
          ],
        ),
        body: DetailBody(),
      ),
    );
  }
}
