// lib/main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TELECRIS',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Scaffold(body: Center(child: Text('Bem-vindo à Telecris!'))),
    );
  }
}



name: Dart CI

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.13.0'
        
    - name: Install dependencies
      run: |
        flutter pub get
        flutter pub upgrade
        
    - name: Analyze code
      run: flutter analyze
      
    - name: Run tests
      run: flutter test
      
    - name: Build Android
      run: flutter build apk --release
      
    - name: Build iOS (simulator)
      run: flutter build ios --simulator --release
