//
//  LearnersCloudSamplesVideos.h
//  EvaluatorForIPad
//
//  Created by Joseph caxton-Idowu on 21/02/2011.
//  Copyright 2011 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCSEEnglishAppDelegate.h"

@interface LearnersCloudSamplesVideos : UITableViewController <UIWebViewDelegate>{

	NSMutableArray *listofItems;
	NSMutableArray *ImageNames;
    UIButton *LCButton;
	
}

@property (nonatomic, strong) NSMutableArray *listofItems;
@property (nonatomic, strong) NSMutableArray *ImageNames;
@property (nonatomic, strong) UIButton *LCButton;

- (void)WebsitebuttonPressed;


@end
