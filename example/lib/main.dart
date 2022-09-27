import 'package:flutter/material.dart';
import 'package:widget_responsive/widget_responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScreenResponsive(
        sizes: ScreenSizes(
          xlarge: Size(720, 890),
          large: Size(680, 800),
          medium: Size(520, 720),
          small: Size(400, 600),
          xsmall: Size(320, 480),
        ),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ResponsivePositionned(
            top: RSize(
              xlarge: 35,
              large: 30,
              medium: 20,
              small: 15,
              xsmall: 8,
            ),
            left: RSize.zero(),
            right: RSize.zero(),
            child: Text('Welcome To'),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('email'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('password'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Responsive(
              child: Container(
            padding: EdgeInsets.only(
              bottom: custom(
                xlarge: 48,
                large: 32,
                medium: 24,
                small: 12,
                xsmall: 6,
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: const Text('terms&privacy'),
          )),
        ],
      ),
    );
  }
}
