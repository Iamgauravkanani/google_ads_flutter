import 'package:flutter/material.dart';
import 'package:google_ads_demo/ads_helper.dart';
import 'package:google_ads_demo/my_ad_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.red),
      home: const AdScreen(),
    );
  }
}

class AdsScreen extends StatefulWidget {
  const AdsScreen({Key? key}) : super(key: key);

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  @override
  void initState() {
    super.initState();
    AdsHelper.adsHelper.loadNativeAds(); // Native Ads load
    AdsHelper.adsHelper.loadBannerAds(); // Banner Ads
    AdsHelper.adsHelper.loadInterstitialAds(); // Interstitial Ads load
    AdsHelper.adsHelper.loadRewardAds(); // Reward Ads load
    AdsHelper.adsHelper.loadAppOpenAds(); // AppOpen Ads load
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Text("Google Ads"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 100,
              child: AdWidget(ad: AdsHelper.adsHelper.bannerAd!),
              // Show Banner Using AdWidget
            ),
            const SizedBox(
              height: 20,
            ),
            //show InterstitialAds on Button click
            ElevatedButton(
                onPressed: () {
                  if (AdsHelper.adsHelper.interstitialAd != null) {
                    AdsHelper.adsHelper.interstitialAd!.show();
                  }
                },
                child: const Text("Show Interstitial")),
            //show RewardAds on Button click
            ElevatedButton(
                onPressed: () {
                  if (AdsHelper.adsHelper.rewardedAd != null) {
                    AdsHelper.adsHelper.rewardedAd!.show(
                      onUserEarnedReward: (ad, reward) {
                        print("Amount/Points of To earn => ${reward.amount}");
                      },
                    );
                  }
                },
                child: const Text("Show Reward")),
            //show AppOpen Ads open after splashscreen
            ElevatedButton(
                onPressed: () {
                  if (AdsHelper.adsHelper.appOpenAd != null) {
                    AdsHelper.adsHelper.appOpenAd!.show();
                  }
                },
                child: const Text("Show AppOpenAds")),

            SizedBox(
              height: 300,
              child: AdsHelper.adsHelper.nativeAd == null
                  ? const CircularProgressIndicator()
                  : AdWidget(
                      ad: AdsHelper.adsHelper.nativeAd!,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
