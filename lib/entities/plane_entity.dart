import 'package:apiary_dart/entities/base_entity.dart';

class PlaneEntity extends BaseEntity {
  int len;
  int cap;

  PlaneEntity(
      super.spd, super.dist, super.dest, super.name, this.len, this.cap);

  @override
  int get hashCode => Object.hash(super.hashCode, len, cap);

  @override
  bool operator ==(Object other) {
    if (other is PlaneEntity) {
      return super == other && len == other.len && cap == other.cap;
    }
    return false;
  }

  @override
  String toString() {
    return 'PlaneEntity{name: $name, spd: $spd, dist: $dist, dest: $dest, len: $len, cap: $cap}';
  }
}
