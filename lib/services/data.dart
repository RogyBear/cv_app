import 'dart:convert';

import 'package:cv_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Data extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  Map progress = {
    // Resume Vars
    basicInfo: 0,
    education: 0,
    work: 0,
    portfolio: 0,
    skills: 0,
    achievements: 0,
    // Cover Letter Vars
    title: 0,
    contents: 0,
    signature: 0
  };
  void getProgress() async {
    await storage.deleteAll();
    String? value = await storage.read(key: 'progress');

    if (value == null) {
      await storage.write(key: 'progress', value: jsonEncode(progress));
      value = await storage.read(key: 'progress');
    }
    progress = jsonDecode(value!);
    notifyListeners();
  }

  void updateProgress(String sectionKey, dynamic step) async {
    // print(sectionKey);
    // print(step);
    // print(questionLength);
    // await storage.deleteAll();
    /*
    *
    * 1. get the key from the section
    *
    * 2. pass in value (+ or -) for the value to be updated in storage
    *
    * 3. update the storage at the specific key
    *
    * */

    // 1

    // 2

    // if (value == null) {
    //   await storage.write(key: 'progress', value: jsonEncode(progress));
    //   value = await storage.read(key: 'progress');
    // }

    // 3
    String? value = await storage.read(key: 'progress');

    progress = jsonDecode(value!);
    progress[sectionKey] = step;
    await storage.write(key: 'progress', value: jsonEncode(progress));
    notifyListeners();

    // print(tempProgress);
  }
}
