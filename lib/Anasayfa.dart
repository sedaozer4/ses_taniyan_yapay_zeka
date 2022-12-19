import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stts;

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var _speechToText = stts.SpeechToText();
  bool dinliyorMu = false;
  String? x;
  String text = 'Konuşmak için düğmeye basın!';

  void listen() async {
    if (!dinliyorMu) {
      bool available = await _speechToText.initialize(
          onStatus: (status) => print('$status'),
          onError: (errorNotification) => print('$errorNotification'));
      if (available) {
        setState(() {
          dinliyorMu = true;
        });
        //Sesi texte dönüştürdük ve aldık.
        _speechToText.listen(
          onResult: (result) => setState(() {
            text = result.recognizedWords;
          }),
        );
      }
    } else {
      setState(() {
        dinliyorMu = false;
      });
      _speechToText.stop();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speechToText = stts.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Konuşmayı Sese Dönüştür',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: dinliyorMu,
        repeat: true,
        endRadius: 80,
        glowColor: Colors.red,
        duration: Duration(milliseconds: 1000),
        child: FloatingActionButton(
          onPressed: () {
            listen();
          },
          child: Icon(dinliyorMu ? Icons.mic : Icons.mic_off),
        ),
      ),
    );
  }
}
