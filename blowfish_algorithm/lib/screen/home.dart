import 'package:blowfish_algorithm/utils/colors.dart';
import 'package:blowfish_algorithm/widgets/decryption.dart';
import 'package:blowfish_algorithm/widgets/drawer.dart';
import 'package:blowfish_algorithm/widgets/encryption.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  final List<Widget> EventsWidgets = [
    const Encryption(),
    const Decryption(),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        foregroundColor: white,
        title: const Padding(
          padding: EdgeInsets.only(left: 50),
          child: Text(
            'Blowfish Algorithm',
            style: TextStyle(
                color: yellow, fontFamily: 'Poppins-Bold', fontSize: 18),
          ),
        ),
      ),
      drawer: Drawers(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 315,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: grey,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: activeIndex == 0 ? 145 : 132,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: activeIndex == 0 ? yellow : null,
                      ),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              activeIndex = 0;
                            });
                          },
                          child: Text(
                            'Encryption',
                            style: TextStyle(
                              color: activeIndex == 0 ? Colors.white : white,
                              fontFamily: 'Poppins-Medium',
                              fontSize: 14,
                            ),
                          )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: activeIndex == 1 ? 145 : 132,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: activeIndex == 1 ? yellow : null,
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            activeIndex = 1;
                          });
                        },
                        child: Text(
                          'Decryption',
                          style: TextStyle(
                            color: activeIndex == 1 ? Colors.white : white,
                            fontFamily: 'Poppins-Medium',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: EventsWidgets[activeIndex],
            ),
          ],
        ),
      ),
    );
  }
}
