import 'package:flutter/material.dart';
import 'quotes.dart';
import 'quote_card.dart';

void main() => runApp(const MaterialApp(
      home: QuoteList(),
    ));

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(text: "He is always quoting the Quran", author: 'Khizer Rehman'),
    Quote(
        text: 'One in hand is better than two in bushes',
        author: 'Khizer Rehman'),
    Quote(
        text: 'Failure is nothong,but low aim is a crime', author: 'Mr. Jinnah')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes
            .map((quote) => QuoteCard(
                  quotes: quote,
                  delete: () {
                    setState(() {
                      print("Okay");
                      quotes.remove(quote);
                    });
                  },
                ))
            .toList(),
      ),
    );
  }
}
