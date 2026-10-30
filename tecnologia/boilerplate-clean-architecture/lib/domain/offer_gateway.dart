import 'offer.dart';

abstract interface class OfferGateway {
  Future<List<Offer>> findOffers(String pickup, String destination);
  Future<Assignment> accept(Offer offer);
}
