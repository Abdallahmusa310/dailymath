import 'package:dialymath/models/group_model.dart';
import 'package:dialymath/models/student_model.dart';
import 'package:hive/hive.dart';

class BoxManager {
  static final BoxManager _instance = BoxManager._internal();
  Box<GroupModel>? _groupBox;
  Box<StudentModel>? _studentBox;

  BoxManager._internal();

  static BoxManager get instance => _instance;

  Future<void> initialize() async {
    _groupBox ??= await Hive.openBox<GroupModel>('groupbox');

    _studentBox ??= await Hive.openBox<StudentModel>('studentbox');
  }

  Box<GroupModel> get groupBox {
    if (_groupBox == null) {
      throw Exception("group box is null");
    }
    return _groupBox!;
  }

  Box<StudentModel> get studentBox {
    if (_studentBox == null) {
      throw Exception(" student box is null");
    }
    return _studentBox!;
  }
}
