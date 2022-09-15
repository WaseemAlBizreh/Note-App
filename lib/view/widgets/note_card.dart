import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/view/widgets/text_utils.dart';

import '../../model/notes_model.dart';

class NoteCardWidget extends StatelessWidget {
  final Note note;
  final int index;
  final _lightColors = [
    Colors.amber.shade300,
    Colors.lightGreen.shade300,
    Colors.lightBlue.shade300,
    Colors.orange.shade300,
    Colors.pinkAccent.shade100,
    Colors.tealAccent.shade100
  ];

  NoteCardWidget({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _lightColors[index],
      elevation: 0,
      child: ClipRRect(
        child: Material(
          child: InkWell(
            onTap: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextUtils(
                  text: note.title,
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
