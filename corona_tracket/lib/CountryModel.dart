class CountryModel {
  final cases;
  final todayCases;
  final deaths;
  final todayDeaths;
  final critical;
  final casesPerOneMillion;
  final totalTests;

  CountryModel(this.cases, this.todayCases, this.deaths, this.todayDeaths,
      this.critical, this.casesPerOneMillion, this.totalTests);
  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      json["cases"].toString(),
      json["todayCases"].toString(),
      json["deaths"].toString(),
      json["todayDeaths"].toString(),
      json["critical"].toString(),
      json["casesPerOneMillion"].toString(),
      json["totalTests"].toString(),
    );
  }
}
