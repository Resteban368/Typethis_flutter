import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isVisible = false;
  String displayedText = ""; // El texto que se mostrará progresivamente
  int currentIndex = 0; // Índice actual del texto
  late Timer typeTimer; // Temporizador para simular la escritura

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    typeTimer.cancel(); // Cancela el temporizador cuando se destruye el widget
    super.dispose();
  }

  void startTypingAnimation() {
    typeTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (currentIndex < fullText.length) {
        setState(() {
          displayedText = fullText.substring(0, currentIndex + 1);
          currentIndex++;
        });
      } else {
        timer.cancel(); // Cancela el temporizador cuando se completa la escritura
      }
    });
  }

  String fullText = "Baneste Codes\n Flutter Developer"; // El texto completo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(
                //   height: 100,
                // ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isVisible = true;
                    });
                    startTypingAnimation(); // Inicia la animación de escritura
                  },
                  child: Image.asset(
                    'assets/banesteCodesIcon.jpg',
                    fit: BoxFit.cover,
                    height: 300,
                    width: 300,
                  ),
                ),
                Text(
                  displayedText,
                  style: GoogleFonts.robotoSlab(
                    fontSize: 35,
                    color: const Color.fromARGB(255, 0, 83, 105),
                    fontWeight: FontWeight.bold,
                    //sombras
                    shadows: [
                      const Shadow(
                        blurRadius: 10.0,
                        color: Color.fromARGB(255, 218, 217, 217),
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                // const SizedBox(
                //   height: 100,
                // ),
               
              ],
            ),
          ),
          Visibility(
            visible: isVisible,
            child: Positioned(
              top: 200,
              child: Lottie.asset('assets/animation.json',
                  height: 400, width: 400),
            ),
          ),
        ],
      ),
    );
  }
}
