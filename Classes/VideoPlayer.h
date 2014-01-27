//
//  VideoPlayer.h
//  EvaluatorForIPad
//
//  Created by Joseph caxton-Idowu on 21/02/2011.
//  Copyright 2011 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h> 

@interface VideoPlayer : UIViewController {
    
	//MPMoviePlayerController *moviePlayerController;
	NSString *VideoFileName;
    
    NSString *ServerLocation;
    NSURLCredential *credential;
    NSURLProtectionSpace *protectionSpace;
    MPMoviePlayerViewController *moviePlayerViewController;
    
	
}
@property (nonatomic, strong) NSString *VideoFileName;
@property (nonatomic, strong) NSString *ServerLocation;
@property (nonatomic, strong) NSURLCredential *credential;
@property (nonatomic, strong) NSURLProtectionSpace *protectionSpace;
@property (nonatomic, strong) MPMoviePlayerViewController *moviePlayerViewController;


@end
