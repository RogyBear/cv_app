import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:shared_preferences/shared_preferences.dart';


class FileUpload extends StatefulWidget {
  final data;
  final question;
  const FileUpload({super.key, this.data, this.question});

  @override
  State<FileUpload> createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  final _storage = const FlutterSecureStorage();
  File? file;

  Future pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(image == null) return;

      // TODO: change key to be passed in from parent to allow
      // uploading files in the future.
      await _storage.write(key: "photoPath", value: image.path);

      final selected = File(image.path);
      setState(() => file = selected);
    } on PlatformException catch(e) {
    //  TODO: Handle exception.
    }
  }

  Future<void> _readAll() async {
    String? readFile = await _storage.read(key: "photoPath");
    file = jsonDecode(readFile!);
  }

  @override
  void initState() {
    super.initState();
    _readAll();
  }

  @override
  Widget build(BuildContext context) {
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
              onPressed: pickImageFromGallery,
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
                  child: file?.path != null
                      ? Stack(
                    children: [
                      Positioned(
                          top: 0, bottom: 0, left: 0, right: 0,
                          child: Image(
                            fit: BoxFit.cover,
                            image: FileImage(File(file?.path ?? ""))
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
                              onPressed: pickImageFromGallery,
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
