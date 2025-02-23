import 'package:csi_app/pages/mobile/others/events/allEvents.dart';
import 'package:csi_app/pages/mobile/tabs/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: "/",
      // onGenerateInitialRoutes: (settings) => ,
      home: Allevents(),
    );
  }
}
