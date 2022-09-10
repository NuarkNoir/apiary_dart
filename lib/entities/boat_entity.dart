import 'base_entity.dart';

///
/// Boat entity class
///
class BoatEntity extends BaseEntity {
  /// Water displacement
  late int disp;

  /// Year of manufacture
  late int year;

  ///
  /// Constructor
  /// [spd] - speed
  /// [dist] - distance
  /// [dest] - destination
  /// [name] - name
  /// [disp] - water displacement
  /// [year] - year of manufacture
  ///
  BoatEntity(
      super.spd, super.dist, super.dest, super.name, this.disp, this.year);

  ///
  /// Hashcode
  ///
  /// Returns hashcode
  ///
  @override
  int get hashCode => Object.hash(super.hashCode, disp, year);

  ///
  /// Equals
  ///
  /// Returns true if [other] equals to this
  ///
  @override
  bool operator ==(Object other) {
    if (other is BoatEntity) {
      return super == other && disp == other.disp && year == other.year;
    }
    return false;
  }

  ///
  /// Converts entity to string
  ///
  /// Returns string representation of entity
  ///
  @override
  String toString() {
    return 'BoatEntity{name: $name, spd: $spd, dist: $dist, dest: $dest, disp: $disp, year: $year}';
  }
}
