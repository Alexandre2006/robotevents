class Program {
  int? id;
  String? abbr;
  String? name;

  Program(this.id, this.abbr, this.name);

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      json['id'],
      json['abbr'],
      json['name'],
    );
  }
}
