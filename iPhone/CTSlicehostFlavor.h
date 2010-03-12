//
//  CTSlicehostFlavor.h
//  iPhone
//
//  Created by Michael Mayo on 3/11/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CTSlicehostFlavor : NSObject {
	NSUInteger flavorId;
	NSString *name;
	NSUInteger price;
	NSUInteger ram;
}

@property (assign) NSUInteger flavorId;
@property (retain) NSString *name;
@property (assign) NSUInteger price;
@property (assign) NSUInteger ram;

- (NSString *)toXML;

@end
