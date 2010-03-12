//
//  CTSlicehostImage.m
//  iPhone
//
//  Created by Michael Mayo on 3/11/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "CTSlicehostImage.h"


@implementation CTSlicehostImage

@synthesize imageId, name;

- (NSString *)toXML {
	return [NSString stringWithFormat:@"<image><name>Gentoo 2008.0</name><id type=\"integer\">3</id></image>", name, imageId];
}

-(void) dealloc {
	[name release];
	[super dealloc];
}

@end
