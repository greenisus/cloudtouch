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

// Set these values to real values.  Your API key is available at manage.slicehost.com
// For the existing slice ID, choose a slice you don't abusing :)
#define kAPIKey @"YOUR-API-KEY"
#define kExistingSliceId 12345

@implementation CTSlicehostSliceRequestTest

- (void)testListSlices {
	[CTSlicehostRequest setAPIKey:kAPIKey];
	CTSlicehostSliceRequest *request = [CTSlicehostSliceRequest listRequest];	
	[request startSynchronous];
	GHAssertTrue([[request slices] count] > 0, @"Failed to retrieve slices");
}

- (void)testGetSlice {
	[CTSlicehostRequest setAPIKey:kAPIKey];
    CTSlicehostSliceRequest *request = [CTSlicehostSliceRequest getSliceRequest:kExistingSliceId];
    [request startSynchronous];
    GHAssertTrue([request slice] != nil, @"Failed to retrieve slice");
}

// POST https://apikey@api.slicehost.com/slices.xml
// + (id)createSliceRequest:(CTSlicehostSlice *)slice;

- (void)testCreateSlice {
	[CTSlicehostRequest setAPIKey:kAPIKey];
    //CTSlicehostSliceRequest *request;
}

// PUT https://apikey@api.slicehost.com/slices/xxxx.xml rename
// + (id)renameSliceRequest:(NSUInteger)sliceId name:(NSString *)name;

- (void)testRenameSlice {
	[CTSlicehostRequest setAPIKey:kAPIKey];
    //CTSlicehostSliceRequest *request;
}

// DELETE https://apikey@api.slicehost.com/slices/xxxx.xml
// + (id)deleteSliceRequest:(NSUInteger)sliceId;

- (void)testDeleteSlice {
	[CTSlicehostRequest setAPIKey:kAPIKey];
    //CTSlicehostSliceRequest *request;
}

// PUT https://apikey@api.slicehost.com/slices/xxxx/reboot.xml 
// + (id)softRebootRequest:(NSUInteger)sliceId;

- (void)testSoftRebootSlice {
    sleep(20);
	[CTSlicehostRequest setAPIKey:kAPIKey];
    CTSlicehostSliceRequest *request = [CTSlicehostSliceRequest softRebootRequest:kExistingSliceId];
    [request startSynchronous];
    NSLog(@"reboot code: %i", [request responseStatusCode]);
    GHAssertTrue([request responseStatusCode] == 200, @"Failed to soft reboot slice.");
}

// PUT https://apikey@api.slicehost.com/slices/xxxx/hard_reboot.xml 
// + (id)hardRebootRequest:(NSUInteger)sliceId;

- (void)testHardRebootSlice {
    sleep(20);
	[CTSlicehostRequest setAPIKey:kAPIKey];
    CTSlicehostSliceRequest *request = [CTSlicehostSliceRequest hardRebootRequest:kExistingSliceId];
    [request startSynchronous];
    NSLog(@"hard reboot code: %i", [request responseStatusCode]);
    GHAssertTrue([request responseStatusCode] == 200, @"Failed to hard reboot slice.");
}

// PUT https://apikey@api.slicehost.com/slices/xxxx/rebuild.xml?image_id=x 
// + (id)rebuildFromImageRequest:(NSUInteger)sliceId imageId:(NSUInteger)imageId;

- (void)testRebuildSliceFromImage {
	[CTSlicehostRequest setAPIKey:kAPIKey];
    //CTSlicehostSliceRequest *request;
}

// PUT https://apikey@api.slicehost.com/slices/xxxx/rebuild.xml?backup_id=x
// + (id)rebuildFromBackupRequest:(NSUInteger)sliceId backupId:(NSUInteger)backupId;

- (void)testGetRebuildSliceFromBackup {
	[CTSlicehostRequest setAPIKey:kAPIKey];
    //CTSlicehostSliceRequest *request;
}

@end
