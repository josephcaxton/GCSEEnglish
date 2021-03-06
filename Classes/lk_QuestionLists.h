//
//  lk_QuestionLists.h
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 19/09/2010.
//  Copyright 2010 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lk_QuestionListsCell.h"

@class lk_QuestionTemplate;

@interface lk_QuestionLists : UITableViewController <NSFetchedResultsControllerDelegate,UITextFieldDelegate, UIActionSheetDelegate>{
	
@private
	NSFetchedResultsController *fetchedResultsController;
	NSManagedObjectContext *managedObjectContext;
	
	
	UIView *tableHeaderView;
	UITextField *DescriptionTextField;
	

}

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, strong) IBOutlet UIView *tableHeaderView;
@property (nonatomic, strong) IBOutlet UITextField *DescriptionTextField;


- (void)configureCell:(lk_QuestionListsCell *)mycell atIndexPath:(NSIndexPath *)indexPath;
- (NSManagedObjectContext *)ManagedObjectContext;
- (void)save;

@end
