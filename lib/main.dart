import 'package:algorithms_site/core/components/icon_component.dart';
import 'package:algorithms_site/core/managers/color_manager.dart';
import 'package:algorithms_site/core/utils/constances.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/graph_module/presentation_layer/screens/graph_grid_screen.dart';
import 'app/graph_module/presentation_layer/screens/graph_nodes_screen.dart';
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
      home:  MainScreen(),
    );
  }
}
class MainScreen extends StatefulWidget {
   MainScreen({Key? key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0 ;
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
          children:  <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: ColorManager.primaryItemColor,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Graph Algorithms',style: TextStyle(fontWeight: FontWeight.bold),),
                  Icon( showGraphTileAlgorithms == false ? Icons.arrow_drop_down_circle_outlined : Icons.arrow_drop_down_circle),
                ],
              ),
              onTap: () {
               showGraphTileAlgorithms=!showGraphTileAlgorithms;
               setState(() {

               });
              },
              subtitle: showGraphTileAlgorithms == true ? Column(children: [
                ListTile(
                  title: Text('Graph Nodes' ),
                  onTap: () {
                    Navigator.pop(context);

                    index = 0 ;
                    setState(() {

                    });
                  },
                ),
                ListTile(
                  title: Text('Grid Graph'),
                  onTap: () {
                    Navigator.pop(context);

                    index = 1 ;
                    setState(() {

                    });

                  },
                ),
              ],) : SizedBox()
            ),


            // Add more items as needed
          ],
        ),
      ),
    );
  }
}
