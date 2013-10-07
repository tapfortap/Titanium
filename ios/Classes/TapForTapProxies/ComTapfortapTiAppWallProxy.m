/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

#import "ComTapForTapTiAppWallProxy.h"
#import "TFTAppWall.h"
#import "TiUtils.h"
#import "TiApp.h"

@interface ComTapfortapTiAppWallProxy()
@property (nonatomic, retain) TFTAppWall *appWall;
@end

@implementation ComTapfortapTiAppWallProxy

- (TFTAppWall *)appWall {
    NSLog(@"getting appWall");
    if (_appWall == nil) {
        NSLog(@"creating appWall");
        _appWall = [[TFTAppWall appWallWithDelegate:self] retain];
    }
    return _appWall;
}

- (void)prepare:(id)arg {
    ENSURE_UI_THREAD_0_ARGS;
    NSLog(@"preparing appWall");
    [self.appWall load];
}

- (void)show:(id)arg {
    ENSURE_UI_THREAD_0_ARGS;
    NSLog(@"showing appWall");
    [self.appWall showAndLoadWithViewController:[TiApp app].controller];
}

- (void)tftAppWallDidReceiveAd:(TFTAppWall *)appWall {
    [self fireEvent:@"receive"];
}

- (void)tftAppWall:(TFTAppWall *)appWall didFail:(NSString *)reason {
    [self fireEvent:@"fail" withObject:reason];
}

- (void)tftAppWallDidShow:(TFTAppWall *)appWall {
    [self fireEvent:@"show"];
}

- (void)tftAppWallWasTapped:(TFTAppWall *)appWall {
    [self fireEvent:@"tap"];
}

- (void)tftAppWallWasDismissed:(TFTAppWall *)appWall {
    [self fireEvent:@"dismiss"];
}

-(void) dealloc {
    [_appWall release];
    _appWall = nil;
    [super dealloc];
}

@end
