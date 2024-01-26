import 'package:algorithms_site/core/components/icon_component.dart';
import 'package:algorithms_site/core/managers/color_manager.dart';
import 'package:algorithms_site/core/utils/constances.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'core/managers/themes.dart';
import 'core/services/bloc_observer.dart';
import 'core/services/services_locator.dart';

void main() {
  ServiceLocator().init();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: MainScreen()
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({Key? key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index =0 ;

  bool showGraphTileAlgorithms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const IconComponent(
                iconData: Icons.dehaze_rounded,
                color: ColorManager.primaryItemColor,
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Handle actions
            },
            icon: const IconComponent(
              iconData: Icons.dark_mode_outlined,
              color: ColorManager.primaryItemColor,
            ),
          ),
        ],
      ),
      body: Constances.screens[index],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: ColorManager.primaryItemColor,
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/algorhtims.png',
                    width: 100,
                    height: 100,
                  ),
                  GradientText(
                    "Visualize Your Algorithms",
                    colors: [Colors.purple, Colors.green, Colors.yellow],
                    style: TextStyle(

                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GradientText(
                      'Graph Algorithms',
                      style: const TextStyle(fontWeight: FontWeight.bold), colors: [Colors.deepPurple , Colors.yellowAccent],
                    ),
                    Icon(showGraphTileAlgorithms == false
                        ? Icons.arrow_drop_down_circle_outlined
                        : Icons.arrow_drop_down_circle),
                  ],
                ),
                onTap: () {
                  showGraphTileAlgorithms = !showGraphTileAlgorithms;
                  setState(() {});
                },
                subtitle: showGraphTileAlgorithms == true
                    ? Column(
                        children: [
                          ListTile(
                            title: GradientText('Graph Nodes' , colors: [Colors.black87 , Colors.greenAccent],),
                            onTap: () {
                              Navigator.pop(context);

                              index = 0;
                              setState(() {});
                            },
                          ),
                          ListTile(
                            title: GradientText('Grid Graph',colors: [Colors.black87 , Colors.greenAccent]),
                            onTap: () {
                              Navigator.pop(context);

                              index = 1;
                              setState(() {});
                            },
                          ),
                        ],
                      )
                    : SizedBox()),

            // Add more items as needed
          ],
        ),
      ),
    );
  }
}
