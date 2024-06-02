import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:patients/core/style/color/colors.dart';

class CustomCard extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final String? name;
  final String? reading;
  final String? tempReading;
  final Widget? list;
  final Color? cardColor;
  final Gradient? cardGradient;
  final bool showUpdateDetails;
  final bool showArrow;

  const CustomCard({
    Key? key,
    this.onTap,
    this.title,
    this.name,
    this.reading,
    this.list,
    this.tempReading,
    this.cardColor,
    this.cardGradient,
    this.showUpdateDetails = false,
     this.showArrow = false,
  }) : super(key: key);

  static const titleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const cardTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const tempReadingStyle = TextStyle(
    color: Colors.white,
    fontSize: 28,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            if (title != null || (onTap != null && showUpdateDetails))
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (title != null) Text(title!, style: titleStyle),
                  if (onTap != null) InkWell(
                    onTap: onTap,
                    child: showUpdateDetails
                        ? Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: kPrimary),
                            ),
                            child: const Text(
                              "Update Details",
                              style: TextStyle(color: kPrimary),
                            ),
                          )
                        : const Text(
                            "See All",
                            style: TextStyle(color: kPrimary),
                          ),
                  ),
                ],
              ),
            const Gap(5),
            Container(
              height: 124,
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 12.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: cardColor ?? Colors.transparent,
                gradient: cardGradient,
              ),
              child: Column(
                children: [
                  if (name != null && reading != null)
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              name!,
                              style: cardTextStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: AutoSizeText(
                              reading!,
                              style: cardTextStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (tempReading != null)
                    AutoSizeText(
                      tempReading!,
                      style: tempReadingStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  Expanded(child: list ?? Container()),
                ],
              ),
            ),
          ],
        ),
      if (showArrow) // Add this line
          const Positioned(
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: kWhite,
                child: Icon(Icons.arrow_forward, color: kPrimary),
              ),
            ),
          ),
      ],
    );
  }
}
