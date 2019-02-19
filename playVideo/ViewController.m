//
//  ViewController.m
//  playVideo
//
//  Created by 张岳涛 on 19/2/14.
//  Copyright © 2019年 张岳涛. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()

@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // NSString *filePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp4"];
    // NSURL *sourceMovieURL = [NSURL fileURLWithPath:filePath];
    
    // _moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:sourceMovieURL];
    // _moviePlayer.view.frame=CGRectMake(0, 0, 320, 320);
    // _moviePlayer.controlStyle=MPMovieControlStyleNone;
    
    // Play the movie!
    // [self.moviePlayer play];
    // [self.view addSubview:_moviePlayer.view];
    
    

    
}


- (IBAction)play:(id)sender {
    
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp4"]]];
    
    [self.moviePlayer.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:self.moviePlayer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieFinishedCallback:) name:MPMoviePlayerPlaybackDidFinishNotification object:self.moviePlayer];
    
    
    // Play the movie!
    
    [self.view addSubview:self.moviePlayer.view];
    [self.moviePlayer prepareToPlay];
    [self.moviePlayer play];
    
 
    
    
}


- (void)movieFinishedCallback:(NSNotification *) aNotification {
    
    [self.moviePlayer stop];
    [self.moviePlayer.view removeFromSuperview];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
