#import <Cordova/CDV.h>
#import "Vungle.h"

#import <VungleSDK/VungleSDK.h>
#import <VungleAdapter/VungleAdapter.h>
#import <VungleAdapter/VungleAdNetworkExtras.h>

#import <GoogleMobileAds/GADExtras.h>
#import <GoogleMobileAds/GADRewardedAd.h>

@implementation VunglePlugin

- (void)pluginInitialize {
    [super pluginInitialize];
    if (self) {
        NSDictionary* settings = self.commandDelegate.settings;
        NSString* rewardvideoId = settings[@"REWARDVIDEO_ID"];
        NSLog(@"Vungle mediation plugin init");
        NSLog(@"rewardvideoId");

        GADRequest *request = [GADRequest request];
        VungleAdNetworkExtras *extras = [[VungleAdNetworkExtras alloc] init];

        NSMutableArray *placements = [[NSMutableArray alloc]initWithObjects:rewardvideoId, nil];
        extras.allPlacements = placements;
        [request registerAdNetworkExtras:extras];

        [GADRewardedAd
            loadWithAdUnitID:rewardvideoId
            request:request
            completionHandler:^(GADRewardedAd *ad, NSError *error) {
                NSLog(@"load handler");
            }
        ];
    }
} @end
