//
//  ClientAnswers.h
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 24/11/2010.
//  Copyright 2010 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionItems.h"
#import "MultipleChoiceSingleAnswer.h"
#import "DescriptiveType.h"
#import "TrueOrFalseYesOrNo.h"
#import	"FillTheBlanks.h"


@interface ClientAnswers : UITableViewController {

	
	NSArray *FullDataArray;
	NSMutableArray *PopBox;
	NSMutableArray *NumberCounter;  // Just for numbering
}
@property (nonatomic, strong) NSArray *FullDataArray; 
@property (nonatomic, strong) NSMutableArray *PopBox;
@property (nonatomic, strong) NSMutableArray *NumberCounter;

@end
