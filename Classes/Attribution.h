//
//  Attribution.h
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 14/02/2011.
//  Copyright 2011 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Attribution : UIViewController <UIWebViewDelegate>{
	
	UIWebView *WebBox;

}

@property (nonatomic, strong) UIWebView *WebBox;
-(void)loadDocument:(NSString*)documentName inView:(UIWebView*)webView;



@end