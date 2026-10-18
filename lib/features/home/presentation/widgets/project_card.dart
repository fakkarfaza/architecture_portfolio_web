import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    super.key,
    required this.title,
    required this.category,
    required this.year,
    this.imagePath,
    this.onTap,
  });

  final String title;
  final String category;
  final String year;
  final String? imagePath;
  final VoidCallback? onTap;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AnimatedScale(
                      duration: const Duration(
                        milliseconds: 400,
                      ),
                      curve: Curves.easeOut,
                      scale: _isHovered ? 1.05 : 1,
                      child: _buildImage(),
                    ),
                    AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      color: Colors.black.withValues(
                        alpha: _isHovered ? 0.25 : 0,
                      ),
                    ),
                    AnimatedOpacity(
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      opacity: _isHovered ? 1 : 0,
                      child: const Center(
                        child: Icon(
                          Icons.arrow_outward,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: AppSpacing.md,
            ),
            Text(
              widget.title,
              style: AppTextStyles.h3(context),
              softWrap: true,
            ),
            const SizedBox(
              height: AppSpacing.xs,
            ),
            Text(
              '${widget.year} · ${widget.category.toUpperCase()}',
              style: AppTextStyles.label(context),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _buildImage() {
    if (widget.imagePath != null) {
      return Image.network(
        widget.imagePath!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholder();
        },
      );
    }

    return _buildPlaceholder();
  }

  Widget _buildPlaceholder() {
    return Container(
      color: AppColors.secondaryText.withValues(alpha: 0.1),
      child: const Center(
        child: Icon(
          Icons.architecture_outlined,
          size: 48,
          color: AppColors.secondaryText,
        ),
      ),
    );
  }
}