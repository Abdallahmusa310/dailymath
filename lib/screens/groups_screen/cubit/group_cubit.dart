import 'package:bloc/bloc.dart';
import 'package:dialymath/db/box_manager.dart';
import 'package:dialymath/models/group_model.dart';
import 'package:meta/meta.dart';
part 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  GroupCubit() : super(GroupInitial());

  void fetchAllGroups(int day) {
    emit(GroupLoading(state.groups));
    final groupBox = BoxManager.instance.groupBox;
    final List<GroupModel> filteredGroups =
        groupBox.values.where((item) => item.day == day).toList();
    emit(GroupSuccess(filteredGroups));
  }

  Future<void> addGroup(GroupModel group) async {
    emit(GroupLoading(state.groups));
    try {
      final groupBox = BoxManager.instance.groupBox;
      // Generate a unique ID by finding the maximum existing ID and adding 1
      int maxId = 0;
      for (var existingGroup in groupBox.values) {
        if (existingGroup.id != null && existingGroup.id! > maxId) {
          maxId = existingGroup.id!;
        }
      }
      group.id = maxId + 1;
      await groupBox.add(group);
      fetchAllGroups(group.day!);
    } catch (e) {
      emit(GroupFailure(e.toString(), state.groups));
    }
  }

  Future<void> deleteGroup(GroupModel group) async {
    emit(GroupLoading(state.groups));
    try {
      // Delete the group
      await group.delete();

      // Delete or update students in the deleted group
      final studentBox = BoxManager.instance.studentBox;
      final studentsInGroup =
          studentBox.values.where((student) => student.idgroup == group.id);

      for (var student in studentsInGroup) {
        await student
            .delete(); // Or update student.idgroup to a special value like -1
      }

      fetchAllGroups(group.day!);
    } catch (e) {
      emit(GroupFailure(e.toString(), state.groups));
    }
  }
}
