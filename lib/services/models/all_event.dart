class AllEvent {
  int? id;
  String? poster;
  String? status;

  AllEvent({this.id, this.poster, this.status});

  AllEvent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    poster = json['poster'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['poster'] = poster;
    data['status'] = status;
    return data;
  }
}
