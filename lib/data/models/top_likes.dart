import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TopLikes {
  late String text;
  late Icon icon;

  TopLikes({required this.text, required this.icon});
}

List<TopLikes> getTopLikes(BuildContext context) {
  return [
    TopLikes(
        text: AppLocalizations.of(context)!.sampleText1,
        icon: Icon(Icons.favorite_border)),
    TopLikes(
        text: AppLocalizations.of(context)!.sampleText2,
        icon: Icon(Icons.favorite_border)),
    TopLikes(
        text: AppLocalizations.of(context)!.sampleText3,
        icon: Icon(Icons.favorite_border)),
  ];
}
