import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/features/settings/data/models/settings_model.dart';
import 'package:flutter/material.dart';

class AddtionalSettingsList extends StatelessWidget {
  const AddtionalSettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        AdditionalSettingsItem(settingsModel: SettingsModel.settingsData.first),
        AdditionalSettingsItem(
          settingsModel: SettingsModel.settingsData[1],
          showSwitch: true,
        ),
        AdditionalSettingsItem(settingsModel: SettingsModel.settingsData.last),
      ],
    );
  }
}

class AdditionalSettingsItem extends StatelessWidget {
  const AdditionalSettingsItem({
    super.key,
    required this.settingsModel,
    this.showSwitch = false,
  });

  final SettingsModel settingsModel;

  final bool showSwitch;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(settingsModel.image),
        ),
        Expanded(
          child: Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,

            settingsModel.title,
            style: context.textTheme.bodyLarge,
          ),
        ),
        showSwitch
            ? Image.asset(Assets.assetsImagesSettingsSwitch, width: 50)
            : Image.asset(Assets.assetsImagesArrowGo, width: 8),
      ],
    );
  }
}
