//
//  Report.h
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 23/11/2010.
//  Copyright 2010 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCSEEnglishAppDelegate.h"

@interface Report : UIViewController  <UITableViewDataSource, UITableViewDelegate, NSXMLParserDelegate>{

	
	
	//UIWebView *WebBox;
	NSMutableArray *CollectionofArrays;
	UIImageView *imageView;
	NSString *FinalString;
	UITableView *ThisTable;
	UIButton *Refresh;
}

//@property (nonatomic, retain) UIWebView *WebBox;
@property (nonatomic, strong) NSMutableArray *CollectionofArrays;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) NSString *FinalString;
@property (nonatomic, strong) UITableView *ThisTable;
@property (nonatomic, strong) UIButton *Refresh;

-(UIImage*)loadLink:(NSString*)linkAddress;
-(void)loadDataFromXML:(NSString *)FileLocation;
-(IBAction)ClearAllLogs:(id)sender;
-(IBAction)RefreshTable:(id)sender;
- (BOOL)isDataSourceAvailable;
//- (void)AddProgress;
@end
