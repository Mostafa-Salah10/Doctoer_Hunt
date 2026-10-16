import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/core/widgets/custom_log_out_widget.dart';
import 'package:doctor_hunt/core/widgets/custom_screen_app_bar.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/settings/presentation/manager/settings_cubit.dart';
import 'package:doctor_hunt/features/settings/presentation/widgets/addtional_settings_list.dart';
import 'package:doctor_hunt/features/settings/presentation/widgets/setting_card.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomScreensAppBar(
                title: context.t.settings,
                showBackButton: false,
              ),

              const VerticalSpace(height: 34),

              BlocBuilder<SettingsCubit, SettingsState>(
                buildWhen: (previous, current) =>
                    previous.getCurrentPatient != current.getCurrentPatient,
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      if (state.getCurrentPatient.data != null) {
                        context.pushNamed(
                          AppRoutes.profileScreen,
                          arguments: {
                            'cubit': context.read<SettingsCubit>(),
                            'patient': state.getCurrentPatient.data,
                          },
                        );
                      }
                    },

                    child: SettingCard(patient: state.getCurrentPatient.data),
                  );
                },
              ),

              const VerticalSpace(height: 10),
              Text(
                context.t.accountSettings,
                style: context.textTheme.bodyLarge!.copyWith(
                  color: AppColors.greyTextColor,
                ),
              ),

              const VerticalSpace(height: 20),

              const AddtionalSettingsList(),
              const VerticalSpace(height: 20),
              Text(
                context.t.moreOptions,
                style: context.textTheme.bodyLarge!.copyWith(
                  color: AppColors.greyTextColor,
                ),
              ),

              const VerticalSpace(height: 20),

              Image.asset(Assets.assetsImagesLanguage),

              Image.asset(Assets.assetsImagesVersions),
              const VerticalSpace(height: 53),

              const CustomLogoutWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
