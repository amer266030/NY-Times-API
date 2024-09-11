import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes/screens/home/home_cubit.dart';

import '../../../networking/network_mgr.dart';

class EndpointTabView extends StatelessWidget {
  const EndpointTabView({super.key});

  void _onTap(BuildContext context, int idx) {
    var cubit = context.read<HomeCubit>();
    cubit.endPoint = EndPoint.values[idx];
    cubit.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DefaultTabController(
          length: EndPoint.values.length,
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  'Articles:',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 3,
                child: TabBar(
                    onTap: (idx) => _onTap(context, idx),
                    tabs: EndPoint.values
                        .map((endPoint) => Text(endPoint.name))
                        .toList()),
              ),
            ],
          )),
    );
  }
}
