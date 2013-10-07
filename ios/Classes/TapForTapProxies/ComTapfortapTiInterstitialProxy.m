/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

#import "ComTapfortapTiInterstitialProxy.h"
#import "TFTTapForTap.h"
#import "TiUtils.h"
#import "TiApp.h"

@interface ComTapfortapTiInterstitialProxy()
@property (nonatomic, retain) TFTInterstitial *interstitial;
@end

@implementation ComTapfortapTiInterstitialProxy

- (TFTInterstitial *)interstitial {
    if (_interstitial == nil) {
        _interstitial = [[TFTInterstitial interstitialWithDelegate:self] retain];
    }
    return _interstitial;
}

-(void) prepare:(id)arg {
    ENSURE_UI_THREAD_0_ARGS;
    [self.interstitial load];
}

-(void) show:(id)arg {
    ENSURE_UI_THREAD_0_ARGS;
    [self.interstitial showAndLoadWithViewController:[TiApp app].controller];
}

- (void)tftInterstitialDidReceiveAd:(TFTInterstitial *)interstitial {
    [self fireEvent:@"receive"];
}

- (void)tftInterstitial:(TFTInterstitial *)interstitial didFail:(NSString *)reason {
    [self fireEvent:@"fail" withObject:reason];
}

- (void)tftInterstitialDidShow:(TFTInterstitial *)interstitial {
    [self fireEvent:@"show"];
}

- (void)tftInterstitialWasTapped:(TFTInterstitial *)interstitial {
    [self fireEvent:@"tap"];
}

- (void)tftInterstitialWasDismissed:(TFTInterstitial *)interstitial {
    [self fireEvent:@"dismiss"];
}

-(void) dealloc {
    [_interstitial release];
    _interstitial = nil;
    [super dealloc];
}

@end
