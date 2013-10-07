/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

#import "ComTapfortapTiTapForTapProxy.h"
#import "TFTTapForTap.h"
#import "TiUtils.h"

@implementation ComTapfortapTiTapForTapProxy

-(void) initializeWithApiKey:(id)args {
    ENSURE_UI_THREAD_1_ARG(args);
    ENSURE_SINGLE_ARG(args, NSString);
    NSString* apiKey = [TiUtils stringValue:args];
    [TFTTapForTap performSelector: @selector(setPlugin:) withObject: @"titanium"];
    [TFTTapForTap performSelector: @selector(setPluginVersion:) withObject: @"1.2.0"];
    [TFTTapForTap initializeWithAPIKey: apiKey];
}

-(void) setEnvironment:(id)args {
    ENSURE_SINGLE_ARG(args, NSString);
    NSString* environment = [TiUtils stringValue:args];
    [TFTTapForTap performSelector:@selector(_setEnvironment:) withObject: environment];
}

-(void) setYearOfBirth:(id)args {
    NSUInteger yearOfBirth = [TiUtils intValue:args];
    [TFTTapForTap setYearOfBirth:yearOfBirth];
}

-(void) setGender:(id)args {
    NSUInteger gender = [TiUtils intValue:args];
    if(gender == MALE) {
        [TFTTapForTap setGender:MALE];
    } else if(gender == FEMALE){
        [TFTTapForTap setGender:FEMALE];
    } else {
        [TFTTapForTap setGender:NONE];
    }
}

-(void) setLocation:(id)args {
    CLLocationDegrees latitude = [TiUtils doubleValue:[args objectAtIndex:0]];
    CLLocationDegrees longitude =[TiUtils doubleValue:[args objectAtIndex:1]];
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    [TFTTapForTap setLocation:location];
    
    [location release];
}

-(void) setUserAccountId:(id)args {
    ENSURE_SINGLE_ARG(args, NSString);
    NSString* userAccountId = [TiUtils stringValue:args];
    [TFTTapForTap setUserAccountId: userAccountId];
}

@end
