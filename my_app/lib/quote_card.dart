// import 'dart:ui';

import 'package:flutter/material.dart';
import 'quotes.dart';
import 'quote_card.dart';

class QuoteCard extends StatelessWidget {
  final Quote quotes;
  final Function delete;
  const QuoteCard({super.key, required this.quotes, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quotes.text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              quotes.author,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextButton.icon(
              onPressed: () {
                delete();
              },
              label: const Text(
                'Delete Quote',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
