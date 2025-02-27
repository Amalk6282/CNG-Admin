import 'package:cng_admin/features/login/login_page.dart';
import 'package:cng_admin/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Supabase.initialize(
      url: 'https://ldobecfjsounhjluennl.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxkb2JlY2Zqc291bmhqbHVlbm5sIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczMjg1NzA5OCwiZXhwIjoyMDQ4NDMzMDk4fQ.dN0p9ISu8IRcbIj34oHFB5d7aGyTB1kG17wHaEIcSX4');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Login',
      theme: appTheme,
      home: LoginPage(),
    );
  }
}
