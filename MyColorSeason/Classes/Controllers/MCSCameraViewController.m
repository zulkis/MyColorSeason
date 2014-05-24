//
//  MCSCameraViewController.m
//  MyColorSeason
//
//  Created by Alexey Minaev on 18/05/14.
//  Copyright (c) 2014 Alexey MInaev. All rights reserved.
//

#import "MCSCameraViewController.h"

#import "MCSCameraView.h"

#import <DBCameraManager.h>

@interface MCSCameraViewController () <DBCameraViewControllerDelegate, DBCameraViewDelegate>

- (DBCameraManager*)cameraManager;

@end

@implementation MCSCameraViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    MCSCameraView *cameraView = (MCSCameraView *)[MCSCameraView initWithCaptureSession:self.cameraManager.captureSession];
    
    [cameraView setDelegate:self];
    [cameraView buildInterface];
    
    self.cameraView = cameraView;
    
    self.delegate = self;
}

@end
