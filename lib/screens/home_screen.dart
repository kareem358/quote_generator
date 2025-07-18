import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/quote_model.dart';
import '../utils/quote_data.dart';
import '../widgets/quote_card.dart';
import 'package:share_plus/share_plus.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Quote currentQuote;

  @override
  void initState() {
    super.initState();
    currentQuote = quotes[0];
  }

  void getRandomQuote() {
    final random = Random();
    setState(() {
      currentQuote = quotes[random.nextInt(quotes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
       // title: const Text("Random Quote Generator"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 6,

        title: Text(
          "Quote Generator",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
     // extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
          ),
        ),

        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                        child: QuoteCard(
                            key: ValueKey(currentQuote.text),
                            quote: currentQuote)),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: getRandomQuote,
                  icon: const Icon(
                    Icons.refresh,
                    size: 24,
                  ),
                  label: const Text(
                    "New Quote",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,              // button fill color
                    foregroundColor: Colors.deepPurple,         // icon + text color
                    elevation: 8,                               // raised feel
                    shadowColor: Colors.deepPurpleAccent,       // glowing shadow
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),  // pill shape
                    ),
                  ),
                ),


                /* ElevatedButton(
                  onPressed: getRandomQuote,
                  child: const Text("New Quote"),
                ),*/
                const SizedBox(height: 20,),
              
                ElevatedButton.icon(
                  onPressed: () {
                    final textToShare =
                        '"${currentQuote.text}"\n\n— ${currentQuote.author}';
                    Share.share(textToShare);
                  },
                  icon: const Icon(
                    Icons.share,
                    size: 24,
                  ),
                  label: const Text(
                    "Share",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.deepPurple,
                    elevation: 8,
                    shadowColor: Colors.deepPurpleAccent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
