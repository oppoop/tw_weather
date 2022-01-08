class AllCityRecords {
  AllCityRecords({
    required this.datasetDescription,
    required this.location,
  });

  late final String datasetDescription;
  late List<AllCityLocation> location;

  factory AllCityRecords.fromJson(Map<String, dynamic> json) => AllCityRecords(
        datasetDescription: json["datasetDescription"] ?? '',
        location: List<AllCityLocation>.from(
            json["location"].map((x) => AllCityLocation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "datasetDescription": datasetDescription,
        "location": List<dynamic>.from(location.map((x) => x.toJson())),
      };
}

class AllCityLocation {
  AllCityLocation({required this.locationName, required this.weatherElement});

  late final String locationName;
  List<AllCityWeatherElement> weatherElement;

  factory AllCityLocation.fromJson(Map<String, dynamic> json) =>
      AllCityLocation(
        locationName: json["locationName"] ?? '',
        weatherElement: List<AllCityWeatherElement>.from(json["weatherElement"]
            .map((x) => AllCityWeatherElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "locationName": locationName,
        "weatherElement":
            List<dynamic>.from(weatherElement.map((x) => x.toJson())),
      };
}

class AllCityWeatherElement {
  AllCityWeatherElement({
    required this.elementName,
    required this.time,
  });
  late final String elementName;
  late final List<AllCityTime> time;

  AllCityWeatherElement.fromJson(Map<String, dynamic> json) {
    elementName = json['elementName'];
    time = List.from(json['time']).map((e) => AllCityTime.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['elementName'] = elementName;
    _data['time'] = time.map((e) => e.toJson()).toList();
    return _data;
  }
}

class AllCityTime {
  AllCityTime({
    required this.startTime,
    required this.endTime,
    required this.parameter,
  });
  late final String startTime;
  late final String endTime;
  late final AllCityParameter parameter;

  AllCityTime.fromJson(Map<String, dynamic> json) {
    startTime = json['startTime'];
    endTime = json['endTime'];
    parameter = AllCityParameter.fromJson(json['parameter']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['startTime'] = startTime;
    _data['endTime'] = endTime;
    _data['parameter'] = parameter.toJson();
    return _data;
  }
}

class AllCityParameter {
  AllCityParameter({
    required this.parameterName,
  });
  late final String parameterName;

  AllCityParameter.fromJson(Map<String, dynamic> json) {
    parameterName = json['parameterName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['parameterName'] = parameterName;
    return _data;
  }
}
