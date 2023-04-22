import 'package:flutter/material.dart';
import 'package:google_ads_demo/google_ads.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdScreen extends StatefulWidget {
  const AdScreen({Key? key}) : super(key: key);

  @override
  State<AdScreen> createState() => _AdScreenState();
}

class _AdScreenState extends State<AdScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GAdHelper.Gadhelper.loadBannerAd();
    GAdHelper.Gadhelper.loadInterstitialAd();
    GAdHelper.Gadhelper.loadRewardedAd();
    GAdHelper.Gadhelper.loadAppOpenAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          "Google Ads",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: AdWidget(
                ad: GAdHelper.Gadhelper.bannerAd!,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                if (GAdHelper.Gadhelper.interstitialAd != null) {
                  GAdHelper.Gadhelper.interstitialAd!.show();
                  GAdHelper.Gadhelper.loadInterstitialAd();
                  setState(() {});
                } else {
                  print("$Future.error(error)");
                }
              },
              child: const Text(
                "Interstitial",
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                if (GAdHelper.Gadhelper.rewardedAd != null) {
                  GAdHelper.Gadhelper.rewardedAd!.show(
                      onUserEarnedReward: (ad, reward) {
                    print(
                        "===========================================================================================================================================================");
                    print(
                        "==========================================================YOU ARE REWARDED ${reward.amount}=================================================================");
                    print(
                        "============================================================================================================================================================");
                  });
                }
              },
              child: const Text("Rewarded"),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                if (GAdHelper.Gadhelper.appOpenAd != null) {
                  GAdHelper.Gadhelper.appOpenAd!.show();
                }
              },
              child: const Text(
                "AppOpen Ad",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
