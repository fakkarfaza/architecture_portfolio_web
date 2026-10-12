import 'dart:convert';

import 'package:architecture_portfolio_web/core/network/api_client.dart';
import 'package:architecture_portfolio_web/features/about/data/model/profile_model.dart';


class ProfileService {
  Future<ProfileModel> getProfile(String locale) async {
    final response = await ApiClient.get(
      '/api/profile?locale=$locale',
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load profile');
    }

    final data = jsonDecode(response.body);

    return ProfileModel.fromJson(data['data']);
  }
}