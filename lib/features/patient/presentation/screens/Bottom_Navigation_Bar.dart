import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/core/routes/appRoutes.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/patient/presentation/cubit/BottomBar/bottom_bar_cubit.dart';
import 'package:graduationproject/features/patient/presentation/cubit/BottomBar/bottom_bar_state.dart';
import 'package:graduationproject/features/patient/presentation/screens/Patient_Home.dart';
import 'package:graduationproject/features/patient/presentation/screens/Patient_Medical_Summary.dart';
import 'package:graduationproject/features/patient/presentation/screens/Patient_Session.dart';
import 'package:graduationproject/features/patient/presentation/screens/Patinet_Community.dart';

class MainNavigationBar extends StatelessWidget {
  MainNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit, BottomBarState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.currentIndex,
            children: [
              PatientHomePage(),
              PatientMedicalSummary(),
              PatientCommunity(),
              PatientSession(),
            ],
          ),

          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: state.currentIndex,
            onTap: (value) {
              context.read<BottomBarCubit>().setIndex(value);
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  state.currentIndex == 0
                      ? Assets.imagesHomeFilled
                      : Assets.imagesHomeNonFilled,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  state.currentIndex == 1
                      ? Assets.imagesMedicalSummaryFilled
                      : Assets.imagesMedicalSummaryNonFilled,
                ),
                label: 'Medical Summary',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  state.currentIndex == 2
                      ? Assets.imagesCommunityFilled
                      : Assets.imagesCommunityNonFilled,
                ),
                label: 'Community',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  state.currentIndex == 3
                      ? Assets.imagesSessionFilled
                      : Assets.imagesSessionNonFilled,
                ),
                label: 'Session',
              ),
            ],
          ),
          floatingActionButton: state.currentIndex != 2
              ? FloatingActionButton(
                  shape: const CircleBorder(),
                  backgroundColor: MyColors.whiteColor,
                  onPressed: () {
                    (context).push(AppRoutes.chatBot);
                  },
                  child: SvgPicture.asset(Assets.imagesChatbotLogo),
                )
              : null,
        );
      },
    );
  }
}
