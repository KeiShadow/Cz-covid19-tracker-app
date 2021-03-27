import 'package:covid19_stats/Localization/app_localizations.dart';
import '../../config/navigation/navigation_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProtectionView extends StatefulWidget with NavigationStates {
  @override
  _ProtectionViewState createState() => _ProtectionViewState();
}

class _ProtectionViewState extends State<ProtectionView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.translate('protection'),
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
