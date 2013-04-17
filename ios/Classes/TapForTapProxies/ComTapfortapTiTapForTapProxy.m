/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

#import "ComTapfortapTiTapForTapProxy.h"
#import "TapForTap.h"
#import "TiUtils.h"

@implementation ComTapfortapTiTapForTapProxy

-(void) initializeWithApiKey:(id)args {
    ENSURE_UI_THREAD_1_ARG(args);
    ENSURE_SINGLE_ARG(args, NSString);
    NSString* apiKey = [TiUtils stringValue:args];
    [TapForTap performSelector: @selector(_setPlugin:) withObject: @"titanium"];
    [TapForTap performSelector: @selector(_setPluginVersion:) withObject: @"1.1.0"];
    [TapForTap initializeWithAPIKey: apiKey];
}

-(void) setEnvironment:(id)args {
    ENSURE_SINGLE_ARG(args, NSString);
    NSString* environment = [TiUtils stringValue:args];
    [TapForTap performSelector:@selector(_setEnvironment:) withObject: environment];
}

-(void) setYearOfBirth:(id)args {
    NSUInteger yearOfBirth = [TiUtils intValue:args];
    [TapForTap setYearOfBirth:yearOfBirth];
}

-(void) setGender:(id)args {
    NSUInteger gender = [TiUtils intValue:args];
    if(gender == MALE) {
        [TapForTap setGender:MALE];
    } else if(gender == FEMALE){
        [TapForTap setGender:FEMALE];
    } else {
        [TapForTap setGender:NONE];
    }
}

-(void) setLocation:(id)args {
    CLLocationDegrees latitude = [TiUtils doubleValue:[args objectAtIndex:0]];
    CLLocationDegrees longitude =[TiUtils doubleValue:[args objectAtIndex:1]];
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    [TapForTap setLocation:location];
    
    [location release];
}

-(void) setUserAccountId:(id)args {
    ENSURE_SINGLE_ARG(args, NSString);
    NSString* userAccountId = [TiUtils stringValue:args];
    [TapForTap setUserAccountID: userAccountId];
}

@end
