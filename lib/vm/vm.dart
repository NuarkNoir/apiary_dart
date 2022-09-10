import '../entities/base_entity.dart';
import '../utils/circular_linked_list.dart';
import '../utils/circular_linked_list_node.dart';
import 'vm_comands.dart';

///
///Typedefs to make code more readable
///
typedef EntityList = CircularLinkedList<BaseEntity>;
typedef EntityNode = CircularLinkedListNode<BaseEntity>;

///
/// VMContext class
///
class VMContext {
  /// List of entities
  late final List<VMComand> _comands;

  /// List of entities
  late final EntityList _entities;

  /// Getter for entities
  EntityList get entities => _entities;

  /// Constructor
  VMContext.createVMContext() {
    _comands = [];
    _entities = EntityList();
  }

  ///
  /// Add comand to the list
  /// [comand] - comand to add
  ///
  void pushComand(VMComand comand) {
    _comands.add(comand);
  }

  ///
  /// Execute all comands
  ///
  Future<void> executeComands() async {
    for (final comand in _comands) {
      await comand.execute(this);
    }
    _comands.clear();
  }
}
