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
  int? day;
  @HiveField(4)
  int? id;
  @HiveField(5)
  String? grouplink;
  GroupModel(
      {this.groupname,
      this.groupgrade,
      this.grouptime,
      this.day,
      this.id,
      this.grouplink
      // Include the groupid in the constructor.
      });
}
