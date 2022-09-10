import 'base_entity.dart';

///
/// Plane entity class
///
class PlaneEntity extends BaseEntity {
  /// Flight length
  int len;

  /// Capacity
  int cap;

  ///
  /// Constructor
  /// [spd] - speed
  /// [dist] - distance
  /// [dest] - destination
  /// [name] - name
  /// [len] - flight length
  /// [cap] - capacity
  ///
  PlaneEntity(
      super.spd, super.dist, super.dest, super.name, this.len, this.cap);

  ///
  /// Hashcode
  ///
  /// Returns hashcode
  ///
  @override
  int get hashCode => Object.hash(super.hashCode, len, cap);

  ///
  /// Equals
  ///
  /// Returns true if [other] equals to this
  ///
  @override
  bool operator ==(Object other) {
    if (other is PlaneEntity) {
      return super == other && len == other.len && cap == other.cap;
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
    return 'PlaneEntity{name: $name, spd: $spd, dist: $dist, dest: $dest, len: $len, cap: $cap}';
  }
}
