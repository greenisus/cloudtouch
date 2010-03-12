//
//  CTSlicehostZone.m
//  iPhone
//
//  Created by Michael Mayo on 3/11/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "CTSlicehostZone.h"


@implementation CTSlicehostZone

@synthesize zoneId, origin, ttl, active;

- (void)dealloc {
	[origin release];
	[super dealloc];
}

@end
