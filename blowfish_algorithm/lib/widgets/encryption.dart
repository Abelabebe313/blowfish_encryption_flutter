import 'package:blowfish_algorithm/service/encryption_service.dart';
import 'package:blowfish_algorithm/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Encryption extends StatefulWidget {
  const Encryption({super.key});

  @override
  State<Encryption> createState() => _EncryptionState();
}

class _EncryptionState extends State<Encryption> {
  TextEditingController _textToEncrypt = TextEditingController();
  TextEditingController _keyController = TextEditingController();
  String key = "aabb09182736ccdd";
  String? PrintedCypherText = "";

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
    _keyController.text = 'aabb09182736ccdd';
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
                controller: _keyController,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins-Medium',
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter your text to encrypt',
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

          /// ==========Plain Text ========== ///
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Plain Text:',
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
                  controller: _textToEncrypt,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins-Medium',
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter your text to encrypt',
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
                    String plainText = _textToEncrypt.text.codeUnits
                        .map((unit) => unit.toRadixString(16))
                        .join();

                    // encrypt the text
                    BlowfishEncryption blowfishEncryption =
                        BlowfishEncryption(key: key);

                    // get the cipher text
                    String cipherText = blowfishEncryption.encrypt(plainText);

                    setState(() {
                      PrintedSubkeys = blowfishEncryption.keyGenerate(key);
                      PrintedCypherText = cipherText;
                      for (int i = 0; i < 16; i++) {
                        plainText = blowfishEncryption.round(i, plainText);
                        Printedrounds?.add(plainText);
                      }
                    });
                  },
                  child: const Text(
                    'Encrypt',
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
                    '$PrintedCypherText',
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
                  copyToClipboard(PrintedCypherText!);
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
