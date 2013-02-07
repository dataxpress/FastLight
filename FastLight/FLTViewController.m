//
//  FLTViewController.m
//  FastLight
//
//  Created by Tim Gostony on 2/7/13.
//  Copyright (c) 2013 Tim Gostony. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "FLTViewController.h"

@interface FLTViewController ()

@end

@implementation FLTViewController

#pragma mark - view handling

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - light management

-(void)setLightEnabled:(BOOL)lightEnabled
{
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch])
    {
        [device lockForConfiguration:nil];
        
        if(lightEnabled)
        {
            if([device respondsToSelector:@selector(setTorchModeOnWithLevel:error:)])
            {
                // if they have the iOS 6 API, set phasers to kill
                [device setTorchModeOnWithLevel:AVCaptureMaxAvailableTorchLevel error:nil];
            }
            else
            {
                [device setTorchMode:AVCaptureTorchModeOn];
            }
        }
        else
        {
            [device setTorchMode:AVCaptureTorchModeOff];
        }
    
            
        [device unlockForConfiguration];
    }
    
    
}

#pragma mark - memory management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
