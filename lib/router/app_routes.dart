class AppRoutes {
  AppRoutes._();

  static const home = '/';

  static const about = '/about';
  static const contact = '/contact';
  static const projects = '/projects';
  static const projectDetail = '/projects/:slug';
  static String projectDetailPath(String slug) {
    return '/projects/$slug';
  }
}