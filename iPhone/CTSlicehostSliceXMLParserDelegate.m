//
//  CTSlicehostServerXMLParserDelegate.m
//  iPhone
//
//  Created by Michael Mayo on 3/12/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "CTSlicehostSliceXMLParserDelegate.h"


@implementation CTSlicehostSliceXMLParserDelegate

@synthesize sliceObjects, currentElement, currentContent, currentObject;

#pragma mark -
#pragma mark XML Parser Delegate

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
	[self setCurrentElement:elementName];
	
	if ([elementName isEqualToString:@"slice"]) {
		[self setCurrentObject:[CTSlicehostSlice slice]];
	}
	[self setCurrentContent:@""];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if ([elementName isEqualToString:@"slice"]) {
		// we're done with this server.  time to move on to the next
		if (sliceObjects == nil) {
			sliceObjects = [[NSMutableArray alloc] init];
		}
		[sliceObjects addObject:currentObject];
		[self setCurrentObject:nil];
	} else if ([elementName isEqualToString:@"name"]) {
		self.currentObject.name = [self currentContent];
	} else if ([elementName isEqualToString:@"image-id"]) {
		self.currentObject.imageId = [[self currentContent] intValue];
	} else if ([elementName isEqualToString:@"addresses"]) {
	} else if ([elementName isEqualToString:@"address"]) {
	} else if ([elementName isEqualToString:@"progress"]) {
		self.currentObject.progress = [[self currentContent] intValue];
	} else if ([elementName isEqualToString:@"id"]) {
		self.currentObject.sliceId = [[self currentContent] intValue];
	} else if ([elementName isEqualToString:@"bw-out"]) {
	} else if ([elementName isEqualToString:@"bw-in"]) {
	} else if ([elementName isEqualToString:@"flavor-id"]) {
		self.currentObject.flavorId = [[self currentContent] intValue];
	} else if ([elementName isEqualToString:@"status"]) {
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	[self setCurrentContent:[[self currentContent] stringByAppendingString:string]];
}

#pragma mark -
#pragma mark Memory Management

- (void)dealloc {
	[sliceObjects release];
	[currentElement release];
	[currentContent release];
	[currentObject release];
	[super dealloc];
}

@end
