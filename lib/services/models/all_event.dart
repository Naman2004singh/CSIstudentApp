class AllEvent {
  int? id;
  String? title;
  List<String>? mediaFiles;

  AllEvent({this.id, this.title, this.mediaFiles});

  AllEvent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    // mediaFiles = json['media_files'].cast<String>();
    mediaFiles = (json['media_files'] as List<dynamic>?)?.map((e) => e.toString()).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['media_files'] = mediaFiles;
    return data;
  }
}
