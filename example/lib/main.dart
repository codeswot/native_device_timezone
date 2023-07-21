import 'package:flutter/material.dart';
import 'package:native_device_timezone/native_device_timezone.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: FutureBuilder<String?>(
            future: NativeDeviceTimezone.timezoneName,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}\n'),
                );
              }
              final timezone = snapshot.data;
              return Center(
                child: Text('Timezone is: $timezone\n'),
              );
            }),
      ),
    );
  }
}
