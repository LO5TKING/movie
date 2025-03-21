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
  }

  Future<void> loadThemeFromStorage() async {
    final box = await Hive.openBox('settings');
    _isDarkMode.value = box.get('isDarkMode', defaultValue: true);
  }

  Future<void> toggleTheme() async {
    _isDarkMode.value = !_isDarkMode.value;
    final box = await Hive.openBox('settings');
    await box.put('isDarkMode', _isDarkMode.value);
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}