//
//  SelectTopic.h
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 03/10/2010.
//  Copyright 2010 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"Topics.h"
#import "lk_QuestionTemplate.h"
#import "MultipleChoiceSingleAnswer.h"
#import "DescriptiveType.h"
#import "TrueOrFalseYesOrNo.h"
#import "FillTheBlanks.h"

@interface SelectTopic : UITableViewController <NSFetchedResultsControllerDelegate,UIActionSheetDelegate>{
	
	Topics  *SelectedTopic;
	lk_QuestionTemplate *SelectedTemplate;
	
	BOOL UserConfigure;
@private
	NSFetchedResultsController *fetchedResultsController;
	NSManagedObjectContext *managedObjectContext;

}
@property (nonatomic, strong) Topics  *SelectedTopic;
@property (nonatomic, strong) lk_QuestionTemplate *SelectedTemplate;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic) BOOL UserConfigure;
-(IBAction)Back:(id)sender;

- (NSManagedObjectContext *)ManagedObjectContext;

@end
