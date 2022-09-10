import '../entities/base_entity.dart';
import '../utils/circular_linked_list.dart';
import '../utils/circular_linked_list_node.dart';
import 'vm_commands.dart';

typedef EntityList = CircularLinkedList<BaseEntity>;
typedef EntityNode = CircularLinkedListNode<BaseEntity>;

class VMContext {
  late final List<VMCommand> _commands;
  late final EntityList _entities;

  EntityList get entities => _entities;

  VMContext.createVMContext() {
    _commands = [];
    _entities = EntityList();
  }

  void pushCommand(VMCommand command) {
    _commands.add(command);
  }

  Future<void> executeCommands() async {
    for (final command in _commands) {
      await command.execute(this);
    }
    _commands.clear();
  }
}
