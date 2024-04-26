import 'package:energise/src/features/contact/widgets/screen.dart';
import 'package:energise/src/features/maps/widgets/screen.dart';
import 'package:energise/src/features/timer/widgets/screen.dart';
import 'package:flutter/material.dart';

import '../../../core/util/dependecies.dart';

class App extends StatelessWidget {
  final InitializationResult result;
  const App({
    required this.result,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.directions_car),
                ),
                Tab(
                  icon: Icon(Icons.directions_transit),
                ),
                Tab(
                  icon: Icon(Icons.directions_bike),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              TimerScreen(),
              MapScreen(),
              ContactScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
