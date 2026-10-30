class Offer {
  const Offer({
    required this.driverId,
    required this.driverName,
    required this.price,
  });
  final String driverId;
  final String driverName;
  final double price;
}

class Assignment {
  const Assignment({required this.tripId, required this.driverName});
  final String tripId;
  final String driverName;
}

class OfferFailure implements Exception {
  const OfferFailure(this.message);
  final String message;
  @override
  String toString() => message;
}
