import 'dart:typed_data';
import 'package:chat_app/services/fire%20store/store_api_helper.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../declare_controller.dart';

class SendImageController extends GetxController {
  String clientID = 'e9fe7336bfdaa03';
  String clientSecret = '314f85d201e61fa7794397964f45b0d35d513f50';
  String url = "";

  Future<void> imagePicker() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? xFile = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    Uint8List image = await xFile!.readAsBytes();
    url = await ApiHelper.apiHelper.imageUpload(image: image) ?? "";
  }
}
