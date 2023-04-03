import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/pertemuan05/pertemuan05_provider.dart';
import 'package:flutter_application_1/pertemuan05/Pertemuan05_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Tambahkan provider disini!
        ChangeNotifierProvider(create: (_) => Pertemuan05Provider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.purple),
        home: const Pertemuan05Screen(),
      ),
    );
  }
}
