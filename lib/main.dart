import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipable_button_example/dashboard.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Swipeable button example"),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            "asset/home_image.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              child: SwipeableButtonView(
                  buttonText: "SLIDE TO UNLOCK",
                  buttonWidget: Container(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    ),
                  ),
                  activeColor: Color(0xff3398F6),
                  isFinished: isFinished,
                  onWaitingProcess: () {
                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        isFinished = true;
                      });
                    });
                  },
                  onFinish: () async {
                    await Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const DashboardScreen()));

                    setState(() {
                      isFinished = false;
                    });
                  }))
        ],
      ),
    );
  }
}
