class ShoeCleaningOrder {
  final String shoeName;
  final String pickupDate;
  final String note;

  ShoeCleaningOrder({required this.shoeName, required this.pickupDate, required this.note});

  Map<String, dynamic> toMap() {
    return {
      'shoeName': shoeName,
      'pickupDate': pickupDate,
      'note': note,
    };
  }
}
