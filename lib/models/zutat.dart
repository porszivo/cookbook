import 'einheit.dart';

class Zutat {

  Zutat(this.menge, [this.name, this.einheit = Einheit.g]);

  late String? name;
  int menge;
  Einheit? einheit;

}