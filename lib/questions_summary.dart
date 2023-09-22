import 'package:flutter/material.dart';
import 'package:quiz/summary_item.dart';

class QuestionsSammary extends StatelessWidget {
  const QuestionsSammary(this.data, {super.key});

  final List<Map<String, Object>> data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: data.map(
            (data) {
              return summaryItem(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
