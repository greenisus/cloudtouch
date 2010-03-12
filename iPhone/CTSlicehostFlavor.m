//
//  CTSlicehostFlavor.m
//  iPhone
//
//  Created by Michael Mayo on 3/11/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "CTSlicehostFlavor.h"


@implementation CTSlicehostFlavor

@synthesize flavorId, name, price, ram;

- (NSString *)toXML {
	return [NSString stringWithFormat:@"<flavor><id type=\"integer\">1</id><name>256 slice</name><price type=\"integer\">2000</price><ram type=\"integer\">256</ram></flavor>", flavorId, name, price, ram];
}

-(void) dealloc {
	[name release];
	[super dealloc];
}

@end
