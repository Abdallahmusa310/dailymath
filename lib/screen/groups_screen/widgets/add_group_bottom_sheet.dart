import 'package:dialymath/screen/groups_screen/widgets/add_group_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/group_cubit.dart';

class AddGroupBottomSheet extends StatefulWidget {
  const AddGroupBottomSheet({super.key, required this.day});
  final int day;
  @override
  State<AddGroupBottomSheet> createState() => _AddGroupBottomSheetState();
}

class _AddGroupBottomSheetState extends State<AddGroupBottomSheet> {
  @override
  Widget build(BuildContext context) {
    // TODO: Here we removed the bloc provider because
    // TODO: there is already a provider provided on top of main
    return BlocConsumer<GroupCubit, GroupState>(
      listener: (context, state) {
        switch (state) {
          case GroupFailure():
            print('faield${state.error}');

            //TODO implement toast error
            break;

          case GroupSuccess():
            Navigator.pop(context);
            break;

          default:
            break;
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
            absorbing: state is GroupLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                  child: AddGroupForm(
                day: widget.day,
              )),
            ));
      },
    );
  }
}

//                bottom: MediaQuery.of(context).viewInsets.bottom
