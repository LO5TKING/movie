import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeController extends GetxController {
  final _isDarkMode = false.obs;

  bool get isDarkMode => _isDarkMode.value;

  @override
  void onInit() {
    super.onInit();
    loadThemeFromStorage();
    // Initialize with system theme
    _isDarkMode.value = Get.isDarkMode;
  }

  Future<void> loadThemeFromStorage() async {
    final box = await Hive.openBox('settings');
    _isDarkMode.value = box.get('isDarkMode', defaultValue: Get.isDarkMode);
  }

  void toggleTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    // Save the theme preference asynchronously
    Hive.openBox('settings').then((box) {
      box.put('isDarkMode', _isDarkMode.value);
    });
  }
}