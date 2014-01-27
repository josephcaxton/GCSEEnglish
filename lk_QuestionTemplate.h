//
//  lk_QuestionTemplate.h
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 18/09/2010.
//  Copyright 2010 caxtonidowu. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface lk_QuestionTemplate :  NSManagedObject  
{
}

@property (nonatomic, strong) NSDate * LoggedDate;
@property (nonatomic, strong) NSString * Description;
@property (nonatomic, strong) NSSet* QuestionHeaders;

@end


@interface lk_QuestionTemplate (CoreDataGeneratedAccessors)
- (void)addQuestionHeadersObject:(NSManagedObject *)value;
- (void)removeQuestionHeadersObject:(NSManagedObject *)value;
- (void)addQuestionHeaders:(NSSet *)value;
- (void)removeQuestionHeaders:(NSSet *)value;

@end

