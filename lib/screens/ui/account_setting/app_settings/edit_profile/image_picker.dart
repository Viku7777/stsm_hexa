
import 'package:image_picker/image_picker.dart';

Future<XFile?>imagePicker()async{
XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

if(image != null){
  return image;
}else{
  throw Exception("Image not Picked");
}

}