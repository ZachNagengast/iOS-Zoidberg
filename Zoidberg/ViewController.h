//
//  ViewController.h
//  Zoidberg
//
//  Created by Zachary Nagengast on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "SHK.h";

@interface ViewController : UIViewController{
    IBOutlet UIView *main;
    NSTimer *touchTimer;
    NSString *longsenderid;
    NSString *longsoundFilePath;
    SHKActionSheet *actionSheet;
    
}

@property (strong, nonatomic, retain) AVAudioPlayer *player;

@property (nonatomic, retain) UIView *main;

-(IBAction)clicked:(id)sender;
-(IBAction)holy:(id)sender;
-(IBAction)touchStarted:(id)sender;
-(IBAction)touchHasBeenHeld;

@end
