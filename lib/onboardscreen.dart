import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'main.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: "First Title",
            body: "This is First Title",
            image: Image.network(
              "https://e7.pngegg.com/pngimages/735/657/png-clipart-onboarding-user-experience-workflow-management-computer-service-office.png",
              width: 350,
            )),
        PageViewModel(
            title: "Second Title",
            body: "This is Second Title",
            image: Image.network(
              "https://w7.pngwing.com/pngs/771/31/png-transparent-employee-engagement-employee-retention-human-resource-onboarding-employee-engagement-text-logo-sign-thumbnail.png",
              width: 350,
            )),
        PageViewModel(
            title: "Third Title",
            body: "This is Third Title",
            image: Image.network(
              "https://e7.pngegg.com/pngimages/735/657/png-clipart-onboarding-user-experience-workflow-management-computer-service-office.png",
              width: 350,
            ))
      ],
      onDone: () {
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => MyApp()));
      },
      done: Text("Done"),
      skip: Text("Skip"),
      showSkipButton: false,
      next: Text("Next"),
      showNextButton: true,
      dotsDecorator: const DotsDecorator(
          color: Colors.blue,
          activeColor: Colors.black,
          activeSize: Size(20, 10),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          size: Size(10, 10)),
    );
  }
}
