import 'package:google_mobile_ads/google_mobile_ads.dart';

class GAdHelper {
  GAdHelper._();

  static final GAdHelper Gadhelper = GAdHelper._();

  BannerAd? bannerAd;

  loadBannerAd() {
    bannerAd = BannerAd(
        size: AdSize.largeBanner,
        adUnitId: "ca-app-pub-3940256099942544/6300978111",
        listener: const BannerAdListener(),
        request: const AdRequest());

    bannerAd!.load();
  }

  InterstitialAd? interstitialAd;

  loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-3940256099942544/8691691433",
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {},
      ),
    );
  }

  RewardedAd? rewardedAd;

  loadRewardedAd() {
    RewardedAd.load(
        adUnitId: "ca-app-pub-3940256099942544/5224354917",
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (ad) {
              rewardedAd = ad;
            },
            onAdFailedToLoad: (error) {}));
  }

  AppOpenAd? appOpenAd;

  loadAppOpenAd() {
    AppOpenAd.load(
      adUnitId: "ca-app-pub-3940256099942544/3419835294",
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            appOpenAd = ad;
          },
          onAdFailedToLoad: (error) {}),
      orientation: AppOpenAd.orientationPortrait,
    );
  }
}
