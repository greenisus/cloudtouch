//
//  CTSlicehostRecord.h
//  iPhone
//
//  Created by Michael Mayo on 3/11/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CTSlicehostRecord : NSObject {
	NSString *recordType;
	NSUInteger zoneId;
	NSString *name;
	NSString *data;
	NSUInteger ttl;
	BOOL active;
	NSString *aux;
}

@property (retain) NSString *recordType;
@property (assign) NSUInteger zoneId;
@property (retain) NSString *name;
@property (retain) NSString *data;
@property (assign) NSUInteger ttl;
@property (assign) BOOL active;
@property (retain) NSString *aux;

- (NSString *)toXML;

@end
