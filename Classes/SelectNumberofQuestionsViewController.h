//
//  SelectNumberofQuestionsViewController.h
//  Maths
//
//  Created by Joseph caxton-Idowu on 10/05/2013.
//  Copyright (c) 2013 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCSEEnglishAppDelegate.h"

@interface SelectNumberofQuestionsViewController : UITableViewController{
    
    NSMutableArray *QuestionsNumbers;
    
}

@property (nonatomic, strong)  NSMutableArray *QuestionsNumbers;


-(void)ConfigureList;

@end
