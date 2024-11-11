
import 'package:bloc/bloc.dart';
import 'package:dialymath/db/BoxManager.dart';
import 'package:dialymath/models/group_model.dart';
import 'package:meta/meta.dart';
part 'group_state.dart';


class GroupCubit extends Cubit<GroupState> {
  GroupCubit() : super(GroupInitial());

  void fetchAllGroups(int day) {
     emit(GroupLoading(state.groups));
    final groupBox = BoxManager.instance.groupBox;
    final List<GroupModel> filteredGroups = groupBox.values.where((item) => item.day == day).toList();
    emit(GroupSuccess(filteredGroups));
  }

  Future<void> addGroup(GroupModel group) async{
    emit(GroupLoading(state.groups));
    try{
      final groupBox = BoxManager.instance.groupBox;
      group.id = groupBox.length + 1;
      await groupBox.add(group);
      fetchAllGroups(group.day!);
    }catch(e){
      emit(GroupFailure(e.toString(), state.groups));
    }

  }

}
 // fetchAllgroups(int day){
  //   var groupBox = Hive.box<GroupModel>('groupbox');
  //   groups = groupBox.values.where((item)=>item.day==day).toList();
  //   emit(GroupSuccess(),)
  //   ;
  // }
  // List<Studentmodel>?students;
  // fetchAllstudents(){
  //   var groupBox = Hive.box<GroupModel>('studentbox');
  //   groups = groupBox.values.toList();
  //    emit(GroupSuccess());
  // }
