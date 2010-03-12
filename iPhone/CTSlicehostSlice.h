//
//  CTSlicehostSlice.h
//  iPhone
//
//  Created by Michael Mayo on 3/11/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CTSlicehostSlice : NSObject {
	NSUInteger sliceId;
	NSString *name;
	NSUInteger flavorId;
	NSUInteger imageId;
	NSUInteger backupId;
	NSString *status;
	NSUInteger progress;
	NSDecimal bandwidthIn;
	NSDecimal bandwidthOut;
	NSArray *addresses;
	NSString *rootPassword;
}

@property (assign) NSUInteger sliceId;
@property (retain) NSString *name;
@property (assign) NSUInteger flavorId;
@property (assign) NSUInteger imageId;
@property (assign) NSUInteger backupId;
@property (retain) NSString *status;
@property (assign) NSUInteger progress;
@property (assign) NSDecimal bandwidthIn;
@property (assign) NSDecimal bandwidthOut;
@property (retain) NSArray *addresses;
@property (retain) NSString *rootPassword;

- (NSString *)toXML;

@end
