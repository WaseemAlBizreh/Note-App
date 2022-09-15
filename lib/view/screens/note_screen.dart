import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../logic/controllers/notes_controller.dart';
import '../../view/widgets/note_card.dart';
import '../../view/widgets/text_utils.dart';

class NoteScreenView extends StatelessWidget {
  final controller = Get.find<NoteController>();

  NoteScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextUtils(
          text: "Notes",
          fontSize: 16.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: controller.isLoading.value
            ? const CircularProgressIndicator()
            : _noteBuilder(),
      ),
    );
  }

  Widget _noteBuilder() {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemCount: controller.notes.length,
      itemBuilder: (context, index) {
        return NoteCardWidget(
          note: controller.notes[index],
          index: index,
        );
      },
    );
  }
}
