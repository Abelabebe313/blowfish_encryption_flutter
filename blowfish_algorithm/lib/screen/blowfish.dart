import 'package:blowfish_algorithm/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BlowFishPage extends StatefulWidget {
  @override
  _BlowFishPageState createState() => _BlowFishPageState();
}

class _BlowFishPageState extends State<BlowFishPage> {
  final String geeksforgeeksUrl =
      'https://www.geeksforgeeks.org/blowfish-algorithm-with-examples/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Blowfish Algorithm',
            style: TextStyle(
                color: yellow, fontFamily: 'Poppins-Bold', fontSize: 18),
          ),
        ),
        body:  Column(
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  'Blowfish is an encryption technique designed by Bruce Schneier in 1993 as an alternative to DES Encryption Technique. It is significantly faster than DES and provides a good encryption rate with no effective cryptanalysis technique found to date. It is one of the first, secure block cyphers not subject to any patents and hence freely available for anyone to use. It is symmetric block cipher algorithm.\n'
                  '1. blockSize: 64-bits\n'
                  '2. keySize: 32-bits to 448-bits variable size\n'
                  '3. number of subkeys: 18 [P-array]\n'
                  '4. number of rounds: 16\n'
                  '5. number of substitution boxes: 4 [each having 512 entries of 32-bits each]\n',
                  style: TextStyle(
                    color: white,
                    fontSize: 16,
                    fontFamily: 'Poppins-Regular',
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
