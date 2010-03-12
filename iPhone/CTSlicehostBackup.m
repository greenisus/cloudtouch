//
//  CTSlicehostBackup.m
//  iPhone
//
//  Created by Michael Mayo on 3/11/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "CTSlicehostBackup.h"


@implementation CTSlicehostBackup

@synthesize name, sliceId, date;

/*
 <backup>
	 <id>3-426157</id>
	 <slice_id>27288</slice_id>
	 <name>snapshot</name>
	 <date>Wed Jul 22 17:01:03 UTC 2009</date>
 </backup> 
*/
- (void)dealloc {
	[name release];
	[date release];
	[super dealloc];
}

@end
