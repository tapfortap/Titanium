/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

#import "ComTapfortapTiAdView.h"

@implementation ComTapfortapTiAdView

-(void) dealloc {
    if(adView != nil) {
        [adView performSelector: @selector(setDelegate:) withObject:nil];
    }
    RELEASE_TO_NIL(adView);
    [super dealloc];
}

-(UIView*) adView {
    [adView setDelegate:nil];
    [adView release];
    adView = nil;

    if (adView == nil) {
        adView = [TFTBanner bannerWithFrame:[self frame] delegate:self];
        [self addSubview:adView];
    }
    return adView;
}

-(void) frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds {
    [self adView];
    if (adView != nil) {
        [TiUtils setView:adView positionRect:bounds];
    }
}

- (void) tftBannerDidReceiveAd: (TFTBanner *)banner {
    [self.proxy fireEvent:@"receive"];
}

- (void) tftBanner: (TFTBanner *)banner didFail:(NSString *)reason {
    [self.proxy fireEvent:@"error" withObject:reason];

}

- (void) tftBannerWasTapped:(TFTBanner *)banner {
    [self.proxy fireEvent:@"tap"];
}

@end
