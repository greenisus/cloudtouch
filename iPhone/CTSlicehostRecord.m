//
//  CTSlicehostRecord.m
//  iPhone
//
//  Created by Michael Mayo on 3/11/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "CTSlicehostRecord.h"


@implementation CTSlicehostRecord

@synthesize recordType, zoneId, name, data, ttl, active, aux;

- (void)dealloc {
	[recordType release];
	[name release];
	[data release];
	[aux release];
	[super dealloc];
}

@end
