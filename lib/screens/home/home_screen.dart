import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes/screens/home/home_cubit.dart';

import '../../model/result.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Builder(builder: (context) {
        final cubit = context.read<HomeCubit>();
        cubit.loadData();
        return Scaffold(
          body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return cubit.newsData == null
                  ? const CircularProgressIndicator()
                  : ListView(
                      children: cubit.newsData!.results
                          .map((item) => NewsCard(item: item))
                          .toList(),
                    );
            },
          ),
        );
      }),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.item});
  final Result item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.section,
                    style: TextStyle(fontWeight: FontWeight.w300)),
                Text(item.subsection,
                    style: TextStyle(fontWeight: FontWeight.w300)),
              ],
            ),
            const Divider(),
            Text(item.title,
                style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
