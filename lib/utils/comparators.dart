import 'package:apiary_dart/entities/boat_entity.dart';
import 'package:apiary_dart/entities/plane_entity.dart';

import '../entities/base_entity.dart';
import '../entities/train_entity.dart';

typedef AttrSelector = bool Function<T>(T, String, Object, String);

class Comparators {
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

  static bool compareInt(int val, Object expected, String op) {
    if (expected is int) {
      switch (op) {
        case "<":
          return val < expected;
        case ">":
          return val > expected;
        case "=":
          return val == expected;
      }
    }

    return false;
  }

  static bool compareString(String val, Object expected, String op) {
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
        return Comparators.compareInt(a.spd, value, op);
      case "dist":
        return Comparators.compareInt(a.dist, value, op);
      case "dest":
        return Comparators.compareString(a.dest, value, op);
      case "name":
        return Comparators.compareString(a.name, value, op);
      case "cnt":
        return Comparators.compareInt(a.cnt, value, op);
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
        return Comparators.compareInt(a.spd, value, op);
      case "dist":
        return Comparators.compareInt(a.dist, value, op);
      case "dest":
        return Comparators.compareString(a.dest, value, op);
      case "name":
        return Comparators.compareString(a.name, value, op);
      case "len":
        return Comparators.compareInt(a.len, value, op);
      case "cap":
        return Comparators.compareInt(a.cap, value, op);
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
        return Comparators.compareInt(a.spd, value, op);
      case "dist":
        return Comparators.compareInt(a.dist, value, op);
      case "dest":
        return Comparators.compareString(a.dest, value, op);
      case "name":
        return Comparators.compareString(a.name, value, op);
      case "disp":
        return Comparators.compareInt(a.disp, value, op);
      case "year":
        return Comparators.compareInt(a.year, value, op);
    }

    return false;
  }
}
