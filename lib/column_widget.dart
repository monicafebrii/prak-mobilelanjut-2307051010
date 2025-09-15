import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Column')),
      body: const Column(
        children: [
          Text('Ilmu Komputer'),
          Text('FMIPA'),
          Text('Universitas Lampung'),
          Text('2025'),
        ],
      ),
    );
  }
}