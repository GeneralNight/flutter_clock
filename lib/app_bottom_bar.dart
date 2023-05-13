import 'package:flutter/material.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({super.key});

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  List<RouteItem> pages = [
    RouteItem(name: "Alarm", path: "/alarm"),
    RouteItem(name: "Stopwatch", path: "/stopwatch"),
    RouteItem(name: "Timer", path: "/timer"),
  ];
  int actualPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: 50,
          child: Center(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: pages.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(0),
              itemBuilder: (context,index) {
                String pageName = pages[index].name;
                return TextButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, pages[index].path);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: ModalRoute.of(context)!.settings.name == pages[index].path
                        ? const Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Colors.black87
                          )
                        )
                        : null
                    ), 
                    child: Text(
                      pageName,
                      style: TextStyle(
                        color: ModalRoute.of(context)!.settings.name != pages[index].path ? Colors.grey: Colors.black87,
                      ),
                    ),
                  )
                );
              },
            ),
          ),
          
        )
      );
  }
}

class RouteItem{
  String name;
  String path;
  
  RouteItem({required this.name, required this.path});
}