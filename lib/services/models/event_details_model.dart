class EventDetails {
  int? id;
  String? title;
  String? description;
  String? guidelines;
  String? venue;
  String? registrationStartDate;
  String? registrationEndDate;
  String? eventDate;
  String? poster;
  String? status;
  List<String>? galleryFiles;
  bool? isRegistrationsOpen;
  bool? paymentRequired;
  String? amount;
  String? createdAt;
  String? updatedAt;

  EventDetails(
      {this.id,
      this.title,
      this.description,
      this.guidelines,
      this.venue,
      this.registrationStartDate,
      this.registrationEndDate,
      this.eventDate,
      this.poster,
      this.status,
      this.galleryFiles,
      this.isRegistrationsOpen,
      this.paymentRequired,
      this.amount,
      this.createdAt,
      this.updatedAt});

  EventDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    guidelines = json['guidelines'];
    venue = json['venue'];
    registrationStartDate = json['registration_start_date'];
    registrationEndDate = json['registration_end_date'];
    eventDate = json['event_date'];
    poster = json['poster'];
    status = json['status'];
    galleryFiles = json['gallery_files'].cast<String>();
    isRegistrationsOpen = json['is_registrations_open'];
    paymentRequired = json['payment_required'];
    amount = json['amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['guidelines'] = guidelines;
    data['venue'] = venue;
    data['registration_start_date'] = registrationStartDate;
    data['registration_end_date'] = registrationEndDate;
    data['event_date'] = eventDate;
    data['poster'] = poster;
    data['status'] = status;
    data['gallery_files'] = galleryFiles;
    data['is_registrations_open'] = isRegistrationsOpen;
    data['payment_required'] = paymentRequired;
    data['amount'] = amount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
