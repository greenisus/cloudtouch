//
//  CTSlicehostServerXMLParserDelegate.h
//  iPhone
//
//  Created by Michael Mayo on 3/12/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTSlicehostSlice.h"


@interface CTSlicehostSliceXMLParserDelegate : NSObject {
	
	NSMutableArray *sliceObjects;
	
	// Internally used while parsing the response
	NSString *currentContent;
	NSString *currentElement;
	CTSlicehostSlice *currentObject;
}

@property (retain) NSMutableArray *sliceObjects;

@property (retain) NSString *currentElement;
@property (retain) NSString *currentContent;
@property (retain) CTSlicehostSlice *currentObject;

@end
