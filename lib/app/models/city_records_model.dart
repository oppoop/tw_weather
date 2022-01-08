class CityRecords {
  late final List<CityLocations> locations;

  CityRecords({required this.locations});

  CityRecords.fromJson(Map<String, dynamic> json) {
    if (json['locations'] != null) {
      locations = <CityLocations>[];
      json['locations'].forEach((v) {
        locations.add(new CityLocations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['locations'] = this.locations.map((v) => v.toJson()).toList();
    return data;
  }
}

class CityLocations {
  late final String locationsName;
  late final List<CityLocation> location;

  CityLocations({required this.locationsName, required this.location});

  CityLocations.fromJson(Map<String, dynamic> json) {
    locationsName = json['locationsName'];
    if (json['location'] != null) {
      location = <CityLocation>[];
      json['location'].forEach((v) {
        location.add(new CityLocation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['locationsName'] = this.locationsName;
    data['location'] = this.location.map((v) => v.toJson()).toList();
    return data;
  }
}

class CityLocation {
  late String locationName;
  late String geocode;
  late List<CityWeatherElement> weatherElement;

  CityLocation(
      {required this.locationName,
      required this.geocode,
      required this.weatherElement});

  CityLocation.fromJson(Map<String, dynamic> json) {
    locationName = json['locationName'];
    geocode = json['geocode'];
    if (json['weatherElement'] != null) {
      weatherElement = <CityWeatherElement>[];
      json['weatherElement'].forEach((v) {
        weatherElement.add(new CityWeatherElement.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['locationName'] = this.locationName;
    data['geocode'] = this.geocode;
    data['weatherElement'] =
        this.weatherElement.map((v) => v.toJson()).toList();
    return data;
  }
}

class CityWeatherElement {
  late String elementName;
  late List<CityTime> time;

  CityWeatherElement({required this.elementName, required this.time});

  CityWeatherElement.fromJson(Map<String, dynamic> json) {
    elementName = json['elementName'];

    if (json['time'] != null) {
      time = <CityTime>[];
      json['time'].forEach((v) {
        time.add(new CityTime.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['elementName'] = this.elementName;
    data['time'] = this.time.map((v) => v.toJson()).toList();

    return data;
  }
}

class CityTime {
  late String startTime;
  late String endTime;
  late List<ElementValue> elementValue;
  late String dataTime;

  CityTime(
      {required this.startTime,
      required this.endTime,
      required this.elementValue,
      required this.dataTime});

  CityTime.fromJson(Map<String, dynamic> json) {
    startTime = json['startTime'] ?? '';
    endTime = json['endTime'] ?? '';
    if (json['elementValue'] != null) {
      elementValue = <ElementValue>[];
      json['elementValue'].forEach((v) {
        elementValue.add(new ElementValue.fromJson(v));
      });
    }
    dataTime = json['dataTime'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['elementValue'] = this.elementValue.map((v) => v.toJson()).toList();
    data['dataTime'] = this.dataTime;
    return data;
  }
}

class ElementValue {
  late String value;

  ElementValue({required this.value});

  ElementValue.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;

    return data;
  }
}
