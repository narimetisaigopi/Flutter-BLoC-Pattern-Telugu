import 'package:flutter_bloc_pattern/api_repo/covid_api_repo.dart';
import 'package:flutter_bloc_pattern/models/covid_model.dart';

class Repository {
  CovidApiRepo covidApiRepo = CovidApiRepo();

  Future<List<CovidModel>> getLastetCoivdData() =>
      covidApiRepo.getLatestCovidData();
}
