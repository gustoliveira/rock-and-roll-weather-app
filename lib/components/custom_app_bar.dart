import 'package:flutter/material.dart';
import 'package:rock_and_roll_weather_app/components/no_internet_banner.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showReturnButton;
  final Widget? statusIcon;

  const CustomAppBar({
    this.title = "Rock n' Weather",
    this.showReturnButton = false,
    this.statusIcon,
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            appBar(context),
            NoInternetBanner(),
          ],
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        backButton(context),
        Expanded(child: appTitle()),
        statusIconWidget(),
      ],
    );
  }

  Widget appTitle() {
    return Center(
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 23,
          letterSpacing: .5,
        ),
      ),
    );
  }

  Widget backButton(BuildContext context) {
    return SizedBox(
      width: 20,
      child: Visibility(
        visible: showReturnButton,
        child: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
    );
  }

  Widget statusIconWidget() {
    return Container(
      alignment: Alignment.topRight,
      margin: const EdgeInsets.only(right: 10),
      width: 20,
      height: 20,
      child: Visibility(
        visible: statusIcon != null,
        child: Center(child: statusIcon),
      ),
    );
  }
}
