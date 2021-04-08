class CovidModel {
  String countryName;
  int totalConfirmedCases;

  CovidModel({this.countryName, this.totalConfirmedCases});

  factory CovidModel.fromJSON(Map map) {
    return CovidModel(
      countryName: map["Country"],
      totalConfirmedCases: map["TotalConfirmed"],
    );
  }
}
