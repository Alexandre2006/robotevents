class IdInfo {
  int id;
  String name;
  String? code;

  IdInfo(this.id, this.name, this.code);

  factory IdInfo.fromJson(Map<String, dynamic> json) {
    return IdInfo(
      json['id'],
      json['name'],
      json['code'],
    );
  }
}
