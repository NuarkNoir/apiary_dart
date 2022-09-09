import 'package:apiary_dart/entities/base_entity.dart';

class TrainEntity extends BaseEntity {
  late int cnt;

  TrainEntity(super.spd, super.dist, super.dest, super.name, this.cnt);

  @override
  int get hashCode => Object.hash(super.hashCode, cnt, name.hashCode);

  @override
  bool operator ==(Object other) {
    if (other is TrainEntity) {
      return super == other && cnt == other.cnt && name == other.name;
    }
    return false;
  }

  @override
  String toString() {
    return 'TrainEntity{name: $name, spd: $spd, dist: $dist, dest: $dest, cnt: $cnt}';
  }
}
