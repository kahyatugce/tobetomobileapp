import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/widgets/global_widgets/appBar_logo.dart';
import 'package:tobetomobileapp/widgets/edit_profile_screen_widgets/profile_tab/tab1_person_info.dart';
import 'package:tobetomobileapp/widgets/edit_profile_screen_widgets/profile_tab/tab2_experiences.dart';
import 'package:tobetomobileapp/widgets/edit_profile_screen_widgets/profile_tab/tab3_edu_life.dart';
import 'package:tobetomobileapp/widgets/edit_profile_screen_widgets/profile_tab/tab4_competencies.dart';
import 'package:tobetomobileapp/widgets/edit_profile_screen_widgets/profile_tab/tab5_certificates.dart';
import 'package:tobetomobileapp/widgets/edit_profile_screen_widgets/profile_tab/tab6_media.dart';
import 'package:tobetomobileapp/widgets/edit_profile_screen_widgets/profile_tab/tab7_foreign_lang.dart';
import 'package:tobetomobileapp/widgets/edit_profile_screen_widgets/profile_tab/tab8_settings.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late String assetImage;
  late Brightness brightness;
  Color textColor = Colors.white;
  Color backgroundColor = Colors.black;
  late Color containerColor = Colors.black;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    brightness = MediaQuery.of(context).platformBrightness;

    if (brightness == Brightness.dark) {
      assetImage = 'assets/images/tobeto-logo.png';
      textColor = Colors.white;
      backgroundColor = Colors.black;
      containerColor = Colors.grey.withOpacity(0.1);
    } else {
      assetImage = 'assets/images/tobeto-logo.png';
      textColor = Colors.black;
      backgroundColor = Colors.white;
      containerColor = backgroundColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorTab = TobetoColor();
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: AppBarLogo(brightness: brightness),
          bottom: TabBar(tabs: [
            Tab(
                icon: Icon(
              Icons.person_outlined,
              color: colorTab.iconColor,
            )),
            Tab(
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: colorTab.iconColor,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.menu_book_sharp,
                color: colorTab.iconColor,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.school_rounded,
                color: colorTab.iconColor,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.workspace_premium_outlined,
                color: colorTab.iconColor,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.language,
                color: colorTab.iconColor,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.translate,
                color: colorTab.iconColor,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.settings_suggest_outlined,
                color: colorTab.iconColor,
              ),
            ),
          ]),
        ),
        body: const TabBarView(children: [
          ProfileTabPersonalInfo(),
          ProfileTabExperiences(),
          ProfileTabEduLife(),
          ProfileTabCompetencies(),
          ProfileTabCertificates(),
          ProfileTabMedia(),
          ProfileTabForeignLang(),
          ProfileTabSettings(),
        ]),
      ),
    );
  }
}
