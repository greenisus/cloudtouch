//
//  CTSlicehostFlavorRequest.m
//  iPhone
//
//  Created by Michael Mayo on 4/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CTSlicehostFlavorRequest.h"
#import "CTSlicehostFlavor.h"


@implementation CTSlicehostFlavorRequest

#pragma mark -
#pragma mark Constructors

+ (id)flavorRequestWithMethod:(NSString *)method path:(NSString *)path {
	NSString *urlString = [NSString stringWithFormat:@"%@%@", [CTSlicehostRequest host], path];	
	CTSlicehostFlavorRequest *request = [[[CTSlicehostFlavorRequest alloc] initWithURL:[NSURL URLWithString:urlString]] autorelease];
	[request addBasicAuthenticationHeaderWithUsername:[CTSlicehostRequest apiKey] andPassword:@""];
	[request setRequestMethod:method];
	return request;
}

#pragma mark -
#pragma mark GET Requests

// GET https://apikey@api.slicehost.com/flavors.xml
+ (id)listRequest {
    return nil;
}

- (NSArray *)flavors {
    return nil;
}

// GET https://apikey@api.slicehost.com/flavors/xxxx.xml
+ (id)getFlavorRequest:(NSUInteger)flavorId {
    return nil;
}

- (CTSlicehostFlavor *)flavor {
    return nil;
}


@end
