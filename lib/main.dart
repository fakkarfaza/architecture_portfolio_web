import 'package:architecture_portfolio_web/architecture_portfolio_web_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
      const ProviderScope(
      child: ArchitecturePortfolioApp()
    )
  );
}
