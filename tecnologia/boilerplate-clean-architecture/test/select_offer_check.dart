import 'dart:async';

import '../lib/application/select_offer.dart';
import '../lib/composition/build_example.dart';
import '../lib/domain/offer.dart';
import '../lib/domain/offer_gateway.dart';

void check(bool value, String message) {
  if (!value) throw StateError(message);
}

Future<void> fails(Future<Object?> Function() operation) async {
  try {
    await operation();
  } on OfferFailure {
    return;
  }
  throw StateError('Se esperaba rechazo de negocio');
}

class ControlledGateway implements OfferGateway {
  final pending = Completer<Assignment>();
  @override
  Future<List<Offer>> findOffers(
    String pickup,
    String destination,
  ) async => const [
    Offer(driverId: 'controlled', driverName: 'Conductor ficticio', price: 5),
  ];
  @override
  Future<Assignment> accept(Offer offer) => pending.future;
}

Future<void> main() async {
  final normal = buildExample();
  await fails(() => normal.accept('demo-driver'));
  await fails(() => normal.search('', 'UNSCH'));
  final offers = await normal.search('Casa', 'UNSCH');
  check(offers.length == 1, 'La búsqueda devuelve ofertas');
  await fails(() => normal.accept('otro-conductor'));
  final accepted = await normal.accept(offers.first.driverId);
  check(
    accepted.tripId == 'demo-trip',
    'Solo se confirma con resultado del puerto',
  );
  await fails(() => normal.accept(offers.first.driverId));

  final refused = buildExample(rejectAcceptance: true);
  await refused.search('Casa', 'UNSCH');
  await fails(() => refused.accept('demo-driver'));

  final controlled = ControlledGateway();
  final isolated = SelectOfferUseCase(controlled);
  await isolated.search('Casa', 'UNSCH');
  final pending = isolated.accept('controlled');
  await fails(() => isolated.accept('controlled'));
  controlled.pending.complete(
    const Assignment(tripId: 'confirmed', driverName: 'Conductor ficticio'),
  );
  check(
    (await pending).tripId == 'confirmed',
    'Aceptación pendiente confirmada',
  );
  print('Pruebas aprobadas: búsqueda, entradas inválidas, oferta inexistente,');
  print('confirmación, rechazo del servicio y bloqueo de doble aceptación.');
}
