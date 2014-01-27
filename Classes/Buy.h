//
//  Buy.h
//  EvaluatorForIPad
//
//  Created by Joseph caxton-Idowu on 15/02/2011.
//  Copyright 2011 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>
#import "GCSEEnglishAppDelegate.h"


@interface Buy : UITableViewController <SKProductsRequestDelegate,UIGestureRecognizerDelegate,UIAlertViewDelegate,UITextFieldDelegate>{

	
	NSArray *ProductFromIstore;
	NSMutableArray *ProductsToIstore;
	NSArray *ProductsToIStoreInArray;
	NSArray *SortedDisplayProducts;
	CustomStoreObserver *observer;
    UIButton *Restore;
     UITextField *pass;
     SKProduct *selectedproduct;
}

@property (nonatomic, strong) NSArray *ProductFromIstore;
@property (nonatomic, strong) NSMutableArray *ProductsToIstore;
@property (nonatomic, strong) NSArray *ProductsToIStoreInArray;
@property (nonatomic, strong) NSArray *SortedDisplayProducts;
@property (nonatomic, strong) CustomStoreObserver *observer;
@property (nonatomic, strong) UIButton *Restore;
@property (nonatomic, retain) UITextField *pass;
@property (nonatomic, retain) SKProduct *selectedproduct;

- (void)AddProgress;
- (BOOL)isDataSourceAvailable;

@end
