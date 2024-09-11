import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes/screens/home/home_cubit.dart';

import '../../../networking/network_mgr.dart';

class TimePeriodTabView extends StatelessWidget {
  const TimePeriodTabView({super.key});

  void _onTap(BuildContext context, int idx) {
    var cubit = context.read<HomeCubit>();
    cubit.timePeriod = TimePeriod.values[idx];
    cubit.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DefaultTabController(
          length: TimePeriod.values.length,
          child: Row(
            children: [
              const Text(
                'Time Period:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: TabBar(
                    onTap: (idx) => _onTap(context, idx),
                    tabs: TimePeriod.values
                        .map((period) => Text(period.name))
                        .toList()),
              ),
            ],
          )),
    );
  }
}
