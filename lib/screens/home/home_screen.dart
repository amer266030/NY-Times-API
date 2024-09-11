import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes/screens/home/home_cubit.dart';
import 'package:nytimes/screens/home/subViews/endpoint_tab_view.dart';
import 'package:nytimes/screens/home/subViews/home_card_view.dart';
import 'package:nytimes/screens/home/subViews/time_period_tab_view.dart';

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
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const _HeaderView(),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return (state is HomeLoadState)
                          ? const CircularProgressIndicator()
                          : const Expanded(child: _CardListView());
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _HeaderView extends StatelessWidget {
  const _HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(children: [
          Text('News Items:',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline))
        ]),
        EndpointTabView(),
        TimePeriodTabView(),
        Divider(color: Colors.blue, height: 3),
      ],
    );
  }
}

class _CardListView extends StatelessWidget {
  const _CardListView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return ListView(
      children:
          cubit.newsData!.results.map((item) => NewsCard(item: item)).toList(),
    );
  }
}
