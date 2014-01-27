//
//  lk_QuestionListsCell.h
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 19/09/2010.
//  Copyright 2010 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lk_QuestionTemplate.h"

@interface lk_QuestionListsCell : UITableViewCell {
	
	lk_QuestionTemplate *QuestionTemplate;
	
	UILabel *lblDescription;
	UILabel *lblLoggedDate;
	
}

@property (nonatomic, strong) lk_QuestionTemplate *QuestionTemplate;

@property (nonatomic, strong) UILabel *lblDescription;
@property (nonatomic, strong) UILabel *lblLoggedDate;


@end
