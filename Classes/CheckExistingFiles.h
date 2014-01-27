//
//  CheckExistingFiles.h
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 03/12/2010.
//  Copyright 2010 caxtonidowu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCSEEnglishAppDelegate.h"
#import "QuestionItems.h"

@interface CheckExistingFiles : NSObject <NSFetchedResultsControllerDelegate>{

	NSArray *ListofPdfsNotInDataBase;
@private
	NSFetchedResultsController *fetchedResultsController;
	NSManagedObjectContext *managedObjectContext;
	
}
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSArray *ListofPdfsNotInDataBase;

-(id)init;
- (NSManagedObjectContext *)ManagedObjectContext;


@end
