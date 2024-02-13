import 'dart:developer';
import 'dart:io';
import 'package:blowfish_algorithm/screen/blowfish.dart';
import 'package:blowfish_algorithm/screen/team.dart';
import 'package:blowfish_algorithm/utils/colors.dart';
import 'package:flutter/material.dart';

class Drawers extends StatefulWidget {
  // const EndDrawers({super.key});

  @override
  State<Drawers> createState() => _EndDrawersState();
}

class _EndDrawersState extends State<Drawers> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            padding: EdgeInsets.only(top: 60, left: 10),
            decoration: BoxDecoration(
              color: black,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/image/splash.png'),
                  backgroundColor: yellow, // Set the background color to yellow
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: yellow,
                      child: CircleAvatar(
                        radius: 26,
                        backgroundImage: AssetImage('assets/image/splash.png'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Computer Security ',
                  style: TextStyle(
                    color: yellow,
                    fontSize: 18,
                    fontFamily: 'Poppins-Regular',
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.info_outline,
              color: yellow,
            ),
            title: const Text(
              'What is Blowfish Algorithm?',
              style: TextStyle(
                fontFamily: 'Urbanist-Bold',
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  BlowFishPage()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.group,
              color: yellow,
            ),
            title: const Text(
              'Team Members',
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
                fontSize: 16,
              ),
            ),
            onTap: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  TeamPage()));
            },
          ),
          
        ],
      ),
    );
  }
}
