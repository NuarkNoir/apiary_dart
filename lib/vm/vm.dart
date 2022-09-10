import '../entities/base_entity.dart';
import '../utils/circular_linked_list.dart';
import '../utils/circular_linked_list_node.dart';
import 'vm_commands.dart';

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
  late final List<VMCommand> _commands;

  /// List of entities
  late final EntityList _entities;

  /// Getter for entities
  EntityList get entities => _entities;

  /// Constructor
  VMContext.createVMContext() {
    _commands = [];
    _entities = EntityList();
  }

  ///
  /// Add command to the list
  /// [command] - command to add
  ///
  void pushCommand(VMCommand command) {
    _commands.add(command);
  }

  ///
  /// Execute all commands
  ///
  Future<void> executeCommands() async {
    for (final command in _commands) {
      await command.execute(this);
    }
    _commands.clear();
  }
}
