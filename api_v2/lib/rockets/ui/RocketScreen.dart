
import 'package:api_v2/repositories/APIRequests.dart';
import 'package:api_v2/rockets/model/ModelRockets.dart';
import 'package:flutter/material.dart';

class RocketScreen extends StatefulWidget {
  const RocketScreen({Key key}) : super(key: key);

  @override
  _RocketScreenState createState() => _RocketScreenState();
}

class _RocketScreenState extends State<RocketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder<List<ModelRockets>>(
          future: APIRequests().rocketAPI(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                      crossAxisSpacing: 2
                ),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  ModelRockets rockets = snapshot.data[index];
                  return ListTile(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Show Item ......"),duration: Duration(seconds: 8),));
                    },
                    title: Text(rockets.name),
                    subtitle: Text(rockets.description.substring(0, 50)),
                    leading: CircleAvatar(
                      backgroundColor:
                          rockets.active ? Colors.blue : Colors.red,
                      child: Text(rockets.name.substring(0,1)),
                    ),
                    trailing: Text(rockets.type),
                  );
                },
              );
            } else {
              return Text("No Item Found");
            }
          },
        ),
      ),
    );
  }
}
