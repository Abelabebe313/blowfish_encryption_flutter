import 'package:blowfish_algorithm/screen/home.dart';
import 'package:blowfish_algorithm/utils/colors.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    checkFirstVisit();
  }

  Future<void> checkFirstVisit() async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(158, 54, 53, 53),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            margin: const EdgeInsets.only(bottom: 50),
            
            child: const Center(
              child: Text(
                'BlowFish Algorithm',
                style: TextStyle(
                  color: yellow,
                  fontSize: 28,
                  fontFamily: 'Poppins-Bold',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
