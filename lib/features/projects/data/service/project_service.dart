
import 'dart:convert';

import 'package:architecture_portfolio_web/core/network/api_client.dart';
import 'package:architecture_portfolio_web/features/projects/data/model/project_detail_model.dart';
import 'package:architecture_portfolio_web/features/projects/data/model/project_model.dart';


class ProjectService {
  Future<List<ProjectModel>> getProjects(String locale) async {
    final response = await ApiClient.get(
      '/api/projects?locale=$locale',
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load projects');
    }

    final data = jsonDecode(response.body);
    final List<dynamic> projects = data['data'];

    return projects.map((project) => ProjectModel.fromJson(
      project as Map<String, dynamic>,
    )).toList();
  }

  Future<ProjectDetailModel> getProjectBySlug(
    String slug,
    String locale,
  ) async {
    final response = await ApiClient.get(
      '/api/projects/$slug?locale=$locale',
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load project detail');
    }

    final data = jsonDecode(response.body);

    return ProjectDetailModel.fromJson(data['data']);
  }
}
