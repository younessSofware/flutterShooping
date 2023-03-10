import 'package:first_app/_shared/themes/colors.dart';
import 'package:first_app/_shared/themes/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicHomeBottomNavigationBar extends StatelessWidget {
  final Color color;

  const BasicHomeBottomNavigationBar({Key? key, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      child: BottomAppBar(
        elevation: 20,
        color: AppColors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconNavBar(
                      title: 'home',
                      icon: Icons.home_filled,
                      color: AppColors.grey,
                      onIconClick: () => print('home clicked'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconNavBar(
                      title: 'Offers',
                      icon: Icons.list_alt_rounded,
                      color: AppColors.grey,
                      onIconClick: () => print('Offers clicked'),
                    ),
                  ],
                ),
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconNavBar(
                      title: 'saved',
                      icon: Icons.bookmark,
                      color: AppColors.grey,
                      onIconClick: () => print('saved clicked'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconNavBar(
                      title: 'account',
                      icon: Icons.person,
                      color: AppColors.grey,
                      onIconClick: () => print('account clicked'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconNavBar extends StatelessWidget {
  const IconNavBar(
      {Key? key,
      required this.title,
      required this.icon,
      required this.color,
      required this.onIconClick})
      : super(key: key);
  final String? title;
  final IconData? icon;
  final Color? color;
  final Function()? onIconClick;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onIconClick,
      minWidth: 48,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 28,
            color: color,
          ),
          CustomTextView(
            text: title,
            textStyle: AppTextStyles.smallStyle.copyWith(color: color),
          )
        ],
      ),
    );
  }
}

class CustomTextView extends StatelessWidget {
  final String? text;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final int? maxLine;
  final TextOverflow? textOverflow;
  final bool? isUpperCase;

  const CustomTextView(
      {Key? key,
      this.text,
      this.textAlign,
      this.textStyle,
      this.maxLine,
      this.textOverflow,
      this.isUpperCase = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      isUpperCase! ? text!.toUpperCase() : text ?? "",
      overflow: textOverflow,
      textAlign: textAlign,
      style: textStyle,
      softWrap: true,
      maxLines: maxLine,
    );
  }
}
