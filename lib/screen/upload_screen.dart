import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stack_food/model/upload_model.dart';
import 'package:stack_food/screen/upload/image_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String? _image;

  final List<UploadModel> uploadList = [
    UploadModel(
      id: 1,
      name: "Gourmet Kitchen",
      code: "QL9",
      icon: "assets/icon/check-circle.png",
    ),

    UploadModel(
      id: 1,
      name: "Gourmet Kitchen",
      code: "QL9",
      icon: "assets/icon/upload1.png",
    ),

    UploadModel(
      id: 1,
      name: "Gourmet Kitchen",
      code: "QL9",
      icon: "assets/icon/upload.png",
    ),

    UploadModel(
      id: 1,
      name: "Gourmet Kitchen",
      code: "QL9",
      icon: "assets/icon/upload.png",
    ),

    UploadModel(
      id: 1,
      name: "Gourmet Kitchen",
      code: "QL9",
      icon: "assets/icon/upload.png",
    ),

    UploadModel(
      id: 1,
      name: "Gourmet Kitchen",
      code: "QL9",
      icon: "assets/icon/upload.png",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: CustomScrollView(
        slivers: [
          SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
              ),
              itemCount: uploadList.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: ()async{
                    // When an item is tapped, open the camera
                    final imagePath = await getImage();
                    if (imagePath != null) {
                      // Navigate to another screen with the captured image
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageScreen(imagePath: imagePath),
                        ),
                      );
                    }
                  },
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Image.asset(uploadList[index].icon,height: 60,fit: BoxFit.fill,),
                        ),
                        Text("Code: ${uploadList[index].code}",style: TextStyle(fontSize: 15),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Code: ${uploadList[index].name}",
                            style: TextStyle(color: index==1?Color(0xffb80808):Colors.black,fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
          )
        ],
      ),
    );
  }


  Future<String?> getImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );
    if (image != null) {
      return image.path;
    }
    return null;
  }
}
