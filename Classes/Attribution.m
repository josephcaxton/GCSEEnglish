    //
//  Attribution.m
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 14/02/2011.
//  Copyright 2011 caxtonidowu. All rights reserved.
//

#import "Attribution.h"


@implementation Attribution

@synthesize WebBox;

#pragma mark -
#pragma mark Initialization

#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 450



- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationItem.title = @"Acknowledgements";
    self.WebBox = [[UIWebView alloc ] initWithFrame:CGRectMake(0, 0, 320, 480)];
	self.WebBox.scalesPageToFit = YES;
	self.WebBox.delegate = self;
	
	
	[self loadDocument:@"AttributionIphone" inView:self.WebBox];
	[self.view addSubview:WebBox];
	
}

-(void)loadDocument:(NSString*)documentName inView:(UIWebView*)webView{
	
    NSString *path = [[NSBundle mainBundle] pathForResource:documentName ofType:@"pdf"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
	
	
}




- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	[self willAnimateRotationToInterfaceOrientation:self.interfaceOrientation duration:1];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration{
	
	if (interfaceOrientation == UIInterfaceOrientationPortrait ) {
		
		self.WebBox.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
		
		
	}
	
	else {
		
		self.WebBox.frame = CGRectMake(80, 0, SCREEN_HEIGHT - 122, SCREEN_WIDTH);
		
	}
	
	
}





- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    WebBox = nil;
	[super viewDidUnload];
}




@end
