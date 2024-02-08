import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.title,
    this.actionWidgets,
    required this.showBackButton,
    this.onPressedBack,
    this.backButtonIcon,
    this.centerTitle,
  });

  final Widget? title;
  final List<Widget>? actionWidgets;
  final bool showBackButton;
  final VoidCallback? onPressedBack;
  final IconData? backButtonIcon;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          automaticallyImplyLeading: false,
          title: title,
          centerTitle: centerTitle ?? false,
          actions: actionWidgets,
          leading: showBackButton
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                )
              : backButtonIcon != null
                  ? IconButton(onPressed: () {}, icon: Icon(backButtonIcon))
                  : null,
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
