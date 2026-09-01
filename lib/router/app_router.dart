import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:architecture_portfolio_web/features/contact/presentation/contact_page.dart';
import 'package:architecture_portfolio_web/features/home/presentation/home_page.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/project_detail_page.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/projects_page.dart';
import 'package:architecture_portfolio_web/router/app_routes.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) {
          return const HomePage();
        }
      ),
      GoRoute(
        path: AppRoutes.projects,
        builder: (context, state) {
          return const ProjectsPage();
        },
      ),
      GoRoute(
        path: AppRoutes.projectDetail,
        builder: (context, state) {
          final slug = state.pathParameters['slug']!;

          return ProjectDetailPage(slug: slug);
        },
      ),
      GoRoute(
        path: AppRoutes.contact,
        builder: (context, state) {
          return const ContactPage();
        },
      ),
    ],

    errorBuilder: (context, state) {
      return Scaffold(
        body: Center(
          child: Text(
            'Page not found: ${state.uri}'
          ),
        ),
      );
    },
  );
}