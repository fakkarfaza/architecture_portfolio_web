import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id')
  ];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'HOME'**
  String get home;

  /// No description provided for @projects.
  ///
  /// In en, this message translates to:
  /// **'PROJECTS'**
  String get projects;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'ABOUT'**
  String get about;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'CONTACT'**
  String get contact;

  /// No description provided for @architecturePortfolio.
  ///
  /// In en, this message translates to:
  /// **'ARCHITECTURE PORTFOLIO'**
  String get architecturePortfolio;

  /// No description provided for @heroTitle.
  ///
  /// In en, this message translates to:
  /// **'DESIGNING SPACES\nTHAT INSPIRE.'**
  String get heroTitle;

  /// No description provided for @heroDescription.
  ///
  /// In en, this message translates to:
  /// **'Architecture is more than creating buildings. It is about designing spaces that connect people, nature, and experiences.'**
  String get heroDescription;

  /// No description provided for @scrollToExplore.
  ///
  /// In en, this message translates to:
  /// **'SCROLL TO EXPLORE'**
  String get scrollToExplore;

  /// No description provided for @featuredProjects.
  ///
  /// In en, this message translates to:
  /// **'FEATURED PROJECTS'**
  String get featuredProjects;

  /// No description provided for @viewProject.
  ///
  /// In en, this message translates to:
  /// **'VIEW PROJECT'**
  String get viewProject;

  /// No description provided for @designProcess.
  ///
  /// In en, this message translates to:
  /// **'DESIGN PROCESS'**
  String get designProcess;

  /// No description provided for @siteAnalysis.
  ///
  /// In en, this message translates to:
  /// **'SITE ANALYSIS'**
  String get siteAnalysis;

  /// No description provided for @massingDevelopment.
  ///
  /// In en, this message translates to:
  /// **'MASSING DEVELOPMENT'**
  String get massingDevelopment;

  /// No description provided for @visualization.
  ///
  /// In en, this message translates to:
  /// **'VISUALIZATION'**
  String get visualization;

  /// No description provided for @aboutHeadline.
  ///
  /// In en, this message translates to:
  /// **'ARCHITECTURE IS NOT JUST\nABOUT BUILDINGS.\nIT IS ABOUT PEOPLE.'**
  String get aboutHeadline;

  /// No description provided for @aboutHeroDescription.
  ///
  /// In en, this message translates to:
  /// **'I believe architecture has the power to shape how people live, interact, and experience the world around them.'**
  String get aboutHeroDescription;

  /// No description provided for @education.
  ///
  /// In en, this message translates to:
  /// **'EDUCATION'**
  String get education;

  /// No description provided for @educationPeriod.
  ///
  /// In en, this message translates to:
  /// **'2021 - 2025'**
  String get educationPeriod;

  /// No description provided for @educationDegree.
  ///
  /// In en, this message translates to:
  /// **'Bachelor of Architecture'**
  String get educationDegree;

  /// No description provided for @educationUniversity.
  ///
  /// In en, this message translates to:
  /// **'Universitas Indonesia'**
  String get educationUniversity;

  /// No description provided for @experience.
  ///
  /// In en, this message translates to:
  /// **'EXPERIENCE'**
  String get experience;

  /// No description provided for @experiencePeriodOne.
  ///
  /// In en, this message translates to:
  /// **'2024'**
  String get experiencePeriodOne;

  /// No description provided for @experienceTitleOne.
  ///
  /// In en, this message translates to:
  /// **'Architecture Intern'**
  String get experienceTitleOne;

  /// No description provided for @experienceCompanyOne.
  ///
  /// In en, this message translates to:
  /// **'ABC Architecture Studio'**
  String get experienceCompanyOne;

  /// No description provided for @experienceDescriptionOne.
  ///
  /// In en, this message translates to:
  /// **'Assisted concept development'**
  String get experienceDescriptionOne;

  /// No description provided for @experienceDescriptionTwo.
  ///
  /// In en, this message translates to:
  /// **'Created 3D models and renderings'**
  String get experienceDescriptionTwo;

  /// No description provided for @experiencePeriodTwo.
  ///
  /// In en, this message translates to:
  /// **'2023'**
  String get experiencePeriodTwo;

  /// No description provided for @experienceTitleTwo.
  ///
  /// In en, this message translates to:
  /// **'Student Committee'**
  String get experienceTitleTwo;

  /// No description provided for @experienceCompanyTwo.
  ///
  /// In en, this message translates to:
  /// **'Architecture Exhibition'**
  String get experienceCompanyTwo;

  /// No description provided for @experienceDescriptionThree.
  ///
  /// In en, this message translates to:
  /// **'Event planning and coordination'**
  String get experienceDescriptionThree;

  /// No description provided for @experienceDescriptionFour.
  ///
  /// In en, this message translates to:
  /// **'Exhibition design and layout'**
  String get experienceDescriptionFour;

  /// No description provided for @skills.
  ///
  /// In en, this message translates to:
  /// **'SKILLS'**
  String get skills;

  /// No description provided for @designSkills.
  ///
  /// In en, this message translates to:
  /// **'DESIGN SKILLS'**
  String get designSkills;

  /// No description provided for @interiorDesign.
  ///
  /// In en, this message translates to:
  /// **'Interior Design'**
  String get interiorDesign;

  /// No description provided for @urbanDesign.
  ///
  /// In en, this message translates to:
  /// **'Urban Design'**
  String get urbanDesign;

  /// No description provided for @landscapeDesign.
  ///
  /// In en, this message translates to:
  /// **'Landscape Design'**
  String get landscapeDesign;

  /// No description provided for @sustainableDesign.
  ///
  /// In en, this message translates to:
  /// **'Sustainable Design'**
  String get sustainableDesign;

  /// No description provided for @softwareSkills.
  ///
  /// In en, this message translates to:
  /// **'SOFTWARE SKILLS'**
  String get softwareSkills;

  /// No description provided for @autoCad.
  ///
  /// In en, this message translates to:
  /// **'AutoCAD'**
  String get autoCad;

  /// No description provided for @revit.
  ///
  /// In en, this message translates to:
  /// **'Revit'**
  String get revit;

  /// No description provided for @sketchup.
  ///
  /// In en, this message translates to:
  /// **'SketchUp'**
  String get sketchup;

  /// No description provided for @lumion.
  ///
  /// In en, this message translates to:
  /// **'Lumion'**
  String get lumion;

  /// No description provided for @enscape.
  ///
  /// In en, this message translates to:
  /// **'Enscape'**
  String get enscape;

  /// No description provided for @photoshop.
  ///
  /// In en, this message translates to:
  /// **'Photoshop'**
  String get photoshop;

  /// No description provided for @rhino.
  ///
  /// In en, this message translates to:
  /// **'Rhino'**
  String get rhino;

  /// No description provided for @aboutMe.
  ///
  /// In en, this message translates to:
  /// **'ABOUT ME'**
  String get aboutMe;

  /// No description provided for @helloIm.
  ///
  /// In en, this message translates to:
  /// **'Hello, I\'m'**
  String get helloIm;

  /// No description provided for @architectName.
  ///
  /// In en, this message translates to:
  /// **'YOUR NAME'**
  String get architectName;

  /// No description provided for @architectRole.
  ///
  /// In en, this message translates to:
  /// **'Architecture Graduate'**
  String get architectRole;

  /// No description provided for @aboutBiography.
  ///
  /// In en, this message translates to:
  /// **'I am a fresh architecture graduate passionate about designing functional, meaningful, and sustainable spaces. I enjoy exploring ideas through design, visualization, and creative solutions that improve people\'s lives.'**
  String get aboutBiography;

  /// No description provided for @profileLocation.
  ///
  /// In en, this message translates to:
  /// **'Bandung, Indonesia'**
  String get profileLocation;

  /// No description provided for @profileEmail.
  ///
  /// In en, this message translates to:
  /// **'your.email@gmail.com'**
  String get profileEmail;

  /// No description provided for @profilePhone.
  ///
  /// In en, this message translates to:
  /// **'+62 812 3456 7890'**
  String get profilePhone;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'id': return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
