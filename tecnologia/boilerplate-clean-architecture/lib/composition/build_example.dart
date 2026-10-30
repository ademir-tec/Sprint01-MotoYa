import '../application/select_offer.dart';
import '../data/memory_offer_gateway.dart';

SelectOfferUseCase buildExample({bool rejectAcceptance = false}) {
  return SelectOfferUseCase(
    MemoryOfferGateway(rejectAcceptance: rejectAcceptance),
  );
}
