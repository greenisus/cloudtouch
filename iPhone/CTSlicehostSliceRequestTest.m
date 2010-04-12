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
#import "CTSlicehostSlice.h"

// Set these values to real values.  Your API key is available at manage.slicehost.com
// For the existing slice ID, choose a slice you don't abusing :)
#define kAPIKey @"YOUR-API-KEY"
#define kExistingSliceId 12345

static NSUInteger newSliceId = 0;

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

- (void)testCreateSlice {
	[CTSlicehostRequest setAPIKey:kAPIKey];
    CTSlicehostSlice *slice = [CTSlicehostSlice slice];
    slice.name = @"CloudTouchUnitTest123";
    slice.flavorId = 1;
    slice.imageId = 3;
    CTSlicehostSliceRequest *request = [CTSlicehostSliceRequest createSliceRequest:slice];
    [request setTimeOutSeconds:30]; // been taking about 16-17 seconds lately
    [request startSynchronous];
    GHAssertTrue([request responseStatusCode] == 201, [NSString stringWithFormat:@"Failed to create slice: %i", [request responseStatusCode]]);
    
    slice = [request slice];
    newSliceId = slice.sliceId;
}

- (void)testRenameSlice {
	[CTSlicehostRequest setAPIKey:kAPIKey];
    CTSlicehostSliceRequest *request = [CTSlicehostSliceRequest renameSliceRequest:kExistingSliceId name:@"cloudtouchtest"];
    [request startSynchronous];
    NSLog(@"rename code: %i", [request responseStatusCode]);
    GHAssertTrue([request responseStatusCode] == 200, @"Failed to rename slice.");
}

// DELETE https://apikey@api.slicehost.com/slices/xxxx.xml
// + (id)deleteSliceRequest:(NSUInteger)sliceId;

- (void)testDeleteSlice {
    // [CTSlicehostRequest setAPIKey:kAPIKey];
    //     CTSlicehostSliceRequest *request = [CTSlicehostSliceRequest deleteSliceRequest:newSliceId];
    //     [request startSynchronous];
    //     GHAssertTrue([request responseStatusCode] == 200, @"Failed to delete slice.");
}

- (void)testSoftRebootSlice {
    sleep(20);
	[CTSlicehostRequest setAPIKey:kAPIKey];
    CTSlicehostSliceRequest *request = [CTSlicehostSliceRequest softRebootRequest:kExistingSliceId];
    [request startSynchronous];
    NSLog(@"reboot code: %i", [request responseStatusCode]);
    GHAssertTrue([request responseStatusCode] == 200, @"Failed to soft reboot slice.");
}

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
    
    // rebuild, check for success status, and then poll until complete
}

// PUT https://apikey@api.slicehost.com/slices/xxxx/rebuild.xml?backup_id=x
// + (id)rebuildFromBackupRequest:(NSUInteger)sliceId backupId:(NSUInteger)backupId;

- (void)testGetRebuildSliceFromBackup {
	[CTSlicehostRequest setAPIKey:kAPIKey];
    //CTSlicehostSliceRequest *request;

    // rebuild, check for success status, and then poll until complete
}

@end
