//
//  CTSlicehostSliceRequestTest.m
//  iPhone
//
//  Created by Michael Mayo on 3/12/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "CTSlicehostSliceRequestTest.h"
#import "CTSlicehostRequest.h"
#import "CTSlicehostSliceRequest.h"


@implementation CTSlicehostSliceRequestTest

- (void)testListSlices {
	[CTSlicehostRequest setAPIKey:@"YOUR-API-KEY"];
	CTSlicehostSliceRequest *request = [CTSlicehostSliceRequest listRequest];
	[request start];
	GHAssertTrue([[request slices] count] > 0, @"Failed to retrieve slices");
}

// GET https://apikey@api.slicehost.com/slices.xml
// + (id)listRequest;
// - (NSArray *)slices;

// GET https://apikey@api.slicehost.com/slices/xxxx.xml
// + (id)getSliceRequest:(NSUInteger)sliceId;
// - (CTSlicehostSlice *)slice;

// POST https://apikey@api.slicehost.com/slices.xml
// + (id)createSliceRequest:(CTSlicehostSlice *)slice;

// PUT https://apikey@api.slicehost.com/slices/xxxx.xml rename
// + (id)renameSliceRequest:(NSUInteger)sliceId name:(NSString *)name;

// DELETE https://apikey@api.slicehost.com/slices/xxxx.xml
// + (id)deleteSliceRequest:(NSUInteger)sliceId;

// PUT https://apikey@api.slicehost.com/slices/xxxx/reboot.xml 
// + (id)softRebootRequest:(NSUInteger)sliceId;

// PUT https://apikey@api.slicehost.com/slices/xxxx/hard_reboot.xml 
// + (id)hardRebootRequest:(NSUInteger)sliceId;

// PUT https://apikey@api.slicehost.com/slices/xxxx/rebuild.xml?image_id=x 
// + (id)rebuildFromImageRequest:(NSUInteger)sliceId imageId:(NSUInteger)imageId;

// PUT https://apikey@api.slicehost.com/slices/xxxx/rebuild.xml?backup_id=x
// + (id)rebuildFromBackupRequest:(NSUInteger)sliceId backupId:(NSUInteger)backupId;


@end
