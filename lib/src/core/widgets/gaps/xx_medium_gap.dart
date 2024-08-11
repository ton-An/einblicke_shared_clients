import 'package:einblicke_shared_clients/einblicke_shared_clients.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class XXMediumGap extends StatelessWidget {
  const XXMediumGap({super.key});

  @override
  Widget build(BuildContext context) {
    return Gap(CustomCupertinoTheme.of(context).spacing.xxMedium);
  }
}
