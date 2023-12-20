import 'package:image_picker/image_picker.dart';

Future<XFile?> imagePicker() async {
  XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (image != null) {
    return image;
  } else {
    throw Exception("Image not Picked");
  }
}

String dummyImage =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTzlByyD8eELhFMr-5Fj1kqEWM79ACOxH4dM-4TXhEZAvVVcXsvETEJ8eYOf-frYY6udE&usqp=CAU";
