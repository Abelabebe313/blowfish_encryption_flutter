import 'package:blowfish_algorithm/service/decryption_service.dart';
import 'package:blowfish_algorithm/service/encryption_service.dart';
import 'package:blowfish_algorithm/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hex/hex.dart';


class Decryption extends StatefulWidget {
  const Decryption({super.key});

  @override
  State<Decryption> createState() => _DecryptionState();
}

class _DecryptionState extends State<Decryption> {
  TextEditingController _textToDecrypt = TextEditingController();
  TextEditingController _keyTextController = TextEditingController();
  String key = "aabb09182736ccdd";
  String? PrintedOriginalText = "";

  List<String>? PrintedSubkeys = [];
  List<String>? Printedrounds = [];

  //
  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Text copied to clipboard'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.grey,
        // textColor: Colors.white,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _keyTextController.text = 'aabb09182736ccdd';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Enter key:',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins-Light',
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            width: 20,
          ),
          Center(
            child: SizedBox(
              width: 365,
              height: 50,
              child: TextField(
                controller: _keyTextController,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins-Medium',
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter your cipher to decrypt',
                  hintStyle: const TextStyle(
                    color: white,
                    fontFamily: 'Poppins-Regular',
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: yellow,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: yellow,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: yellow,
                    ),
                  ),
                ),
              ),
            ),
          ),

          /// ==========cipher Text ========== ///
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'cipher Text:',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins-Light',
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: TextField(
                  controller: _textToDecrypt,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins-Medium',
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter your text to decrypt',
                    hintStyle: const TextStyle(
                      color: white,
                      fontFamily: 'Poppins-Regular',
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: yellow,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: yellow,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: yellow,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 100,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: yellow,
                ),
                child: TextButton(
                  onPressed: () {
                    // convert inputed text to hex
                    String cipherText = _textToDecrypt.text;

                    // decrypt the text
                    BlowfishDecryption blowfishDecryption =
                        BlowfishDecryption(key: key);

                    // get the plain text
                    String plainText = blowfishDecryption.decrypt(cipherText);

                    setState(() {
                      PrintedSubkeys = blowfishDecryption.keyGenerate(key);
                      
                      //===== Convert hex to bytes =====//
                      List<int> bytes = HEX.decode(plainText);
                      // Convert bytes to string
                      String originalText = String.fromCharCodes(bytes);

                      // print the original text
                      PrintedOriginalText = originalText;
                      for (int i = 0; i < 16; i++) {
                        cipherText = blowfishDecryption.round(i, cipherText);
                        Printedrounds?.add(cipherText);
                      }
                    });
                  },
                  child: const Text(
                    'Decrypt',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins-Medium',
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Original Plain Text:',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins-Light',
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 320,
                height: 44,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: yellow,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '$PrintedOriginalText',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins-Medium',
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  copyToClipboard(PrintedOriginalText!);
                },
                icon: const Icon(
                  Icons.copy,
                  color: yellow,
                  size: 36,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Subkeys:',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins-Light',
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: 380,
              height: 225,
              decoration: BoxDecoration(
                border: Border.all(
                  color: yellow,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: ListView.builder(
                  itemCount: PrintedSubkeys!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${PrintedSubkeys![index]}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins-Medium',
                          fontSize: 18,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // Rounds
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'rounds:',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins-Light',
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: 380,
              height: 225,
              decoration: BoxDecoration(
                border: Border.all(
                  color: yellow,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: ListView.builder(
                  itemCount: Printedrounds!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${Printedrounds![index]}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins-Medium',
                          fontSize: 18,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
