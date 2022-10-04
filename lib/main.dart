import 'app.dart';
import 'package:flutter/material.dart';

import 'core/utils/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const EcommerceApp());
}
