import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime wt = WorldTime(
        url: 'Asia/Kathmandu', flag: 'nepal.png', location: 'Kathmandu, Nepal');
    await wt.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': wt.location,
      'flag': wt.flag,
      'time': wt.time,
      'isItDay': wt.isDayOrNot
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "L O A D I N G",
          style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 20.0,
        ),
        SpinKitThreeBounce(
          color: Colors.grey,
          size: 20.0,
        ),
      ],
    ));
  }
}
