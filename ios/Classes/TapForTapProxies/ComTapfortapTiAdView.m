/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

#import "ComTapfortapTiAdView.h"

@implementation ComTapfortapTiAdView
-(void)dealloc {
    RELEASE_TO_NIL(adView);
    [super dealloc];
}

-(UIView*)adView {
    [adView release];
    adView = nil;
    
    if (adView == nil) {
        adView = [[TapForTapAdView alloc] initWithFrame:[self frame]];
        [self addSubview:adView];
    }
    return adView;
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds {
    [self adView];
    if (adView != nil) {
        [TiUtils setView:adView positionRect:bounds];
    }
}

@end
