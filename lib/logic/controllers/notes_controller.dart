import 'package:get/get.dart';

import '../../model/notes_model.dart';

class NoteController extends GetxController{
  final notes = <Note>[].obs;
  final isLoading = false.obs;
  
}