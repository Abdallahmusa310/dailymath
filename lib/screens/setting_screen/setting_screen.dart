import 'package:dialymath/notification/notification_orgnaizer.dart';
import 'package:dialymath/widgets/coustms_widgets/coustm_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settingscreen extends StatefulWidget {
  const Settingscreen({super.key});

  @override
  State<Settingscreen> createState() => _SettingscreenState();
}

class _SettingscreenState extends State<Settingscreen> {
  bool notificationsEnabled = true;
  @override
  void initState() {
    super.initState();
    loadSettings();
  }

  Future<void> loadSettings() async {
    final enabled = await NotificationSettingsHelper.getNotificationsEnabled();
    setState(() {
      notificationsEnabled = enabled;
    });
  }

  Future<void> toggleNotifications(bool value) async {
    setState(() {
      notificationsEnabled = value;
    });
    await NotificationSettingsHelper.setNotificationsEnabled(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(children: [
                Card(
                    elevation: 4,
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 100.w,
                          maxHeight: 80.h,
                        ),
                        child: Row(
                          children: [
                            const CoustmText(text: 'Allow notofications'),
                            Switch(
                                value: notificationsEnabled,
                                onChanged: toggleNotifications),
                          ],
                        )
                        //SwitchListTile(
                        //   title: const Text('تفعيل الإشعارات'),
                        //   value: _notificationsEnabled,
                        //   onChanged: _toggleNotifications,
                        // ),
                        ))
              ]),
            )
          ]),
    );
  }
}
