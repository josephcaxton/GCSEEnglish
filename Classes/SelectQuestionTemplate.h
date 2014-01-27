//
//  SelectQuestionTemplate.h
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 01/10/2010.
//  Copyright 2010 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lk_QuestionTemplate.h"

@interface SelectQuestionTemplate : UITableViewController <NSFetchedResultsControllerDelegate,UIActionSheetDelegate>{

	
	lk_QuestionTemplate *SelectedTemplate;
	BOOL UserConfigure;
@private
	NSFetchedResultsController *fetchedResultsController;
	NSManagedObjectContext *managedObjectContext;
	
}
@property (nonatomic, strong) lk_QuestionTemplate *SelectedTemplate;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic) BOOL UserConfigure;
-(IBAction)Back:(id)sender;

- (NSManagedObjectContext *)ManagedObjectContext;


@end
