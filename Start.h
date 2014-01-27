//
//  Start.h
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 31/10/2010.
//  Copyright 2010 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomPickerDataSource_Num_Questions.h"
#import "SelectDifficulty.h"
#import "SelectTopic.h"
#import "SelectQuestionTemplate.h"
#import "ClientEngine.h"
#import "GCSEEnglishAppDelegate.h"
#import "SelectNumberofQuestionsViewController.h"

@interface Start : UIViewController  <UITableViewDataSource, UITableViewDelegate,UIAlertViewDelegate>{  //UIPickerViewDelegate, UIPickerViewDataSource
	
	UIView *FirstView;
	UIView *SecondView;
	UITableView *FirstTable;
	UITableView *SecondTable;
	
	UIPickerView *QuestionPickerView;
	CustomPickerDataSource_Num_Questions *CustomDataSource;
	
	UISwitch *Sound;
	UISwitch *ShowAnswers;
	
	UIImageView *logoView;
	UILabel *Copyright;
	UITextView *WebText;
    UIButton *btnStartTest;
	UIButton *__unsafe_unretained StartPractice;
    BOOL iPhone5;
    
    UIButton *DifficultybtnLock;
    UIButton *TopicbtnLock;
    UIButton *TypeofquestionbtnLock;
	
	
}

@property (nonatomic, strong) UIView *FirstView;
@property (nonatomic, strong) UIView *SecondView;
@property (nonatomic, strong) UITableView *FirstTable;
@property (nonatomic, strong) UITableView *SecondTable;
@property (nonatomic, strong) UIPickerView *QuestionPickerView;

@property (nonatomic, strong) CustomPickerDataSource_Num_Questions *CustomDataSource;
@property (nonatomic, strong) UISwitch *Sound;
@property (nonatomic, strong) UISwitch *ShowAnswers;
@property (nonatomic, strong) UIImageView *logoView;
@property (nonatomic, strong) UILabel *Copyright;
@property (nonatomic, strong) UITextView *WebText;
@property (nonatomic, unsafe_unretained) UIButton *StartPractice;
@property (nonatomic, assign) BOOL iPhone5;

@property (nonatomic, strong) UIButton *DifficultybtnLock;
@property (nonatomic, strong) UIButton *TopicbtnLock;
@property (nonatomic, strong) UIButton *TypeofquestionbtnLock;
@property (nonatomic, strong) UIButton *btnStartTest;



-(IBAction)Practice:(id)sender;
-(IBAction)StartTest:(id)sender;
-(void)PageButton:(int)sender;
@end
