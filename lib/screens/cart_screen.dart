import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/blocs/covid_data_bloc.dart';
import 'package:flutter_bloc_pattern/models/covid_model.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: covidDataBloc.covidDataStream,
        builder: (context, AsyncSnapshot<List<CovidModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                child: ListTile(
                  title: Text(snapshot.data[index].countryName,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                  trailing: Text(
                      "+" + snapshot.data[index].totalConfirmedCases.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 18)),
                ),
              );
            });
          } else if (snapshot.hasError) {
            return Text(snapshot.error);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
