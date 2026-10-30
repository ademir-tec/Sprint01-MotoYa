import '../lib/composition/build_example.dart';

Future<void> main() async {
  final useCase = buildExample();
  final offers = await useCase.search(
    'Mi vivienda en Huamanga',
    'Puerta 1 UNSCH',
  );
  for (final offer in offers) {
    print('${offer.driverName}: S/ ${offer.price.toStringAsFixed(2)}');
  }
  final assignment = await useCase.accept(offers.first.driverId);
  print('Demo: ${assignment.driverName} viene al punto de recojo.');
  print(
    'Viaje ficticio: ${assignment.tripId}. No se envía ninguna solicitud real.',
  );
}
