import 'dart:math';
import 'package:flutter/material.dart';
import '../models/quote_model.dart';
import '../utils/quote_data.dart';
import '../widgets/quote_card.dart';



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
      appBar: AppBar(title: const Text("Random Quote Generator")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuoteCard(quote: currentQuote),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: getRandomQuote,
              child: const Text("New Quote"),
            ),
          ],
        ),
      ),
    );
  }
}
