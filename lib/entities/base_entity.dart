abstract class BaseEntity {
  int spd;
  int dist;
  String dest;
  String name;

  BaseEntity(this.spd, this.dist, this.dest, this.name);

  @override
  int get hashCode => Object.hash(spd, dist, dest, name);

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

  @override
  String toString();
}
