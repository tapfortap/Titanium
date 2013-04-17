/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

#import "ComTapfortapTiAdView.h"

@implementation ComTapfortapTiAdView

-(void) dealloc {
    RELEASE_TO_NIL(adView);
    [super dealloc];
}

-(UIView*) adView {
    [adView setDelegate:nil];
    [adView release];
    adView = nil;
    
    if (adView == nil) {
        adView = [[TapForTapAdView alloc] initWithFrame:[self frame] delegate:self];
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

- (void) tapForTapAdViewDidReceiveAd: (TapForTapAdView *)adView {
    [self.proxy fireEvent:@"receive"];
}

- (void) tapForTapAdView: (TapForTapAdView *)adView didFailToReceiveAd: (NSString *)reason {
    [self.proxy fireEvent:@"error" withObject:reason];

}

- (void) tapForTapAdViewWasTapped: (TapForTapAdView *)adView {
    [self.proxy fireEvent:@"tap"];
}

@end
