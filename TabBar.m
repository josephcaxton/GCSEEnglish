    //
//  TabBar.m
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 31/12/2010.
//  Copyright 2010 caxtonidowu. All rights reserved.
//

#import "TabBar.h"
#import "VideoPlayer.h"

@implementation TabBar

- (void)tabBar:(UITabBar *)theTabBar didSelectItem:(UITabBarItem *)item  {
	
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
	/*NSString *activetab = [def objectForKey:@"activeTab"];
     
     EvaluatorAppDelegate *appDelegate = (EvaluatorAppDelegate *)[UIApplication sharedApplication].delegate;
     
     
     
     if([item.title isEqualToString:@"Results"]){ //||[item.title isEqualToString:@"Videos"]
     
     //appDelegate.SecondThread = [[NSThread alloc]initWithTarget:self selector:@selector(ShowActivity) object:nil];
     //[appDelegate.SecondThread start];
     
     
     
     
     } */
	
	[def setValue:item.title forKey:@"activeTab"];
	[def synchronize];
	
	
	
	
	
}

- (void)ShowActivity {
	
	@autoreleasepool {
        
		ActivityIndicator *indicator = [[ActivityIndicator alloc]initWithFrame:CGRectMake(0,0,320,420)];
		indicator.tag = 1;
		[self.view addSubview:indicator];
	}
}

-(NSUInteger)supportedInterfaceOrientations{
    
    /*if([self selectedIndex] == 4 )
     {
     if ([[self selectedViewController] isKindOfClass: [MPMoviePlayerViewController class]])
     
     return UIInterfaceOrientationMaskLandscape;
     
     }
     
     NSLog(@"%i",[self selectedIndex]);
     NSLog(@"%@", [self selectedViewController] ); */
    
    return UIInterfaceOrientationMaskPortrait;
    
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    
	//return  (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
	//return (interfaceOrientation == UIInterfaceOrientationPortrait);
	
	return [self.selectedViewController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
    
}



- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}




@end
