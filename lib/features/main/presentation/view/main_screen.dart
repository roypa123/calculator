import 'package:calculator/features/main/presentation/view/widgets/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/configs/constants/string_constants.dart';
import '../../../../core/configs/styles/app_colors.dart';
import '../../models/buttons.dart';
import '../bloc/main_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        centerTitle: true,
        title: const Text(
          Strings.calculator,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: BlocConsumer<MainBloc, MainState>(
            listener: (context, state) {},
            builder: (context, state) {
              String operation = state is CalculatorResult ? state.operation : '';
              String result = state is CalculatorResult ? state.result : '0';
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.w, horizontal: 10.h),
                      alignment: Alignment.bottomRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              operation,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30.sp),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                result,
                                style:
                                    TextStyle(color: Colors.white, fontSize: 30.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.w, horizontal: 10.h),
                      decoration: BoxDecoration(
                        color: AppColors.f2a2d37,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                      ),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 1,
                        ),
                        itemCount: buttons.length,
                        itemBuilder: (context, index) {
                          return CalculatorButton(
                            text: buttons[index],
                            onTap: () {
                              if (buttons[index] == 'C') {
                                context
                                    .read<MainBloc>()
                                    .add(CalculatorClearEvent());
                              } else if (buttons[index] == '=') {
                                context
                                    .read<MainBloc>()
                                    .add(CalculatorEqualsEvent());
                              } else {
                                context
                                    .read<MainBloc>()
                                    .add(CalculatorInputEvent(buttons[index]));
                              }
                            },
                            color: isTopSection(buttons[index])
                                ? AppColors.primaryColor
                                : isSideSection(buttons[index])
                                    ? AppColors.orange
                                    : isEqualToButton(buttons[index])
                                        ? AppColors.red
                                        : AppColors.white,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
