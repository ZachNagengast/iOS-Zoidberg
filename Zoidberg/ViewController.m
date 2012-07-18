//
//  ViewController.m
//  Zoidberg
//
//  Created by Zachary Nagengast on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "SHK.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize player, main; // the player object

- (void)touchStarted:(id)sender{
   
    longsenderid = [sender currentTitle];
    touchTimer = [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(fireLongPress) userInfo:nil repeats:NO];
    
}
- (void)fireLongPress {
    
    NSString *title = [NSString stringWithFormat:@"'%@' sound from Zoidberg for iPhone",longsenderid];
    NSString *file = [NSString stringWithFormat:@"%@.mp3",longsenderid];
    longsoundFilePath =
    [[NSBundle mainBundle] pathForResource: longsenderid
                                    ofType: @"mp3"];
    NSData *myPDF = [NSData dataWithContentsOfFile:longsoundFilePath];
    SHKItem *item = [SHKItem file:myPDF 
                         filename:file 
                         mimeType:@"audio/mpeg3" 
                            title:title];
    
    [SHK setRootViewController:self];
    // Get the ShareKit action sheet
	actionSheet = [SHKActionSheet actionSheetForItem:item];
    
	// Display the action sheet
	[actionSheet showInView:main];
}

- (void)clicked:(id)sender{

    if ([touchTimer isValid]) [touchTimer invalidate];
    longsenderid = [sender currentTitle];
    
    longsoundFilePath =
    [[NSBundle mainBundle] pathForResource: longsenderid
                                    ofType: @"mp3"];
    
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: longsoundFilePath];
    if(player.isPlaying){
        [player release];
    }
    
    player = [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL error: nil];
    
    [player prepareToPlay];
    [player setDelegate: self];
    [player play];
    }

-(void)holy:(id)sender{
    NSString *soundFilePath =
    [[NSBundle mainBundle] pathForResource: @"holy"
                                    ofType: @"mp3"];
    
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
    if(player.isPlaying){
        [player release];
    }
    player = [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL error: nil];
    
    [player prepareToPlay];
    [player setDelegate: self];
    [player play];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}



@end
