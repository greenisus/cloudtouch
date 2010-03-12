//
//  CTSlicehostZone.h
//  iPhone
//
//  Created by Michael Mayo on 3/11/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CTSlicehostZone : NSObject {
	NSUInteger zoneId;
	NSString *origin;
	NSUInteger ttl;
	BOOL active;
}

@property (assign) NSUInteger zoneId;
@property (retain) NSString *origin;
@property (assign) NSUInteger ttl;
@property (assign) BOOL active;

- (NSString *)toXML;

@end
