import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/blocs/covid_data_bloc.dart';
import 'package:flutter_bloc_pattern/models/covid_model.dart';
import 'package:flutter_bloc_pattern/screens/cart_screen.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    covidDataBloc.fetchCoivdData();
  }

  @override
  void dispose() {
    covidDataBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Lastest Covid Data"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (cc) => CartScreen()));
              },
              child: Text("Cart"))
        ],
      ),
      body: Column(
        children: [],
      ),
      // body: StreamBuilder(
      //   stream: covidDataBloc.covidDataStream,
      //   builder: (context, AsyncSnapshot<List<CovidModel>> snapshot) {
      //     if (snapshot.hasData) {
      //       return ListView.builder(itemBuilder: (context, index) {
      //         return Card(
      //           color: Colors.white,
      //           child: ListTile(
      //             title: Text(snapshot.data[index].countryName,
      //                 style:
      //                     TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
      //             trailing: Text(
      //                 "+" + snapshot.data[index].totalConfirmedCases.toString(),
      //                 style: TextStyle(
      //                     fontWeight: FontWeight.bold,
      //                     color: Colors.red,
      //                     fontSize: 18)),
      //           ),
      //         );
      //       });
      //     } else if (snapshot.hasError) {
      //       return Text(snapshot.error);
      //     }
      //     return Center(child: CircularProgressIndicator());
      //   },
      // ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // AudioPlayer audioPlayer = AudioPlayer();
          AudioCache audioPlayer = AudioCache();
          await audioPlayer.play("audio/life.mp3", volume: 6);
        },
      ),
    );
  }
}
