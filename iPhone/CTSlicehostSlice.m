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

- (NSString *)toXML {
	NSString *addr = @"";
	
	for (int i = 0; i < [addresses count]; i++) {
		NSString *address = [addresses objectAtIndex:i];
		addr = [addr stringByAppendingString:[NSString stringWithFormat:@"<address>%@</address>", address]];
	}
	
	return [NSString stringWithFormat:@"<slice><name>%@</name><image-id type=\"integer\">%i</image-id><addresses type=\"array\">%@</addresses><progress type=\"integer\">%i</progress><id type=\"integer\">%i</id><bw-out type=\"float\">%f</bw-out><bw-in type=\"float\">%f</bw-in><flavor-id type=\"integer\">%i</flavor-id><status>%@</status></slice>", self.name, self.imageId, addr, progress, sliceId, bandwidthOut, bandwidthIn, flavorId, status];
}

- (void)dealloc {
	[name release];
	[status release];
	[addresses release];
	[rootPassword release];
	[super dealloc];
}

@end
