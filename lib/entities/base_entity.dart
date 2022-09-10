///
/// Base class for all entities
///
abstract class BaseEntity {
  /// Speed
  int spd;

  /// Distance
  int dist;

  /// Destination
  String dest;

  /// Name
  String name;

  ///
  /// Constructor
  /// [spd] - speed
  /// [dist] - distance
  /// [dest] - destination
  /// [name] - name
  ///
  BaseEntity(this.spd, this.dist, this.dest, this.name);

  ///
  /// Hashcode
  ///
  /// Returns hashcode
  ///
  @override
  int get hashCode => Object.hash(spd, dist, dest, name);

  ///
  /// Equals
  ///
  /// Returns true if [other] equals to this
  ///
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is BaseEntity) {
      return spd == other.spd &&
          dist == other.dist &&
          dest == other.dest &&
          name == other.name;
    }
    return false;
  }

  ///
  /// Converts entity to string
  ///
  /// Returns string representation of entity
  ///
  @override
  String toString();
}
