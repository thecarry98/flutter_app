import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirstBranch extends StatelessWidget {
  const FirstBranch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('First Branch'),
      ),
    );
  }
}
