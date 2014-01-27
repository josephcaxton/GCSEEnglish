//
//  TrueOrFalseYesOrNo1.h
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 27/10/2010.
//  Copyright 2010 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lk_QuestionTemplate.h"
#import "Topics.h"
#import "QuestionHeader.h"
#import "QuestionItems.h"
#import "Answers.h"


@interface TrueOrFalseYesOrNo1 : UIViewController <UITableViewDataSource, UITableViewDelegate> {

	lk_QuestionTemplate *QuestionTemplate;
	Topics  *SelectedTopic;
	
	QuestionItems	*QItem_ForEdit;
	
	NSString *SFileNameValue;
	
	UITableView *DisplayTable;
	NSIndexPath *DisplayedIndexPath;
	UISwitch *RequireActivityMarker;
	
	UISwitch *Authorize;
	
	
	UILabel *True;
	UILabel *False;
	
	
	BOOL Truetick;
	
	
	
	NSArray *AnswerControls;
	NSMutableArray *AnswerObjects;
	
@private
	NSFetchedResultsController *fetchedResultsController;
	NSManagedObjectContext *managedObjectContext;
	
}

@property (nonatomic, strong) lk_QuestionTemplate *QuestionTemplate;
@property (nonatomic, strong) Topics  *SelectedTopic;
@property (nonatomic, strong) QuestionItems	*QItem_ForEdit;

@property (nonatomic, strong) NSString *SFileNameValue;
@property (nonatomic, strong)  UITableView *DisplayTable;
@property (nonatomic, strong) NSIndexPath *DisplayedIndexPath;
@property (nonatomic, strong) UISwitch *RequireActivityMarker;
@property (nonatomic, strong) UISwitch *Authorize;


@property (nonatomic, strong) UILabel		*True;
@property (nonatomic, strong) UILabel		*False;


@property (nonatomic) BOOL Truetick;


@property (nonatomic, strong) NSArray *AnswerControls;
@property (nonatomic, strong) NSMutableArray *AnswerObjects;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

- (NSManagedObjectContext *)ManagedObjectContext;



@end
