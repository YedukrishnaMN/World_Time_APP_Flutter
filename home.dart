import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

    String img=data['day'] ? 'day.jpg':'night.jpg';
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$img'),
              fit: BoxFit.cover,)
        ),
        child: Column(
          children: <Widget>[
            TextButton.icon(
               onPressed:() async{
                 dynamic result=await Navigator.pushNamed(context, '/location');
                 data={
                   'time':result['time'],
                   'location':result['location'],
                   'day':result['day'],
                   'flag':result['flag']
                 };
               },
               icon: Icon(Icons.edit_location,
               size: 10.0,
               color: Colors.amber,),
               label: Text("CHANGE LOCATION",
               style: TextStyle(
                 color: Colors.amber,
                 fontSize: 10.0,
               ),
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    data['location'],
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 70.0
                ),),
              ],
            ),
            Text(data['time'],
            style: TextStyle(
              fontSize: 50.0,
              color: Colors.white,

            ),)
          ],
        ),
      ))

    );
  }
}
