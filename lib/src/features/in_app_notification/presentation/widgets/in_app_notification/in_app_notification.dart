library in_app_notification;

import 'dart:ui';

import 'package:einblicke_shared/einblicke_shared.dart';
import 'package:einblicke_shared_clients/einblicke_shared_clients.dart';
import 'package:einblicke_shared_clients/src/core/custom_cupertino_properties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '_content.dart';
part '_decoration.dart';
part '_dismissible.dart';
part '_fade_wrapper.dart';

/*
  To-Dos:
  - [ ] Implement this screen and clean up
  - [ ] Clear up naming of the whole in app notification feature
*/

/// __In App Notification__ builds an in app notification wich displays a [Failure]
class InAppNotification extends StatelessWidget {
  const InAppNotification({
    required this.failure,
    super.key,
  });

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return _FadeWrapper(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Dismissible(
            dismissThreshold: .17,
            onDismissed: () =>
                context.read<InAppNotificationCubit>().dismissNotification(),
            movementDuration: const Duration(milliseconds: 450),
            reverseMovementDuration: const Duration(milliseconds: 2000),
            entryDuration: const Duration(milliseconds: 800),
            key: GlobalKey(),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: CustomCupertinoTheme.of(context).spacing.medium,
                  vertical: CustomCupertinoTheme.of(context).spacing.small,
                ),
                child: _Decroation(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          CustomCupertinoTheme.of(context).spacing.xMedium,
                      vertical: CustomCupertinoTheme.of(context).spacing.medium,
                    ),
                    child: _Content(
                      failure: failure,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
