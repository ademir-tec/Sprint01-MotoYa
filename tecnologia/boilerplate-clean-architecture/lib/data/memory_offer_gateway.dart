import '../domain/offer.dart';
import '../domain/offer_gateway.dart';

class MemoryOfferGateway implements OfferGateway {
  MemoryOfferGateway({this.rejectAcceptance = false});
  final bool rejectAcceptance;
  bool _assigned = false;

  @override
  Future<List<Offer>> findOffers(String pickup, String destination) async =>
      const [
        Offer(driverId: 'demo-driver', driverName: 'Luis Demo', price: 5.0),
      ];

  @override
  Future<Assignment> accept(Offer offer) async {
    if (rejectAcceptance || _assigned) {
      throw const OfferFailure('El conductor ya no está disponible');
    }
    _assigned = true;
    return Assignment(tripId: 'demo-trip', driverName: offer.driverName);
  }
}
