part of 'group_cubit.dart';

@immutable
sealed class GroupState {
  final List<GroupModel>? groups;
  const GroupState({this.groups});
  }

class GroupInitial extends GroupState {
  GroupInitial():super(groups: []);
}
class GroupLoading extends GroupState {
  const GroupLoading(List<GroupModel>? groups) : super(groups: groups);
}

class GroupSuccess extends GroupState {
  const GroupSuccess(List<GroupModel> groups) : super(groups: groups);
}

class GroupFailure extends GroupState {
  final String error;
  const GroupFailure(this.error, List<GroupModel>? groups) : super(groups: groups);
}

