import 'package:flutter/material.dart';
import 'package:nmg/common/constant/string.dart';

import '../../api/service/navigation_service.dart';
import '../constant/app_utils.dart';
import '../locator/locator.dart';
import '../router/router.gr.dart';

Future<bool> showExitPopup(context) async {
      return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(StringControl.exitApp),
          content: const Text(StringControl.exitTag),
          actions:[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child:const Text(StringControl.no),
            ),

            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child:const Text(StringControl.yes),
            ),

          ],
        ),
      )??false;
    }