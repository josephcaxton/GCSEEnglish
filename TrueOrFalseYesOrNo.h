//
//  TrueOrFalseYesOrNo.h
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 27/10/2010.
//  Copyright 2010 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lk_QuestionTemplate.h"
#import "Topics.h"
#import "QuestionItems.h"
#import "GCSEEnglishAppDelegate.h"
#import "CheckExistingFiles.h"
#import <MessageUI/MessageUI.h>
#import "WebViewInCell.h"

@interface TrueOrFalseYesOrNo : UIViewController <UITableViewDataSource, UITableViewDelegate,MFMailComposeViewControllerDelegate>{
	
	lk_QuestionTemplate *QuestionTemplate;
	Topics  *SelectedTopic;
	
	//Question Header
	//UIWebView *QuestionHeaderBox;
	
	NSArray *fileList;
	
	
	NSString *DirLocation; // Location of Dir
	NSString *SFileName; // Short file name
	
	
	//NSString *DirLocation_Edit; // Location of Dir for edit
	NSString *SFileName_Edit; // Short file name for edit
	QuestionItems	*QItem_Edit;
	QuestionItems	*QItem_View;
	
	UITableView *FileListTable;
	
	NSMutableArray *AnswerObjects;
	
	NSArray *AnswerControls;
	
	UILabel *True;
	UILabel *False;
	BOOL ShowAnswer;
    BOOL RemoveContinueButton;
	UIButton *Continue;

}
@property (nonatomic, strong) lk_QuestionTemplate *QuestionTemplate;
@property (nonatomic, strong) Topics  *SelectedTopic;

//@property (nonatomic, retain) UIWebView *QuestionHeaderBox;
@property (nonatomic, strong) NSArray *fileList;
@property (nonatomic, strong)  UITableView *FileListTable;


@property (nonatomic, strong) NSString *DirLocation;
@property (nonatomic, strong) NSString *SFileName;


//@property (nonatomic, retain) NSString *DirLocation_Edit;
@property (nonatomic, strong) NSString *SFileName_Edit;
@property (nonatomic, strong) QuestionItems	*QItem_Edit;
@property (nonatomic, strong) QuestionItems	*QItem_View;

@property (nonatomic, strong) NSMutableArray *AnswerObjects;
@property (nonatomic, strong) NSArray *AnswerControls;

@property (nonatomic, strong) UILabel		*True;
@property (nonatomic, strong) UILabel		*False;
@property (nonatomic, assign) BOOL ShowAnswer;
@property (nonatomic, assign) BOOL RemoveContinueButton;
@property (nonatomic, strong) UIButton *Continue;

-(void)loadDocument:(NSString*)documentName inView:(UIWebView*)webView;
-(IBAction)ContinueToNextQuestion:(id)sender;
- (void)configureCell:(WebViewInCell *)mycell HTMLStr:(NSString *)value;
- (void)AdjustScreenToSee:(int)value;
-(IBAction)StopTest:(id)sender;

@end
