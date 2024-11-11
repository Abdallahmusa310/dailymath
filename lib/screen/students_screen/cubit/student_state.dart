part of 'student_cubit.dart';

@immutable
sealed class StudentState {
  final List<StudentModel>? student;
  const StudentState({this.student});

}

final class StudentInitial extends StudentState {
  StudentInitial():super(student: []);

}
class AddStudentLoading extends StudentState {
  const AddStudentLoading(List<StudentModel>? students) : super(student: students);
}

class AddStudentSuccess extends StudentState {
  const AddStudentSuccess(List<StudentModel>? students) : super(student: students);
}

class AddStudentFailure extends StudentState {
  final String errMessage;
  const AddStudentFailure(this.errMessage, List<StudentModel>? students) : super(student:students);

  
}

