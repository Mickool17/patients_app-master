import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:patients/common_widget/custom_card.dart';
import 'package:patients/common_widget/custom_image_view.dart';
import 'package:patients/common_widget/top_row.dart';
import 'package:patients/core/style/color/colors.dart';
import 'package:patients/presentations/healthplans/healthplan.dart';
import 'package:patients/presentations/transaction_history/transaction_history.dart';
import 'package:patients/presentations/wallet/walletpage2.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTopRow(),
          const Gap(20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Wallet",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(20),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const WalletPage2(),
                      ));
                    },
                    child: const CustomCard3(
                      gradient: kTemperature,
                      color: Colors.black,
                      title: 'Account balance',
                      widget: Column(
                        children: [
                          Text(
                            "₦ 20,000",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: kWhite),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Gap(20),
                  CustomCard2(
                    color: kPrimary,
                    title: "Transaction history",
                    name: "Aurora Health",
                    onTap: () {
                       Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const  TransactionHistory()));
                    },
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Outflow",
                          style: TextStyle(color: Colors.white),
                        ),
                        const Gap(15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomImageView(
                              imagePath: "assets/icons/calendar.png",
                            ),
                            const Expanded(
                              child: Text(
                                "Fri Dec 22 * 10:00am - 12:00pm",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  CustomCard2(
                      title: "Health plans",
                      name: 'Insurance ID #13456789',
                      onTap: () {
                           Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const  HealthPlan()));
                      },
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Leadway HMO",
                            style: TextStyle(color: Colors.white),
                          ),
                          const Gap(15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomImageView(
                                imagePath: "assets/icons/calendar.png",
                              ),
                              const Text(
                                " Fri Dec 22",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      color: kGreenColor),
                  const Gap(20),
                  CustomCard2(
                      title: "Documents",
                      name: 'Leg scan',
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Acumen Medical Centre",
                            style: TextStyle(color: Colors.white),
                          ),
                          const Gap(15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomImageView(
                                imagePath: "assets/icons/calendar.png",
                              ),
                              const Text(
                                " Thu Jun 152",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      color: kRedColor),
                  const Gap(20),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
