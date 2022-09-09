import 'package:apiary_dart/entities/base_entity.dart';

class BoatEntity extends BaseEntity {
  late int disp;
  late int year;

  BoatEntity(
      super.spd, super.dist, super.dest, super.name, this.disp, this.year);

  @override
  int get hashCode => Object.hash(super.hashCode, disp, year);

  @override
  bool operator ==(Object other) {
    if (other is BoatEntity) {
      return super == other && disp == other.disp && year == other.year;
    }
    return false;
  }

  @override
  String toString() {
    return 'BoatEntity{name: $name, spd: $spd, dist: $dist, dest: $dest, disp: $disp, year: $year}';
  }
}
