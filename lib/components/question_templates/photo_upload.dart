import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';

import 'package:flutter_svg/flutter_svg.dart';


class FileUpload extends StatefulWidget {
  final data;
  final question;
  const FileUpload({super.key, this.data, this.question});

  @override
  State<FileUpload> createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  final _storage = const FlutterSecureStorage();
  late List<CameraDescription> _cameras;
  late CameraController _cameraController;
  File? galleryPhoto;
  XFile? takenPhoto;
  bool showCameraOptionPopup = false;

  Future pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(image == null) return;

      // TODO: change key to be passed in from parent to allow
      // uploading files in the future.
      await _storage.write(key: "photoPath", value: image.path);

      final selected = File(image.path);
      setState(() {
        galleryPhoto = selected;
        showCameraOptionPopup = false;
      });
    } on PlatformException catch(e) {
    //  TODO: Handle exception.
    }
  }

  Future<void> displayCameraOptionPopup() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Take a Photo'),
              onPressed: activateCamera,
            ),
            TextButton(
              child: const Text('Pick From Gallery'),
              onPressed: pickImageFromGallery,
            ),
          ],
        );
      },
    );
  }

  /// Returns a suitable camera icon for [direction].
  IconData getCameraLensIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.back:
        return Icons.camera_rear;
      case CameraLensDirection.front:
        return Icons.camera_front;
      case CameraLensDirection.external:
        return Icons.camera;
      default:
        throw ArgumentError('Unknown lens direction');
    }
  }

  Future<void> _readAll() async {
    String? readFile = await _storage.read(key: "photoPath");
    galleryPhoto = jsonDecode(readFile!);
  }

  Future<void> activateCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    _cameras = await availableCameras();
    _cameraController = CameraController(
        _cameras[0],
        ResolutionPreset.max,
        enableAudio: false
    );
    _cameraController.initialize().then((_) {
      setState(() {
        showCameraOptionPopup = false;
      });
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print(e.description);
            break;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _readAll();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if(mounted && _cameraController.value.isInitialized) {
    //   return CameraPreview(_cameraController);
    // }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 80,
              child: Text(
                widget.question,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    fontFamily: 'Nunito',
                    color: Color(0xFF082844)
                ),
              )),
          Align(
            alignment: Alignment.center,
            child: RawMaterialButton(
              onPressed: displayCameraOptionPopup,
              child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: widget.data['palette']['primary'][1],
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(3),
                  child: galleryPhoto?.path != null
                      ? Stack(
                    children: [
                      Positioned(
                          top: 0, bottom: 0, left: 0, right: 0,
                          child: Image(
                            fit: BoxFit.cover,
                            image: FileImage(File(galleryPhoto?.path ?? ""))
                          )
                      ),
                      Positioned(
                        top: -5, right: -5,
                        child:  Container(
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF7F7F8),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(13),
                          child: SvgPicture.asset(
                            'assets/images/backArrow.svg',
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ),)

                    ],
                  )
                      : UploadIcon()
              ),
            ),
          )
        ],
      ),
    );
  }

  Stack UploadIcon() {
    return Stack(
      children: [
        Positioned(
            top: 0, bottom: 0, left: 0, right: 0,
            child: Container(
              height: 20,
              width: 20,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                //
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SvgPicture.asset(
                'assets/images/photoUpload.svg',
                color: widget.data['lineColor'],
              ),
            )
        ),
        Positioned(
            right: 10,
            bottom: 10,
            child: Container(
              width: 50,
              height: 50,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: widget.data['palette']['quarternary'],
                ),
              ),
              child: RawMaterialButton(
                  onPressed: displayCameraOptionPopup,
                  child: const Text(
                    '+',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  )
              ),
            )
        )
      ],
    );
  }
}
