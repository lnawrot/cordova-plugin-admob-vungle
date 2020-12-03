#import <Cordova/CDV.h>
#import "Vungle.h"

#import <VungleSDK/VungleSDK.h>
#import <VungleAdapter/VungleAdapter.h>
#import <VungleAdapter/VungleAdNetworkExtras.h>
#import <GoogleMobileAds/GADExtras.h>

#import <GoogleMobileAds/GADInterstitial.h>
#import <GoogleMobileAds/GADInterstitialDelegate.h>

@interface VunglePlugin () <GADInterstitialDelegate>

@property(nonatomic, strong) GADInterstitial *interstitial;

@end

@implementation VunglePlugin

- (void)pluginInitialize {
    [super pluginInitialize];
    if (self) {
        NSDictionary* settings = self.commandDelegate.settings;
        NSString* rewardvideoId = settings[@"REWARDVIDEO_ID"];
        NSString* interstitialId = settings[@"INTERSTITIAL_ID"];
        NSLog(@"Vungle mediation plugin init");
        NSLog(@"rewardvideoId");

        GADRequest *request = [GADRequest request];
        VungleAdNetworkExtras *extras = [[VungleAdNetworkExtras alloc] init];

        NSMutableArray *placements = [[NSMutableArray
            alloc]initWithObjects:rewardvideoId, nil];
        extras.allPlacements = placements;
        [request registerAdNetworkExtras:extras];

        [[GADRewardBasedVideoAd sharedInstance] loadRequest:[GADRequest request] withAdUnitID: rewardvideoId];
    }
} @end
