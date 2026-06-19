import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';
import 'package:graduationproject/features/patient/model/Custom_Sesson_Item_Model.dart';
import 'package:graduationproject/features/patient/presentation/cubit/session_Screen/cubit/session_screen_cubit.dart';
import 'package:graduationproject/features/patient/presentation/cubit/session_Screen/cubit/session_screen_state.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Session/Custom_Filter_Chip.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Session/Custom_Search_Bar.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Session/Custom_Session_Item_Card.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Session/Custom_Toggle_Button.dart';

class PatientSession extends StatelessWidget {
  PatientSession({super.key});

  final List<SessionItemModel> dummyData = [
    // ---------------- Doctors ----------------
    SessionItemModel(
      id: '1',
      type: SessionItemType.doctor,
      imageUrl: Assets.imagesDoctoratefbasem, // TODO: إضافة مسار الصورة
      title: 'DR. Atef Basm',
      subtitle: 'Oncologist | Gamaa Hospital',
      rating: 4.5,
      reviewsCount: 2500,
    ),
    SessionItemModel(
      id: '2',
      type: SessionItemType.doctor,
      imageUrl: Assets.imagesDoctorahemdmohammed, // TODO: إضافة مسار الصورة
      title: 'DR. Ahmed mohamed',
      subtitle: 'Nutritionist | Gamaa Hospital',
      rating: 4.2,
      reviewsCount: 1800,
    ),
    SessionItemModel(
      id: '3',
      type: SessionItemType.doctor,
      imageUrl: Assets.imagesDoctorbasmaatef, // TODO: إضافة مسار الصورة
      title: 'DR. Basma Atef',
      subtitle: 'Oncologist | Gamaa Hospital',
      rating: 4.5,
      reviewsCount: 2500,
    ),
    SessionItemModel(
      id: '4',
      type: SessionItemType.doctor,
      imageUrl: Assets.imagesAmirsaad, // TODO: إضافة مسار الصورة
      title: 'DR. Amir Saad',
      subtitle: 'Nutritionist | Gamaa Hospital',
      rating: 4.2,
      reviewsCount: 1800,
    ),
    SessionItemModel(
      id: '4',
      type: SessionItemType.doctor,
      imageUrl: 'https://via.placeholder.com/150', // TODO: إضافة مسار الصورة
      title: 'DR. Islam Mohammed',
      subtitle: 'Nutritionist | Gamaa Hospital',
      rating: 4.2,
      reviewsCount: 1800,
    ),
    // ---------------- Events ----------------
    SessionItemModel(
      id: '5',
      type: SessionItemType.event,
      imageUrl: Assets.imagesSessiononephoto, // TODO: إضافة مسار الصورة
      title: 'Survivors support group',
      subtitle: 'Mansoura | Thursday, 12/5',
      hostName: 'Hosted by: Dr Ahmed Atef',
    ),
    SessionItemModel(
      id: '6',
      type: SessionItemType.event,
      imageUrl: Assets.imagesSessiontwophoto, // TODO: إضافة مسار الصورة
      title: 'Mental health session',
      subtitle: 'Online | Thursday, 12/5',
      hostName: 'Hosted by: Dr Ahmed Atef',
    ),
    SessionItemModel(
      id: '7',
      type: SessionItemType.event,
      imageUrl: Assets.imagesMindfuless, // TODO: إضافة مسار الصورة
      title: 'Mindfulness & Meditation',
      subtitle: 'Mansoura | Thursday, 12/5',
      hostName: 'Hosted by: Dr Ahmed Atef',
    ),
    SessionItemModel(
      id: '8',
      type: SessionItemType.event,
      imageUrl: 'https://via.placeholder.com/150', // TODO: إضافة مسار الصورة
      title: 'Nutrition',
      subtitle: 'Online | Thursday, 12/5',
      hostName: 'Hosted by: Dr Ahmed Atef',
    ),

    SessionItemModel(
      id: '9',
      type: SessionItemType.event,
      imageUrl: 'https://via.placeholder.com/150', 
      title: 'Art Therapy Workshop', // 🌟 اسم جديد بدل الـ Nutrition المتكررة
      subtitle: 'Alexandria | Saturday, 14/5',
      hostName: 'Hosted by: Dr Mona Ali',
    ),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 30,
                        child: SvgPicture.asset(
                          Assets.imagesPerson,
                          height: 45,
                          width: 45,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const CustomWelcomeTextWidget(
                        text: "Community",
                        size: 24,
                        fontWeight: FontWeight.w500,
                        color: MyColors.mainColor,
                      ),
                    ],
                  ),

                  BlocBuilder<SessionsCubit, SessionsState>(
                    builder: (context, state) {
                      return Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.pink.shade50,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          children: [
                            CustomToggleButton(
                              title: "Doctors",
                              isActive: state.isDoctorsTab,
                              onTap: () {
                                context.read<SessionsCubit>().changeTab(true);
                              },
                            ),
                            CustomToggleButton(
                              title: "Events",
                              isActive: !state.isDoctorsTab,
                              onTap: () {
                                context.read<SessionsCubit>().changeTab(false);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 3. الـ Search و Filters
              const CustomSearchBar(),
              const SizedBox(height: 16),

              // رجعنا الـ Row عشان يعرض الفلتر والترتيب زي الديزاين
              Row(
                children: [
                  const CustomFilterChip(label: "Filter"),
                  const SizedBox(width: 8),
                  const CustomFilterChip(label: "Sort"),
                  const Spacer(),
                  Text(
                    "185 Results",
                    style: TextStyle(
                      color: Colors.pink.shade200,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // 4. اللستة اللي بتتغير
              Expanded(
                child: BlocBuilder<SessionsCubit, SessionsState>(
                  builder: (context, state) {
                    final currentList = dummyData
                        .where(
                          (item) => state.isDoctorsTab
                              ? item.type == SessionItemType.doctor
                              : item.type == SessionItemType.event,
                        )
                        .toList();

                    return ListView.builder(
                      itemCount: currentList.length,
                      itemBuilder: (context, index) {
                        return SessionItemCard(item: currentList[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
