import 'package:hive/hive.dart';
part 'student_model.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject {
  @HiveField(0)
  String studentname;

  @HiveField(1)
  String parentrhone;

  @HiveField(2)
  int idgroup;

  
  StudentModel({
      required this.studentname,
      required this.parentrhone,
       required this.idgroup
      });
}
