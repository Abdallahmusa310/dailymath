import 'package:bloc/bloc.dart';
import 'package:dialymath/db/BoxManager.dart';
import 'package:dialymath/models/student_model.dart';
import 'package:meta/meta.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial());

    void fetchAllstudents(int day) {
     emit(AddStudentLoading(state.student));
    final studentBox = BoxManager.instance.studentBox;
    final List<StudentModel> filteredGroups=studentBox.values.where((item) => item.idgroup == day).toList();
    emit(AddStudentSuccess(filteredGroups));
  }
   Future<void> addstudent(StudentModel student) async{
    emit(AddStudentLoading(state.student));
    try{
      final studentBox = BoxManager.instance.studentBox;
      student.idgroup = studentBox.length + 1;
      await studentBox.add(student);
      fetchAllstudents(student.idgroup);
    }catch(e){
      emit(AddStudentFailure(e.toString(), state.student));
    }

  }


}





  // addgroup(GroupModel group) async {
  //   emit(AddStudentLoading());
  //   try {
  //     var notesBox = Hive.box<GroupModel>('groupbox');
  //     group.id = notesBox.length + 1;
  //     await notesBox.add(group);
  //     emit(AddStudentSuccess());
  //   } catch (e) {
  //     emit(AddStudentFailure(e.toString()));
  //   }
  // }

  // addstudent(StudentModel student) async {
  //   emit(AddStudentLoading());
  //   try {
  //     var studentBox = Hive.box<StudentModel>('studentbox');
  //     await studentBox.add(student);
  //     emit(AddStudentSuccess());
  //   } catch (e) {
  //     emit(AddStudentFailure(e.toString()));
  //   }
  // }
