import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote_gennerator/widgets/primary_button.dart';
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
       // backgroundColor: Colors.indigo,
        elevation: 6,

        title: Text(
          "Quote Generator",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.wb_sunny // show sun icon in dark mode
                  : Icons.nightlight_round, // show moon icon in light mode
            ),
            onPressed: () {
              // You need state management (like Provider, GetX) to switch themes manually.
            },
          )
        ],
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
                PrimaryButton(label: 'New Quote', icon: Icons.refresh, onPressed: getRandomQuote),
                const SizedBox(height: 20,),
                PrimaryButton(label: 'Share', icon: Icons.share,
                    onPressed: () {final textToShare =
                        '"${currentQuote.text}"\n\n— ${currentQuote.author}';
                    Share.share(textToShare);
                    },),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
