//
//  QuestionHeader.h
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 18/09/2010.
//  Copyright 2010 caxtonidowu. All rights reserved.
//

#import <CoreData/CoreData.h>

@class lk_QuestionTemplate;
@class Topics;

@interface ImageToDataTransformer : NSValueTransformer{
	
}
@end


@interface QuestionHeader :  NSManagedObject  
{
}

@property (nonatomic, strong) NSDate * LoggedDate;
@property (nonatomic, strong) NSDate * DateAutorized;
@property (nonatomic, strong) NSNumber * Autorize;
@property (nonatomic, strong) NSManagedObject * QuestionInfo;
@property (nonatomic, strong) NSManagedObject * QuestionTemplate;
@property (nonatomic, strong) NSManagedObject * QuestionHeader_Topic;
@property (nonatomic, strong) NSSet* QuestionItems;

@end


@interface QuestionHeader (CoreDataGeneratedAccessors)
- (void)addQuestionItemsObject:(NSManagedObject *)value;
- (void)removeQuestionItemsObject:(NSManagedObject *)value;
- (void)addQuestionItems:(NSSet *)value;
- (void)removeQuestionItems:(NSSet *)value;

@end

