import '../entities/base_entity.dart';
import '../entities/train_entity.dart';
import '../entities/boat_entity.dart';
import '../entities/plane_entity.dart';

///
/// Class with static methods to compare entities and attrs
///
class Comparators {
  ///
  /// Compare two entities attr
  /// [obj] - entity to compare
  /// [attr] - attr to compare
  /// [value] - value to compare
  /// [op] - compare operator
  ///
  /// Returns:
  /// true - if obj.attr op value,
  /// false - if obj.attr op! value
  ///
  static bool compareAttr(
    BaseEntity obj,
    String attr,
    Object value,
    String op,
  ) {
    if (obj is TrainEntity) {
      return Comparators._compareTrainAttr(obj, attr, value, op);
    } else if (obj is PlaneEntity) {
      return Comparators._comparePlaneAttr(obj, attr, value, op);
    } else if (obj is BoatEntity) {
      return Comparators._compareBoatAttr(obj, attr, value, op);
    }

    return false;
  }

  ///
  /// Compare two entities
  /// [a] - first entity to compare
  /// [b] - second entity to compare
  /// [attr] - attr to compare
  ///
  /// Returns:
  /// true - if a.attr == b.attr,
  /// false - if a.attr != b.attr
  ///
  static bool compareEntities(BaseEntity a, BaseEntity b, String attr) {
    if (a is TrainEntity) {
      return Comparators._compareTrainEntities(a, b, attr);
    } else if (a is PlaneEntity) {
      return Comparators._comparePlaneEntities(a, b, attr);
    } else if (a is BoatEntity) {
      return Comparators._compareBoatEntities(a, b, attr);
    }

    return false;
  }

  static bool _compareInt(int val, Object expected, String op) {
    if (expected is int || int.tryParse(expected.toString()) != null) {
      int v = expected is int ? expected : int.parse(expected.toString());
      switch (op) {
        case "<":
          return val < v;
        case ">":
          return val > v;
        case "=":
          return val == v;
      }
    }

    return false;
  }

  static bool _compareString(String val, Object expected, String op) {
    if (expected is String) {
      switch (op) {
        case "!=":
          return val.compareTo(expected) != 0;
        case "=":
          return val.compareTo(expected) == 0;
      }
    }

    return false;
  }

  static bool _compareTrainAttr(
    TrainEntity a,
    String attr,
    Object value,
    String op,
  ) {
    switch (attr) {
      case "spd":
        return Comparators._compareInt(a.spd, value, op);
      case "dist":
        return Comparators._compareInt(a.dist, value, op);
      case "dest":
        return Comparators._compareString(a.dest, value, op);
      case "name":
        return Comparators._compareString(a.name, value, op);
      case "cnt":
        return Comparators._compareInt(a.cnt, value, op);
    }

    return false;
  }

  static bool _comparePlaneAttr(
    PlaneEntity a,
    String attr,
    Object value,
    String op,
  ) {
    switch (attr) {
      case "spd":
        return Comparators._compareInt(a.spd, value, op);
      case "dist":
        return Comparators._compareInt(a.dist, value, op);
      case "dest":
        return Comparators._compareString(a.dest, value, op);
      case "name":
        return Comparators._compareString(a.name, value, op);
      case "len":
        return Comparators._compareInt(a.len, value, op);
      case "cap":
        return Comparators._compareInt(a.cap, value, op);
    }

    return false;
  }

  static bool _compareBoatAttr(
    BoatEntity a,
    String attr,
    Object value,
    String op,
  ) {
    switch (attr) {
      case "spd":
        return Comparators._compareInt(a.spd, value, op);
      case "dist":
        return Comparators._compareInt(a.dist, value, op);
      case "dest":
        return Comparators._compareString(a.dest, value, op);
      case "name":
        return Comparators._compareString(a.name, value, op);
      case "disp":
        return Comparators._compareInt(a.disp, value, op);
      case "year":
        return Comparators._compareInt(a.year, value, op);
    }

    return false;
  }

  static bool _compareTrainEntities(TrainEntity a, BaseEntity b, String attr) {
    if (b is TrainEntity) {
      switch (attr) {
        case "spd":
          return a.spd < b.spd;
        case "dist":
          return a.dist < b.dist;
        case "dest":
          return a.dest.compareTo(b.dest) < 0;
        case "name":
          return a.name.compareTo(b.name) < 0;
        case "cnt":
          return a.cnt < b.cnt;
      }
    }

    return false;
  }

  static bool _comparePlaneEntities(PlaneEntity a, BaseEntity b, String attr) {
    if (b is PlaneEntity) {
      switch (attr) {
        case "spd":
          return a.spd < b.spd;
        case "dist":
          return a.dist < b.dist;
        case "dest":
          return a.dest.compareTo(b.dest) < 0;
        case "name":
          return a.name.compareTo(b.name) < 0;
        case "len":
          return a.len < b.len;
        case "cap":
          return a.cap < b.cap;
      }
    }

    return false;
  }

  static bool _compareBoatEntities(BoatEntity a, BaseEntity b, String attr) {
    if (b is BoatEntity) {
      switch (attr) {
        case "spd":
          return a.spd < b.spd;
        case "dist":
          return a.dist < b.dist;
        case "dest":
          return a.dest.compareTo(b.dest) < 0;
        case "name":
          return a.name.compareTo(b.name) < 0;
        case "disp":
          return a.disp < b.disp;
        case "year":
          return a.year < b.year;
      }
    }

    return false;
  }
}
