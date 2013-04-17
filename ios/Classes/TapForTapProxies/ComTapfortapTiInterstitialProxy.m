/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

#import "ComTapfortapTiInterstitialProxy.h"
#import "TapForTap.h"
#import "TiUtils.h"
#import "TiApp.h"

@implementation ComTapfortapTiInterstitialProxy

-(void) prepare:(id)arg {
    [TapForTapInterstitial prepare];
}

-(void) show:(id)arg {
    ENSURE_UI_THREAD_0_ARGS;
    [TapForTapInterstitial showWithRootViewController:[TiApp app].controller];

}

- (void) tapForInterstitialDidReceiveAd {
    [self fireEvent:@"receive"];
}

- (void) tapForTapInterstitialDidShow {
    [self fireEvent:@"show"];
}

-(void) tapForTapInterstitialWasDismissed {
    [self fireEvent:@"dismiss"];
}

- (void) tapForTapInterstitialFailedToDownload: (NSString *) reason {
    [self fireEvent:@"fail" withObject:reason];
}

-(void) dealloc {
    if([TapForTapInterstitial delegate] == self) {
        [TapForTapInterstitial setDelegate:nil];
    }
    [super dealloc];
}

@end
