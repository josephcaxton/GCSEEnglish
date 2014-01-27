//
//  ClientEngine.h
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 06/11/2010.
//  Copyright 2010 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "stdlib.h"
#import "GCSEEnglishAppDelegate.h"
#import "Topics.h"
#import "lk_QuestionTemplate.h"
#import "QuestionItems.h"
#import "QuestionHeader.h"
#import "MBProgressHUD.h"

@interface ClientEngine : UITableViewController <NSFetchedResultsControllerDelegate,MBProgressHUDDelegate> {
	
	
	
@private
	NSFetchedResultsController *fetchedResultsController;
	NSManagedObjectContext *managedObjectContext;
	
	NSFetchedResultsController *fetchedResultsController_Topics;
	NSFetchedResultsController *fetchedResultsController_QT;
	
	NSNumber *Difficulty;
	Topics  *SelectedTopic;
	lk_QuestionTemplate *QuestionTemplate;
	
	NSArray *ListofQuestions;
	
	
	NSExpression *DifficultyColumn;
	NSExpression *DifficultyValue;
	
	NSPredicate *DifficultyPredicate;
	
	NSExpression *SelectedTopicColumn;
	NSExpression *SelectedTopicValue;
	
	NSPredicate *SelectedTopicPredicate;
	
	NSExpression *QuestionTemplateColumn;
	NSExpression *QuestionTemplateValue;
	
	NSPredicate *QuestionTemplatePredicate;
	
	NSExpression *AccessLevelColumn;
	NSExpression *AccessLevelValue;
	
	NSPredicate *AccessLevelPredicate;
	
	NSMutableArray *PopBox;
	NSArray *UnchangedArray;
	NSTimer	*timer;
	BOOL ExitFlag;
	NSMutableArray *NumberCounter;  // Just for numbering
	NSArray *CollectedObjects;
	NSMutableArray *SelectedArrays;
	MBProgressHUD *HUD;
	

}
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController_Topics;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController_QT;

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, strong) Topics  *SelectedTopic;
@property (nonatomic, strong) lk_QuestionTemplate *QuestionTemplate;
@property (nonatomic, strong) NSArray *ListofQuestions;

@property (nonatomic, strong) NSExpression *DifficultyColumn;
@property (nonatomic, strong) NSExpression *DifficultyValue;
@property (nonatomic, strong) NSPredicate *DifficultyPredicate;

@property (nonatomic, strong) NSExpression *SelectedTopicColumn;
@property (nonatomic, strong) NSExpression *SelectedTopicValue;
@property (nonatomic, strong) NSPredicate *SelectedTopicPredicate;

@property (nonatomic, strong) NSExpression *QuestionTemplateColumn;
@property (nonatomic, strong) NSExpression *QuestionTemplateValue;
@property (nonatomic, strong) NSPredicate *QuestionTemplatePredicate;

@property (nonatomic, strong) NSExpression *AccessLevelColumn;
@property (nonatomic, strong) NSExpression *AccessLevelValue;
@property (nonatomic, strong) NSPredicate *AccessLevelPredicate;

@property (nonatomic, strong) NSMutableArray *PopBox;
@property (nonatomic, strong) NSArray *UnchangedArray; 
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) BOOL ExitFlag;  // this flag is to fix a bug to clear the timer object hold on this controller
@property (nonatomic, strong) NSMutableArray *NumberCounter;
@property (nonatomic, strong) NSArray *CollectedObjects ;
@property (nonatomic, strong) NSMutableArray *SelectedArrays;
@property (nonatomic, strong)  MBProgressHUD *HUD;

- (NSManagedObjectContext *)ManagedObjectContext;

-(NSNumber*) ConfigureDifficulty;
@end
