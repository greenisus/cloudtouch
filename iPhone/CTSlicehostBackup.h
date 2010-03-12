//
//  CTSlicehostBackup.h
//  iPhone
//
//  Created by Michael Mayo on 3/11/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CTSlicehostBackup : NSObject {
	NSString *name;
	NSUInteger sliceId;
	NSDate *date;
}

@property (retain) NSString *name;
@property (assign) NSUInteger sliceId;
@property (assign) NSDate *date;

- (NSString *)toXML;

@end
