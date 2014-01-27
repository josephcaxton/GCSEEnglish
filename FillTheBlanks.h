//
//  FillTheBlanks.h
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 30/10/2010.
//  Copyright 2010 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lk_QuestionTemplate.h"
#import "Topics.h"
#import "QuestionItems.h"
#import "FillTheBlanks1.h"
#import "GCSEEnglishAppDelegate.h"
#import "CheckExistingFiles.h"
#import <MessageUI/MessageUI.h>
#import "WebViewInCell.h"

@interface FillTheBlanks : UIViewController <UITableViewDataSource, UITableViewDelegate,UITextFieldDelegate,MFMailComposeViewControllerDelegate>{
	
	lk_QuestionTemplate *QuestionTemplate;
	Topics  *SelectedTopic;
	
	//Question Header
	//UIWebView *QuestionHeaderBox;
	
	//UILabel *AuthorizeText;
	
	NSArray *fileList;
	
	
	NSString *DirLocation; // Location of Dir
	NSString *SFileName; // Short file name
	
	
	//NSString *DirLocation_Edit; // Location of Dir for edit
	NSString *SFileName_Edit; // Short file name for edit
	QuestionItems	*QItem_Edit;
	
	UITableView *FileListTable;
	
	QuestionItems	*QItem_View;
	
	NSMutableArray *AnswerObjects;
	
	UITextField *Answer1;
	UITextField *Answer2;
	UITextField *Answer3;
	UITextField *Answer4;
	UITextField *Answer5;
	
	NSArray *AnswerControls;
	BOOL ShowAnswer;
     BOOL RemoveContinueButton;
    BOOL Specialflag;
    BOOL FromClientAnswer;
	UIButton *Continue;

}
@property (nonatomic, strong) lk_QuestionTemplate *QuestionTemplate;
@property (nonatomic, strong) Topics  *SelectedTopic;

//@property (nonatomic, retain) UIWebView *QuestionHeaderBox;

//@property (nonatomic, retain) UILabel *AuthorizeText;
@property (nonatomic, strong) NSArray *fileList;
@property (nonatomic, strong)  UITableView *FileListTable;

@property (nonatomic, strong) NSString *DirLocation;
@property (nonatomic, strong) NSString *SFileName;

//@property (nonatomic, retain) NSString *DirLocation_Edit;
@property (nonatomic, strong) NSString *SFileName_Edit;
@property (nonatomic, strong) QuestionItems	*QItem_Edit;
@property (nonatomic, strong) QuestionItems	*QItem_View;
@property (nonatomic, strong) NSMutableArray *AnswerObjects;

@property (nonatomic, strong) UITextField   *Answer1;
@property (nonatomic, strong) UITextField	*Answer2;
@property (nonatomic, strong) UITextField	*Answer3;
@property (nonatomic, strong) UITextField	*Answer4;
@property (nonatomic, strong) UITextField	*Answer5;
@property (nonatomic, strong) NSArray *AnswerControls;
@property (nonatomic, assign) BOOL ShowAnswer;
@property (nonatomic, assign) BOOL RemoveContinueButton;
@property (nonatomic, assign) BOOL Specialflag;
@property (nonatomic, assign) BOOL FromClientAnswer;
@property (nonatomic, strong) UIButton *Continue;

//@property (nonatomic, retain) IBOutlet UIWebView *QuestionItemBox;
//@property (nonatomic, retain) IBOutlet UISearchBar *Search;

-(void)loadDocument:(NSString*)documentName inView:(UIWebView*)webView;
-(IBAction)ContinueToNextQuestion:(id)sender;
- (void)configureCell:(WebViewInCell *)mycell HTMLStr:(NSString *)value;
- (void)AdjustScreenToSee:(int)value;
-(IBAction)StopTest:(id)sender;


@end
