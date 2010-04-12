//
//  CTSlicehostSlice.m
//  iPhone
//
//  Created by Michael Mayo on 3/11/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "CTSlicehostSlice.h"


@implementation CTSlicehostSlice

@synthesize sliceId, name, flavorId, imageId, backupId, status, progress, bandwidthIn, bandwidthOut, addresses, rootPassword;

+ (id)slice {
	CTSlicehostSlice *slice = [[[self alloc] init] autorelease];
	slice.addresses = [[NSMutableArray alloc] init];
	return slice;
}

- (NSString *)toXML {
	return [NSString stringWithFormat:@"<slice><name>%@</name><image-id type=\"integer\">%i</image-id><flavor-id type=\"integer\">%i</flavor-id></slice>", self.name, self.imageId, flavorId];
}

- (void)dealloc {
	[name release];
	[status release];
	[addresses release];
	[rootPassword release];
	[super dealloc];
}

@end
