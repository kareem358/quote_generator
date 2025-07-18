import 'package:flutter/material.dart';
import '../models/quote_model.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;

  const QuoteCard({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '"${quote.text}"',
                style: const TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Text("- ${quote.author}"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
