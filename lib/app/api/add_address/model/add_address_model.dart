class AddAddressModel {
    int? id;
    String? phone;
    String? city;
    String? street;
    String? detailStreet;
    String? detailLocation;
    DateTime? createdAt;
    DateTime? updatedAt;

    AddAddressModel({
        this.id,
        this.phone,
        this.city,
        this.street,
        this.detailStreet,
        this.detailLocation,
        this.createdAt,
        this.updatedAt,
    });

    factory AddAddressModel.fromJson(Map<String, dynamic> json) => AddAddressModel(
        id: json["id"],
        phone: json["phone"],
        city: json["city"],
        street: json["street"],
        detailStreet: json["detail_street"],
        detailLocation: json["detail_location"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "city": city,
        "street": street,
        "detail_street": detailStreet,
        "detail_location": detailLocation,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}