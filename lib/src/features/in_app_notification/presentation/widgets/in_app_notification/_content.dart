part of in_app_notification;

class _Content extends StatelessWidget {
  const _Content({
    required this.failure,
  });

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          CupertinoIcons.exclamationmark_triangle,
          color: CustomCupertinoTheme.of(context).colors.error,
          size: 24,
        ),
        const MediumGap(),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                failure.name,
                style:
                    CustomCupertinoTheme.of(context).text.buttonLabel.copyWith(
                          color: CustomCupertinoTheme.of(context).colors.error,
                        ),
                overflow: TextOverflow.ellipsis,
              ),
              const SmallGap(),
              Text(
                failure.message,
                style: CustomCupertinoTheme.of(context).text.body,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
