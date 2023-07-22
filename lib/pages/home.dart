import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  Color? bgColor = Colors.white;
  Color? fgColor = Colors.grey[900];
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    Color? bgColor = data['isItDay'] ? Colors.grey[100] : Colors.black;
    Color? fgColor = data['isItDay'] ? Colors.grey[900] : Colors.grey[300];
    return SafeArea(
      child: Container(
        color: bgColor,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: DefaultTextStyle(
            style: TextStyle(
              color: fgColor,
              decoration: TextDecoration.none,
              fontFamily: "Quicksand",
              fontWeight: FontWeight.w100,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 20.0,
                      // color: Colors.grey,
                    ),
                  ),
                ),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 60.0),
                ),
                TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, "/location");
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isItDay': result['isItDay'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text("   Change Location"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
