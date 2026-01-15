import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/Routes/appRoutes.dart';
import 'package:graduationproject/features/onboarding/data/repo/onBoardingData.dart';
import 'package:graduationproject/features/onboarding/presentation/cubit/on_boarding_cubit_cubit.dart';

class CustomPageViewBuilder extends StatelessWidget {
  const CustomPageViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: BlocProvider.of<OnBoardingCubit>(context).pageController,
      onPageChanged: (value) {
        if (BlocProvider.of<OnBoardingCubit>(context).currentPageNumber ==
            OnBoardingListDat.length) {
          //Navigator.pushReplacementNamed(context, LoginScreen.id);
          context.go(AppRoutes.login);
        } else {
          BlocProvider.of<OnBoardingCubit>(context).getPageViewNumber(value);
        }
      },
      itemCount: OnBoardingListDat.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: OnBoardingListDat[index].height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                height: 400,
                OnBoardingListDat[index].image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  OnBoardingListDat[index].title,
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  OnBoardingListDat[index].text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}
