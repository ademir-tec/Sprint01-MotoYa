import '../domain/offer.dart';
import '../domain/offer_gateway.dart';

// Simplified academic case: the full app uses RideSearchUseCase and OfferService.
class SelectOfferUseCase {
  SelectOfferUseCase(this.gateway);
  final OfferGateway gateway;
  List<Offer> _offers = const [];
  bool _loaded = false;
  bool _accepting = false;
  bool _assigned = false;

  Future<List<Offer>> search(String pickup, String destination) async {
    if (_accepting || _assigned) {
      throw const OfferFailure('Ya hay una asignación en curso o confirmada');
    }
    _loaded = false;
    _offers = const [];
    if (pickup.trim().isEmpty || destination.trim().isEmpty) {
      throw const OfferFailure('Indica recojo y destino');
    }
    final received = await gateway.findOffers(
      pickup.trim(),
      destination.trim(),
    );
    _offers = List.unmodifiable(received);
    _loaded = true;
    return _offers;
  }

  Future<Assignment> accept(String driverId) async {
    if (!_loaded || _accepting || _assigned) {
      throw const OfferFailure('No puedes aceptar otra oferta en este estado');
    }
    final matches = _offers.where((offer) => offer.driverId == driverId);
    if (matches.isEmpty)
      throw const OfferFailure('La oferta no está disponible');
    _accepting = true;
    try {
      final assignment = await gateway.accept(matches.first);
      _assigned = true;
      return assignment;
    } finally {
      _accepting = false;
    }
  }
}
