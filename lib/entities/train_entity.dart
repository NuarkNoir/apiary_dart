import 'base_entity.dart';

///
/// Train entity class
///
class TrainEntity extends BaseEntity {
  /// Count of vagons
  late int cnt;

  ///
  /// Constructor
  /// [spd] - speed
  /// [dist] - distance
  /// [dest] - destination
  /// [name] - name
  /// [cnt] - count of vagons
  ///
  TrainEntity(super.spd, super.dist, super.dest, super.name, this.cnt);

  ///
  /// Hashcode
  ///
  /// Returns hashcode
  ///
  @override
  int get hashCode => Object.hash(super.hashCode, cnt, name.hashCode);

  ///
  /// Equals
  ///
  /// Returns true if [other] equals to this
  ///
  @override
  bool operator ==(Object other) {
    if (other is TrainEntity) {
      return super == other && cnt == other.cnt && name == other.name;
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
    return 'TrainEntity{name: $name, spd: $spd, dist: $dist, dest: $dest, cnt: $cnt}';
  }
}
