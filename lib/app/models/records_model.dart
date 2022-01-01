class Records {
  Records({
    required this.datasetDescription,
    required this.location,
  });

  late final String datasetDescription;
  late List<Location> location;

  factory Records.fromJson(Map<String, dynamic> json) => Records(
        datasetDescription: json["datasetDescription"] ?? '',
        location: List<Location>.from(
            json["location"].map((x) => Location.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "datasetDescription": datasetDescription,
        "location": List<dynamic>.from(location.map((x) => x.toJson())),
      };
}

class Location {
  Location({required this.locationName, required this.weatherElement});

  late final String locationName;
  List<WeatherElement> weatherElement;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        locationName: json["locationName"] ?? '',
        weatherElement: List<WeatherElement>.from(
            json["weatherElement"].map((x) => WeatherElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "locationName": locationName,
        "weatherElement":
            List<dynamic>.from(weatherElement.map((x) => x.toJson())),
      };
}

class WeatherElement {
  WeatherElement({
    required this.elementName,
    required this.time,
  });
  late final String elementName;
  late final List<Time> time;

  WeatherElement.fromJson(Map<String, dynamic> json) {
    elementName = json['elementName'];
    time = List.from(json['time']).map((e) => Time.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['elementName'] = elementName;
    _data['time'] = time.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Time {
  Time({
    required this.startTime,
    required this.endTime,
    required this.parameter,
  });
  late final String startTime;
  late final String endTime;
  late final Parameter parameter;

  Time.fromJson(Map<String, dynamic> json) {
    startTime = json['startTime'];
    endTime = json['endTime'];
    parameter = Parameter.fromJson(json['parameter']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['startTime'] = startTime;
    _data['endTime'] = endTime;
    _data['parameter'] = parameter.toJson();
    return _data;
  }
}

class Parameter {
  Parameter({
    required this.parameterName,
  });
  late final String parameterName;

  Parameter.fromJson(Map<String, dynamic> json) {
    parameterName = json['parameterName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['parameterName'] = parameterName;
    return _data;
  }
}
