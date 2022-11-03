import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/pages/page_branch1.dart';
import 'package:flutter_app/pages/page_branch2.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeBranch1(),
        HomeBranch2(),
      ],
    );
  }
}
