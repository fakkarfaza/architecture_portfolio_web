import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/constants/app_sizes.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:architecture_portfolio_web/features/home/presentation/widgets/app_footer.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/widgets/project_detail_concept_section.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/widgets/project_detail_brief_section.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/widgets/project_detail_hero_section.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/widgets/project_detail_massing_dev_section.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/widgets/project_detail_process_section.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/widgets/project_detail_site_analysis_section.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/widgets/project_detail_visualization_section.dart';
import 'package:architecture_portfolio_web/router/app_routes.dart';
import 'package:architecture_portfolio_web/shared/widgets/app_navbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({
    super.key,
    required this.slug,
  });

  final String slug;

  static const Map<String, Map<String, String>> _projects = {
    'tropical-courtyard-house': {
      'title': 'TROPICAL COURTYARD HOUSE',
      'category': 'RESIDENTIAL',
      'year': '2025',
      'location': 'BANDUNG, INDONESIA',
      'brief': 'A contemporary residential project designed to create a strong connection between everyday living and nature. The design explores how an internal courtyard can improve natural lighting, ventilation, and spatial experience.',
      'conceptTitle': 'THE CENTRAL COURTYARD',
      'concept': 'The central courtyard becomes the heart of the house. Instead of treating nature as something outside the building, the design brings landscape into the center of everyday life.',
      'processStep1Title': 'INITIAL IDEA',
      'processStep1Description':
          'The design process began by exploring how the house could establish a stronger relationship between everyday living spaces and nature.',

      'processStep2Title': 'SPATIAL EXPLORATION',
      'processStep2Description':
          'Different spatial arrangements were explored to position the courtyard as the central element connecting private and shared spaces.',

      'processStep3Title': 'DESIGN DEVELOPMENT',
      'processStep3Description':
          'The final design developed the courtyard into the heart of the project, improving natural lighting, ventilation, and spatial connection.',
      'siteAnalysisTitle': 'UNDERSTANDING THE SITE',
      'siteAnalysisDescription':
          'The site analysis focuses on understanding environmental conditions, surrounding context, and natural factors that influence the architectural response.',

      'siteClimate': 'TROPICAL',

      'siteOrientation': 'NORTH–SOUTH',

      'siteSunTitle': 'SUNLIGHT',

      'siteSunDescription':
          'The building orientation considers daily sun exposure to reduce excessive heat while allowing sufficient natural daylight into the interior spaces.',

      'siteWindTitle': 'NATURAL VENTILATION',

      'siteWindDescription':
          'Openings and circulation spaces are positioned to support cross ventilation and improve thermal comfort throughout the house.',

      'siteContextTitle': 'SURROUNDING CONTEXT',

      'siteContextDescription':
          'The surrounding residential environment influenced the scale, privacy strategy, and relationship between the building and its landscape.',
      'massingStep1Title': 'INITIAL MASS',

      'massingStep1Description':
          'The design begins with a simple building volume based on the available site and required spatial program.',

      'massingStep2Title': 'CREATE THE COURTYARD',

      'massingStep2Description':
          'A central void is introduced to bring natural light, vegetation, and ventilation into the heart of the building.',

      'massingStep3Title': 'REFINE THE FORM',

      'massingStep3Description':
          'The building volume is refined through openings, spatial connections, and environmental responses to create the final architectural form.',

      'visualizationImage1':
          'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c',

      'visualizationImage2':
          'https://images.unsplash.com/photo-1600566753086-00f18fb6b3ea',

      'visualizationImage3':
          'https://images.unsplash.com/photo-1600607687920-4e2a09cf159d',

      'visualizationImage4':
          'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
    },
    'urban-cultural-center': {
      'title': 'URBAN CULTURAL CENTER',
      'category': 'PUBLIC ARCHITECTURE',
      'year': '2024',
      'location': 'JAKARTA, INDONESIA',
    },
    'community-pavilion': {
      'title': 'COMMUNITY PAVILION',
      'category': 'COMMUNITY',
      'year': '2024',
      'location': 'BANDUNG, INDONESIA',
    },
    'coastal-retreat': {
      'title': 'COASTAL RETREAT',
      'category': 'HOSPITALITY',
      'year': '2023',
      'location': 'BALI, INDONESIA',
    },
  };

  @override
  Widget build(BuildContext context) {
    final project = _projects[slug];

    if (project == null) {
      _buildProjectNotFound(context);
    }

    return Scaffold(
      body: Column(
        children: [
          const AppNavbar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProjectDetailHeroSection(project: project!),
                  ProjectDetailBriefSection(project: project),
                  ProjectDetailConceptSection(project: project),
                  ProjectDetailDesignProcessSection(project: project),
                  ProjectDetailSiteAnalysisSection(project: project),
                  ProjectDetailMassingDevSection(project: project),
                  ProjectDetailVisualizationSection(project: project),
                  const AppFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildProjectNotFound(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'PROJECT NOT FOUND',
          style: AppTextStyles.h2(context),
        ),
      ),
    );
  }
}
