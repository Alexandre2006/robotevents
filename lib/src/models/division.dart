class Division {
  int? id;
  String? name;
  int? order;

  Division(this.id, this.name, this.order);

  factory Division.fromJson(Map<String, dynamic> json) {
    return Division(
      json['id'],
      json['name'],
      json['order'],
    );
  }
}
