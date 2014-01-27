//
//  QuestionItems.h
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 18/09/2010.
//  Copyright 2010 caxtonidowu. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "QuestionHeader.h"

//@class QuestionHeader;





@interface QuestionItems :  QuestionHeader  
{
}

@property (nonatomic, strong) NSString * Question;
@property (nonatomic, strong) NSNumber * RequireActivityMarker;
@property (nonatomic, strong) NSNumber * NegativeMarking;
@property (nonatomic, strong) NSNumber * AllocatedMark;
@property (nonatomic, strong) NSNumber * AccessLevel;
@property (nonatomic, strong) NSString * AttachmentFile;
@property (nonatomic, strong) NSNumber * Difficulty;
@property (nonatomic, strong) NSString * VideoLink;
@property (nonatomic, strong) NSString * AudioLink;
@property (nonatomic, strong) QuestionHeader * QuestionHeader1;
@property (nonatomic, strong) NSSet* Answers1;

@end


@interface QuestionItems (CoreDataGeneratedAccessors)
- (void)addAnswers1Object:(NSManagedObject *)value;
- (void)removeAnswers1Object:(NSManagedObject *)value;
- (void)addAnswers1:(NSSet *)value;
- (void)removeAnswers1:(NSSet *)value;

@end

