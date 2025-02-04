import 'package:bloc/bloc.dart';
import 'package:dialymath/db/BoxManager.dart';
import 'package:dialymath/models/student_model.dart';
import 'package:meta/meta.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial());
  int? _currentGroupId;

  void fetchAllstudents(int groupid) {
    _currentGroupId = groupid;
    emit(AddStudentLoading(state.student ?? []));
    final studentBox = BoxManager.instance.studentBox;
    final List<StudentModel> filteredstudents =
        studentBox.values.where((item) => item.idgroup == groupid).toList();
    emit(AddStudentSuccess(filteredstudents));
  }

  Future<void> addstudent(StudentModel student) async {
    emit(AddStudentLoading(state.student ?? []));
    try {
      final studentBox = BoxManager.instance.studentBox;
      if (student.idgroup == 0) {
        emit(AddStudentFailure('id group is required', state.student ?? []));
        return;
      }
      await studentBox.add(student);
      fetchAllstudents(student.idgroup);
    } catch (e) {
      emit(AddStudentFailure(e.toString(), state.student ?? []));
    }
  }

  Future<void> deleteStudent(StudentModel student) async {
    emit(AddStudentLoading(state.student ?? []));
    try {
      final studentBox = BoxManager.instance.studentBox;
      final index = studentBox.values.toList().indexWhere(
            (element) => element.key == student.key,
          );
      if (index != -1) {
        await studentBox.deleteAt(index);
        if (_currentGroupId != null) {
          fetchAllstudents(_currentGroupId!);
        } else {
          fetchAllstudents(student.idgroup);
        }
      } else {
        emit(AddStudentFailure('Student not found', state.student ?? []));
      }
    } catch (e) {
      emit(AddStudentFailure(e.toString(), state.student ?? []));
    }
  }
}
