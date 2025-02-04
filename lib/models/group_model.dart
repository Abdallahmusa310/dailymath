import 'package:hive/hive.dart';
part 'group_model.g.dart';

@HiveType(typeId: 0)
class GroupModel extends HiveObject {
  @HiveField(0)
  String? groupname;

  @HiveField(1)
  String? groupgrade;

  @HiveField(2)
  String? grouptime;

  @HiveField(3)
  String? studentname;

  @HiveField(4)
  String? parentphone;

  @HiveField(5)
  int? day;

  @HiveField(6)
  int? id;

  // Add this field to store the auto-generated group ID.

  GroupModel({
    this.groupname,
    this.groupgrade,
    this.grouptime,
    this.studentname,
    this.parentphone,
    this.day,
    this.id,
    // Include the groupid in the constructor.
  });
}
