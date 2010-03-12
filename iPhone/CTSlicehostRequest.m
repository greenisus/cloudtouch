//
//  CTSlicehostRequest.m
//  iPhone
//
//  Created by Michael Mayo on 3/12/10.
//

#import "CTSlicehostRequest.h"

static NSString *apiKey = nil;
static NSRecursiveLock *accessDetailsLock = nil;

@implementation CTSlicehostRequest

+ (void)initialize {
	if (self == [CTSlicehostRequest class]) {
		accessDetailsLock = [[NSRecursiveLock alloc] init];
	}
}

+ (NSString *)host {
    return [NSString stringWithFormat:@"https://%@@api.slicehost.com/", apiKey];
	//return @"https://api.slicehost.com/";
}

+ (NSString *)apiKey {
    return apiKey;
}

+ (void)setAPIKey:(NSString *)newAPIKey {
    [accessDetailsLock lock];
    [apiKey release];
    apiKey = [newAPIKey retain];
    [accessDetailsLock unlock];
}

@end
