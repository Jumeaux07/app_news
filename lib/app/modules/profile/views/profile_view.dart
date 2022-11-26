import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final ProfileController _profileController = Get.find<ProfileController>();
  final bool change=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileView'),
        centerTitle: true,
      ),
      body:SettingsList(
              sections: [
                SettingsSection(
                  title: Text("Paramettre du compte"),
                  tiles: [
                    SettingsTile(
                      leading: Icon(Icons.language),
                      title: Text("Langue"),
                      description: Text("Français"),
                    ),
                    SettingsTile(
                      leading: Icon(Icons.dark_mode_outlined),
                      title: Text("Mode nuit"),
                      trailing: Icon(Icons.dark_mode),
                      onPressed: (context) {
                        Get.changeTheme(ThemeData.dark());
                      },
                    ),
                    SettingsTile(
                      leading: Icon(Icons.light_mode_outlined),
                      title: Text("Mode claire"),
                      trailing: Icon(Icons.light_mode),
                      onPressed: (context) {
                        Get.changeTheme(ThemeData.light());
                      },
                    ),
            ],
          ),
        ]
      ),
    );
  }
}
