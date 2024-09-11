import 'package:flutter/material.dart';

import '../../../model/result.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.item});
  final Result item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.section,
                      style: const TextStyle(fontWeight: FontWeight.w300)),
                  Text(item.subsection,
                      style: const TextStyle(fontWeight: FontWeight.w300)),
                ],
              ),
              const Divider(),
              Text(item.title,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
