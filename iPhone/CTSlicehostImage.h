//
//  CTSlicehostImage.h
//  iPhone
//
//  Created by Michael Mayo on 3/11/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CTSlicehostImage : NSObject {
	NSUInteger imageId;
	NSString *name;
}

@property (assign) NSUInteger imageId;
@property (retain) NSString *name;

- (NSString *)toXML;

@end
