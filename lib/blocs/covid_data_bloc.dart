import 'package:flutter_bloc_pattern/models/covid_model.dart';
import 'package:flutter_bloc_pattern/repoistory/repository.dart';

import 'package:rxdart/rxdart.dart';

class CovidDataBloc {
  final _repository = Repository();
  final _covidDataFecther = PublishSubject<List<CovidModel>>();

  Stream<List<CovidModel>> get covidDataStream => _covidDataFecther.stream;

  fetchCoivdData() async {
    List<CovidModel> data = await _repository.getLastetCoivdData();
    _covidDataFecther.sink.add(data);
  }

  dispose() {
    _covidDataFecther.close();
  }
}

final covidDataBloc = CovidDataBloc();
