//
//  Answers.h
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 18/09/2010.
//  Copyright 2010 caxtonidowu. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "QuestionItems.h"


@interface Answers :  QuestionItems  
{
}

@property (nonatomic, strong) NSString * Reason;
@property (nonatomic, strong) NSNumber * Correct;
@property (nonatomic, strong) NSString * AnswerText;
@property (nonatomic, strong) NSString * PictureAnnotation;
@property (nonatomic, strong) NSManagedObject * QuestionItem;

@end



