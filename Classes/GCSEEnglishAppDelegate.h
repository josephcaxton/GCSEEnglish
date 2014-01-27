//
//  GCSEEnglishAppDelegate.h
//  GCSEEnglish
//
//  Created by Joseph caxton-Idowu on 03/05/2011.
//  Copyright 2011 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <AudioToolbox/AudioServices.h>
#import "Sqlite3.h"
#import "CustomStoreObserver.h"
#import "GANTracker.h"
#import <netinet/in.h>
#import "FBConnect.h"
#import "Reachability.h"

@interface GCSEEnglishAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UITabBarController *tabBarController;
    NSManagedObjectContext *managedObjectContext;
    NSManagedObjectModel *managedObjectModel;
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
	NSNumber *AllocatedMarks;
	NSString *Difficulty;
	NSString *Topic;
	NSString *TypeOfQuestion;
	NSNumber *NumberOfQuestions;
	NSNumber *NumberOfQuestionsDisplayed;
	
	NSNumber *PossibleScores;
	NSNumber *ClientScores;
	UITableViewController *buyScreen;
	NSThread *SecondThread;
     BOOL FinishTestNow;
    // this is to handle return from facebook
    
    Facebook *m_facebook;
    
     NSNumber *DeviceScreenType; // if this is IPhone5 then it should be 1136
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) NSNumber *AllocatedMarks;
@property (nonatomic, strong) NSString *Difficulty;
@property (nonatomic, strong) NSString *Topic;
@property (nonatomic, strong) NSString *TypeOfQuestion;
@property (nonatomic, strong) NSNumber *NumberOfQuestions;
@property (nonatomic, strong) NSNumber *NumberOfQuestionsDisplayed;

@property (nonatomic, strong) NSNumber *PossibleScores;
@property (nonatomic, strong) NSNumber *ClientScores;
@property (nonatomic, strong) UITableViewController *buyScreen;
@property (nonatomic, strong) NSThread *SecondThread;
@property (nonatomic, strong)  Facebook *m_facebook;
@property (nonatomic, strong) NSNumber *DeviceScreenType;
@property (nonatomic, assign)  BOOL FinishTestNow;


- (NSString *)applicationDocumentsDirectory;
- (void)PlaySound:(NSString *)FileName;
-(BOOL)CopyDataBase;
-(BOOL)IsThisiPhone5;
-(BOOL)isDeviceConnectedToInternet;


@end

