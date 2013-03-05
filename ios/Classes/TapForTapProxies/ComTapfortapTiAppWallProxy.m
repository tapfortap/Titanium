/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

#import "ComTapForTapTiAppWallProxy.h"
#import "TapForTapAppWall.h"

@implementation ComTapfortapTiAppWallProxy

-(void) prepare:(id)arg {
    [TapForTapAppWall prepare];
}

-(void) show:(id)arg {
    ENSURE_UI_THREAD_0_ARGS;
    UIViewController *applicationViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    [TapForTapAppWall showWithRootViewController:applicationViewController];
}

@end
