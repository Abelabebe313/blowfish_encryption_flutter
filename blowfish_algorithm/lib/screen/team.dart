import 'package:blowfish_algorithm/utils/colors.dart';
import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Team Members',
            style: TextStyle(
                color: yellow, fontFamily: 'Poppins-Bold', fontSize: 18),
          ),
        ),
        body:  Column(
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Blowfish Algorithm\n'
                  '1. Abdulsemed Abdelila ETS0014-12  \n'
                  '2. Abdulsemed Muhaba ETS0015-12 \n'
                  '3. Abel Abebe ETS0019-12 \n'
                  '4. Abel Getahun ETS0034-12 \n'
                  '5. Abenezer Tewodros ETS0044-12\n'
                  '6. Abesolom Nekahiwot ETS0047-12\n',
                  style: TextStyle(
                    color: white,
                    fontSize: 18,
                    fontFamily: 'Poppins-Semibold',
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
