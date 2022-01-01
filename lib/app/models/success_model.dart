class Success {
  late final String success;
  dynamic records;

  Success({
    required this.success,
    this.records,
  });

  Success.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? 'false';
    records = json['records'] ?? null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    data['records'] = this.records;
    return data;
  }
}
