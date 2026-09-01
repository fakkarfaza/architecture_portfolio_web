import 'package:flutter/material.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({
    super.key,
    required this.slug,
  });

  final String slug;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'PROJECT DETAIL: $slug',
        ),
      ),
    );
  }
}