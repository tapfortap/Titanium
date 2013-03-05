/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

#import "ComTapfortapTiInterstitialProxy.h"
#import "TapForTap.h"
#import <Foundation/Foundation.h>

@implementation ComTapfortapTiInterstitialProxy

-(void) prepare:(id)arg {
    [TapForTapInterstitial prepare];
}

-(void) show:(id)arg {
    ENSURE_UI_THREAD_0_ARGS;
    UIViewController *applicationViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    NSLog(@"view controller == nil? %d ", (applicationViewController == nil));
    [TapForTapInterstitial showWithRootViewController:applicationViewController];

}

@end
