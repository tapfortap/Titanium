/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

#import "ComTapForTapTiAppWallProxy.h"
#import "TapForTapAppWall.h"
#import "TiUtils.h"
#import "TiApp.h"

@implementation ComTapfortapTiAppWallProxy

-(void) prepare:(id)arg {
    [TapForTapAppWall prepare];
}

-(void) show:(id)arg {
    ENSURE_UI_THREAD_0_ARGS;
    [TapForTapAppWall showWithRootViewController:[TiApp app].controller];
    [TapForTapAppWall setDelegate:self];
}

- (void) tapForTapAppWallDidReceiveAd {
    [self fireEvent:@"receive"];
}

- (void) tapForTapAppWallDidShow {
    [self fireEvent:@"show"];
}

-(void) tapForTapAppWallWasDismissed {
    [self fireEvent:@"dismiss"];
}

- (void) tapForTapAppWallFailedToDownload: (NSString *) reason {
    [self fireEvent:@"fail" withObject:reason];
}

-(void) dealloc {
    if([TapForTapAppWall delegate] == self) {
        [TapForTapAppWall setDelegate:nil];
    }
    [super dealloc];
}

@end
