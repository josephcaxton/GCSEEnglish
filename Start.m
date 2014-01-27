//
//  Start.m
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 31/10/2010.
//  Copyright 2010 caxtonidowu. All rights reserved.
//

#import "Start.h"


@implementation Start

@synthesize FirstView, SecondView,FirstTable,SecondTable,QuestionPickerView,CustomDataSource,Sound,ShowAnswers,logoView,Copyright,WebText,StartPractice,iPhone5,DifficultybtnLock,TopicbtnLock,TypeofquestionbtnLock,btnStartTest;


#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 460
#define _TransitionDuration	0.45

- (void)viewDidLoad {
    [super viewDidLoad];
	
     [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], UITextAttributeTextColor,nil] forState:UIControlStateNormal];
    
    GCSEEnglishAppDelegate *appDelegate = (GCSEEnglishAppDelegate *)[UIApplication sharedApplication].delegate;
    if([appDelegate IsThisiPhone5] == YES){
        
        iPhone5 = YES;
    }
    else
    {
        iPhone5 = NO;
    }
    
    

	// First View and Children 
	CGRect FirstViewframe = CGRectMake(0 ,0, SCREEN_WIDTH, SCREEN_HEIGHT);
	self.FirstView = [[UIView alloc] initWithFrame:FirstViewframe];
	//[self.FirstView setBackgroundColor:[UIColor redColor]];
	[self.view addSubview:FirstView];
	[self PageButton:1];
	
	self.FirstTable = [[UITableView alloc] initWithFrame:FirstViewframe style:UITableViewStyleGrouped];
	FirstTable.delegate = self;
	FirstTable.dataSource = self;
	FirstTable.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
	FirstTable.backgroundColor = [UIColor clearColor];
    FirstTable.opaque = NO;
    FirstTable.backgroundView = nil;
    NSString *BackImagePath = [[NSBundle mainBundle] pathForResource:@"back320x450" ofType:@"png"];
	UIImage *BackImage = [[UIImage alloc] initWithContentsOfFile:BackImagePath];
    FirstTable.backgroundColor = [UIColor colorWithPatternImage:BackImage];
	FirstTable.tag = 1;
	[self.FirstView addSubview:FirstTable];
	
	
	
	// Second View and Children --- don't add to subview yet
	CGRect SecondFrame = CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT);
	self.SecondView = [[UIView alloc] initWithFrame:SecondFrame];
	self.SecondView.backgroundColor = [UIColor colorWithPatternImage:BackImage];
    //QuestionPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,162)]; //90
	//CustomDataSource = [[CustomPickerDataSource_Num_Questions alloc] init];
    CGRect SecondTableframe = CGRectMake(0 ,0, SCREEN_WIDTH, SCREEN_HEIGHT);    
    self.SecondTable = [[UITableView alloc] initWithFrame:SecondTableframe style:UITableViewStyleGrouped];
    self.SecondTable.backgroundColor = [UIColor clearColor];
    self.SecondTable.opaque = NO;

	
    
    //Navigation Bar
    
    //UINavigationController *nav =self.navigationController;
    //nav.navigationBar.tintColor = [UIColor blackColor];
    NSString *HeaderLocation = [[NSBundle mainBundle] pathForResource:@"header_bar" ofType:@"png"];
    UIImage *HeaderBackImage = [[UIImage alloc] initWithContentsOfFile:HeaderLocation];
    [self.navigationController.navigationBar setBackgroundImage:HeaderBackImage forBarMetrics:UIBarMetricsDefault];
    //self.navigationItem.title = @"LearnersCloud";
}

-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	[FirstTable reloadData];
	[SecondTable reloadData];
    /*if(CustomDataSource != nil){ // this is the refresh the QuestionPicker after user purchase
        
        CustomDataSource = [[CustomPickerDataSource_Num_Questions alloc] init];
         QuestionPickerView.delegate = CustomDataSource;
         QuestionPickerView.dataSource = CustomDataSource;
        
        GCSEEnglishAppDelegate *appDelegate = (GCSEEnglishAppDelegate *)[UIApplication sharedApplication].delegate;
        if (appDelegate.NumberOfQuestions == [NSNumber numberWithInt:1]) {
            appDelegate.NumberOfQuestions =[NSNumber numberWithInt:1];
            [QuestionPickerView selectRow:0 inComponent:1 animated:YES];  // sets the default on the PickerView to 10
        }
        else
        {
            int NumberofQ = appDelegate.NumberOfQuestions.intValue - 1;
            [QuestionPickerView selectRow:NumberofQ inComponent:1 animated:YES];
            
        }
        
    
    }*/
    
	//[self willAnimateRotationToInterfaceOrientation:self.interfaceOrientation duration:1];
    
    // Lets ask for review after user has viewed videos 5 times
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *ReviewID = [prefs stringForKey:@"Review"];
    NSString *IhaveReviewed = [prefs stringForKey:@"IHaveLeftReview"];
	NSString *MyAccessLevel = [prefs stringForKey:@"AccessLevel"];
    NSInteger AccessLevel = [MyAccessLevel intValue];
    // Note we only want those who have brought to review. Those looking for free talk non-sense.  AccessLevel > 1
    if ([ReviewID isEqualToString:@"5"] && [IhaveReviewed isEqualToString:@"0"] &&  AccessLevel > 1 ) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Review this app" message:@"Do you like this app enough to leave us a review?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        [alertView show];
        
	}
    else {
        
        NSInteger Counter = [ReviewID integerValue];
        NSInteger CounterPlus = Counter + 1;
        NSString *ID = [NSString stringWithFormat:@"%d",CounterPlus];
        [prefs setObject:ID  forKey:@"Review"];
        [prefs synchronize];
        
    }

}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration{
	
if ([self.FirstView superview]) {
		
	
	
	if (interfaceOrientation == UIInterfaceOrientationPortrait ) {
		
		FirstView.frame = CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT);
		FirstTable.frame = CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT);
		
		
		//Copyright.frame = CGRectMake(55,20,240,40);
        if(iPhone5){
            logoView.frame = CGRectMake(45.0,105.0,230,153);
            WebText.frame = CGRectMake(80,380,200,40);
            StartPractice.frame = CGRectMake(35, 300, 250, 47);
        }
        else
        {
            logoView.frame = CGRectMake(45.0,85.0,230,153);
            WebText.frame = CGRectMake(80,300,200,40);
            StartPractice.frame = CGRectMake(35, 250, 250, 47);
        }
		
	}
	
	else {
		
		
		
		FirstView.frame = CGRectMake(0, 0, SCREEN_HEIGHT, SCREEN_WIDTH);
		FirstTable.frame = CGRectMake(0, 0, 480, SCREEN_WIDTH);
		logoView.frame = CGRectMake(100.0,0.0,280,200);
		
		//Copyright.frame = CGRectMake(120,20,280,40);
		WebText.frame = CGRectMake(150,10,200,20);
		StartPractice.frame = CGRectMake(110, 190, 250, 34);
			}
		
}
	else {
		if (interfaceOrientation == UIInterfaceOrientationPortrait) {
			
			self.SecondView.frame = CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT);
			if(iPhone5){
                self.SecondTable.frame = CGRectMake(10 ,0, SCREEN_WIDTH - 20, 230);
            }
            else{
                self.SecondTable.frame = CGRectMake(10 ,0, SCREEN_WIDTH - 20, 210);
            }
			
			//QuestionPickerView.frame = CGRectMake(0,0,SCREEN_WIDTH,162);//90
			//self.Sound.frame =  CGRectMake(200.0, 0.5, 40.0, 45.0);
			//ShowAnswers.frame = CGRectMake(200.0, 0.5, 40.0, 45.0);
		}
		
		else {
			
			self.SecondView.frame = CGRectMake(0,0, 480, SCREEN_HEIGHT);
			self.SecondTable.frame = CGRectMake(0 ,0, 480, SCREEN_WIDTH);
			//QuestionPickerView.frame = CGRectMake(0,0,480,160);
			//self.Sound.frame = CGRectMake(350.0, 10.0, 40.0, 45.0);
			//ShowAnswers.frame = CGRectMake(350.0, 10.0, 40.0, 45.0);
		}

	}


	
	
	
}

/*-(void)CheckOrientation{
	
	[self willAnimateRotationToInterfaceOrientation:self.interfaceOrientation duration:1];
	
	UIInterfaceOrientation interfaceOrientation = [[UIDevice currentDevice] orientation];
	 
	 
	 if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft){
	 
	 logoView.frame = CGRectMake(200.0,0.0,550,600);
	 Copyright.frame = CGRectMake(400,40,320,40);
	 WebText.frame = CGRectMake(450,20,200,20);
	 
	 }
	
}  */


-(IBAction)Practice:(id)sender{
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:_TransitionDuration];
	
	[UIView setAnimationTransition:([self.FirstView superview] ?
									UIViewAnimationTransitionFlipFromRight : UIViewAnimationTransitionFlipFromLeft)
						   forView:self.view cache:YES];
	if ([self.SecondView superview])
	{
		[self.SecondView removeFromSuperview];
		[self.view addSubview:FirstView];
		self.navigationItem.title  = @"";
		[self PageButton:1];
	}
	else
	{
        NSString *AccessLevel = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:@"AccessLevel"];
        
        if([AccessLevel intValue] == 1){
            
            NSString *message = [[NSString alloc] initWithFormat:@"You are using the free version of this app. To unlock all question filters and get unlimited access to over 1000 exam-standard questions, buy in-app today."];
            
            UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"Welcome to LearnersCloud"
                                                           message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        

		
		[self.FirstView removeFromSuperview];
		[self.view addSubview:SecondView];
		
		
		
		
		/*if(CustomDataSource != nil){
            
            CustomDataSource = [[CustomPickerDataSource_Num_Questions alloc] init];
            QuestionPickerView.dataSource = CustomDataSource;
        }

		
		QuestionPickerView.delegate = CustomDataSource;
		QuestionPickerView.showsSelectionIndicator = YES;
		[SecondView  addSubview:QuestionPickerView]; */	
		
		//Add Second Table
		
		SecondTable.delegate = self;
		SecondTable.dataSource = self;
		//SecondTable.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
		SecondTable.tag = 2;
		[self.SecondView addSubview:SecondTable];
		
			
		self.navigationItem.title  =  @"Customise";  //@"Search Engine";
		[self PageButton:2];
	}
	
	[UIView commitAnimations];
	//[self willAnimateRotationToInterfaceOrientation:self.interfaceOrientation duration:1];
	
	
	
	
}

-(IBAction)StartTest:(id)sender{
	

	
	ClientEngine *ce_view = [[ClientEngine alloc] initWithStyle:UITableViewStyleGrouped];

	[self.navigationController pushViewController:ce_view animated:YES];
	
	
}

- (void)switchAction:(UISwitch*)sender{
	
	
	if (sender.tag == 1){
		
		[[NSUserDefaults standardUserDefaults] setBool:sender.on forKey:@"PlaySound"];
	}
	else {
		
		[[NSUserDefaults standardUserDefaults] setBool:sender.on forKey:@"ShowMyAnswers"];
		
	}
	
	
	
}

-(void)PageButton:(int)sender{
	
	if (sender==1) {
		
		//UIBarButtonItem *Practice = [[UIBarButtonItem alloc] initWithTitle:@"Practice Questions" style:UIBarButtonItemStylePlain target:self action:@selector(Practice:)];
        self.navigationItem.rightBarButtonItem = nil;
		self.navigationItem.leftBarButtonItem = nil;
		
		GCSEEnglishAppDelegate *appDelegate = (GCSEEnglishAppDelegate *)[UIApplication sharedApplication].delegate;
		BOOL PlaySound = [[NSUserDefaults standardUserDefaults] boolForKey:@"PlaySound"];
		if (PlaySound == YES) {
			
			[appDelegate PlaySound:@"ArrowWoodImpact"];
			
		}
		
		
	}else {
		
		UIBarButtonItem *Back = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(Practice:)];
		self.navigationItem.leftBarButtonItem = Back;
		
		
		UIBarButtonItem *StartTest = [[UIBarButtonItem alloc] initWithTitle:@"Start Test" style:UIBarButtonItemStylePlain target:self action:@selector(StartTest:)];
		self.navigationItem.rightBarButtonItem = StartTest;
		
		GCSEEnglishAppDelegate *appDelegate = (GCSEEnglishAppDelegate *)[UIApplication sharedApplication].delegate;
		BOOL PlaySound = [[NSUserDefaults standardUserDefaults] boolForKey:@"PlaySound"];
		if (PlaySound == YES) {
			
			[appDelegate PlaySound:@"ArrowWoodImpact"];
			
		}
		
		
		
	}
	
	
}

// For ios 6
-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
    
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    //return NO;
	return  (interfaceOrientation == UIInterfaceOrientationPortrait);
	
	
	
}


#pragma mark -
#pragma mark Table view data source



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	if(tableView.tag == 1){
		
	return 1;
	}
	else {
		return 1;
	}

}

/*- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	NSString *title=@""; 
	
	if (section== 0 && tableView.tag == 1) {
		
		NSString *AccessLevel = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:@"AccessLevel"];
		
		if([AccessLevel intValue] == 1){
			
			title = @"GCSE English Free Version";
		}
		else if ([AccessLevel intValue] == 2){
			
			title = @"GCSE English 250 Questions";
			
		}
		else if ([AccessLevel intValue] == 3){
			
			title = @"GCSE English 500 Questions";
			
		}
		else if ([AccessLevel intValue] == 4){
			
			title = @"GCSE English 750 Questions";
			
		}
		else if ([AccessLevel intValue] == 5){
			
			title = @"GCSE English 1000+ Questions";
			
		}
		
		
		
		
	}
	
	
	else if (tableView.tag == 2 && section == 0){
		title =@"";
		
	}
	
	
	
	return title; 
	
	
	
} */

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
	NSInteger count = 1;
	
	if (tableView.tag == 1){
	
	
	
	}
	
	else {
		count = 7;
	}

	 
	
	return count; 
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1) {
		if (indexPath.section == 0) {
			return 440;
		}
		else {
			return 40;
		}
	}
    else if (tableView.tag == 2){
        if(indexPath.row == 6){
            return 80;
        }
        return 40;
    }
    else{
        
		
		return 40;
	}

	
	




}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
	 
	
	if (tableView.tag == 1) {
		
        tableView.allowsSelection = NO;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.separatorColor = [UIColor clearColor];
        [cell setBackgroundColor:[UIColor clearColor]];
    
        //if (indexPath.section == 0) {
        
        UIView *headerView = [[UIView alloc] init];
        
        NSString *HeaderImagePath = [[NSBundle mainBundle] pathForResource:@"EQ_english_160x78" ofType:@"png"];
        UIImage *HeaderImage = [[UIImage alloc] initWithContentsOfFile:HeaderImagePath];
        UIImageView *HeaderImageView = [[UIImageView alloc] initWithImage:HeaderImage];
        HeaderImageView.frame = CGRectMake(80, 0.0, 160, 78);
        HeaderImageView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        [headerView addSubview:HeaderImageView];
        [cell addSubview:headerView];
        

				if (logoView == nil) {
		
					NSString *LogoPath = [[NSBundle mainBundle] pathForResource:@"hero_230x153" ofType:@"png"];
	
					UIImage *LogoImage = [[UIImage alloc] initWithContentsOfFile:LogoPath];
					logoView = [[UIImageView alloc] initWithImage:LogoImage];
                    
                    if (iPhone5){
                        
                        logoView.frame = CGRectMake(45.0,105.0,230,153);
                        
                    }
                    else{
                        
                        logoView.frame = CGRectMake(45.0,85.0,230,153);
                    }
                    
					
					[cell addSubview:logoView];
                    
        NSString *StartImageLocation = [[NSBundle mainBundle] pathForResource:@"start_practice" ofType:@"png"];
                    
        UIImage *StartImage = [[UIImage alloc] initWithContentsOfFile:StartImageLocation];

					
				StartPractice = [UIButton buttonWithType:UIButtonTypeCustom];
                [StartPractice setImage:StartImage forState:UIControlStateNormal];
                    
                    if (iPhone5){
                        
                        StartPractice.frame = CGRectMake(35, 300, 250, 47);
                        
                    }
                    else{
                        
                        StartPractice.frame = CGRectMake(35, 250, 250, 47);
                    }
                    
                
				[StartPractice addTarget:self action:@selector(Practice:) forControlEvents:UIControlEventTouchUpInside];
				cell.selectionStyle = UITableViewCellSelectionStyleNone;
				[cell addSubview:StartPractice];
				}
		
			//}
			//	else if (indexPath.section == 1) {
					
					//if (Copyright == nil) {
//		
//					Copyright = [[UILabel alloc] initWithFrame:CGRectMake(55,20,240,40)];
//					Copyright.font= [UIFont systemFontOfSize:8.0];
//					Copyright.textColor = [UIColor blueColor];
//					Copyright.text = @"Registered Trademark Owner Theta Computer Services \u00AE 2010";
//					
//					[cell addSubview:Copyright];
//					
//					[Copyright release];
					
					if (WebText == nil) {
                        
                        if (iPhone5){
                            
                            WebText = [[UITextView alloc] initWithFrame:CGRectMake(80,380.0,200,40)];
                            
                        }
                        else{
                            
                            WebText = [[UITextView alloc] initWithFrame:CGRectMake(80,300.0,200,40)];
                        }
                        WebText.textColor = [UIColor whiteColor];
                        WebText.backgroundColor =[UIColor clearColor];
                        WebText.editable = NO;
                        NSString *Website = @"www.LearnersCloud.com";
                        WebText.text = Website;
						[cell addSubview:WebText];
					//[self CheckOrientation];
					}

				//}
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			
		
	}
	else {
        [tableView setBackgroundView:nil];
        [cell setBackgroundColor:[UIColor whiteColor]];
			
			GCSEEnglishAppDelegate *appDelegate = (GCSEEnglishAppDelegate *)[UIApplication sharedApplication].delegate;
         NSString *MyAccessLevel = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:@"AccessLevel"];
		switch (indexPath.row) {
            case 0:
            {
                
                cell.textLabel.text = @"Number of questions";
                cell.detailTextLabel.text = [appDelegate.NumberOfQuestions stringValue];
                break;
            }
            case 1:
            {
                if ([MyAccessLevel intValue] <= 2){
                    
                    cell.userInteractionEnabled = NO;
                    cell.textLabel.enabled = NO;
                    cell.textLabel.text = @"Difficulty";
                    
                    
                    UIImage *imgLock = [UIImage imageNamed:@"Padlock.png"];
                    DifficultybtnLock = [UIButton buttonWithType:UIButtonTypeCustom];
                    DifficultybtnLock.frame = CGRectMake(270, 0.5, 36, 35);
                    
                    
                    [DifficultybtnLock setBackgroundImage:imgLock forState:UIControlStateNormal];
                    [cell addSubview:DifficultybtnLock ];
                    
                }
                else{
                    [DifficultybtnLock removeFromSuperview];
                    
                    cell.userInteractionEnabled = YES;
                    cell.textLabel.enabled = YES;
					cell.textLabel.text = @"Difficulty";
					cell.detailTextLabel.text = appDelegate.Difficulty;
                }
                break;
            }
                
            case 2:
            {
                if ([MyAccessLevel intValue] <= 2){
                    cell.userInteractionEnabled = NO;
                    cell.textLabel.enabled = NO;
                    cell.textLabel.text = @"Topic";
                    
                    UIImage *imgLock = [UIImage imageNamed:@"Padlock.png"];
                    TopicbtnLock = [UIButton buttonWithType:UIButtonTypeCustom];
                    TopicbtnLock.frame = CGRectMake(270,0.5, 36, 35);
                    
                    [TopicbtnLock setBackgroundImage:imgLock forState:UIControlStateNormal];
                    [cell addSubview:TopicbtnLock ];
                    
                }
                
                else{
                    [TopicbtnLock removeFromSuperview];
                    
                    cell.userInteractionEnabled = YES;
                    cell.textLabel.enabled = YES;

                    cell.textLabel.text = @"Topic";
					cell.detailTextLabel.text = appDelegate.Topic;
                }
                
                
                break;
            }
                
            case 3:
            {
                if ([MyAccessLevel intValue] <= 2){
                    cell.userInteractionEnabled = NO;
                    cell.textLabel.enabled = NO;
                    cell.textLabel.text = @"Type of question";
                    
                    UIImage *imgLock = [UIImage imageNamed:@"Padlock.png"];
                    TypeofquestionbtnLock = [UIButton buttonWithType:UIButtonTypeCustom];
                    TypeofquestionbtnLock.frame = CGRectMake(270,0.5, 36, 35);
                    
                    [TypeofquestionbtnLock setBackgroundImage:imgLock forState:UIControlStateNormal];
                    [cell addSubview:TypeofquestionbtnLock ];
                    
                    
                }
                else {
                    [TypeofquestionbtnLock removeFromSuperview];
                    
                    cell.userInteractionEnabled = YES;
                    cell.textLabel.enabled = YES;
					cell.textLabel.text = @"Type of question";
					cell.detailTextLabel.text = appDelegate.TypeOfQuestion;
                }
                break;
            }
                
            case 4:
            {
                if (Sound == nil) {
                    
                    Sound =[[UISwitch alloc] initWithFrame:CGRectMake(0.0, 5.0, 40.0, 30.0)];
                    
                }
                
                
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.textLabel.text = @"Sound";
                
                BOOL PlaySound = [[NSUserDefaults standardUserDefaults] boolForKey:@"PlaySound"];
                
                if (PlaySound ==YES) {
					
                    Sound.on = YES;
                }
                else {
                    Sound.on = NO;
                }
                Sound.tag = 1;
                [Sound addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
                 cell.accessoryView = Sound;
                //[cell.contentView addSubview:Sound];
                break;
            }
                
                
			case 5:
				
            {
                
                if (ShowAnswers == nil) {
                    
                    ShowAnswers =[[UISwitch alloc] initWithFrame:CGRectMake(0.0, 5.0, 40.0, 30.0)];
                }
				
				cell.selectionStyle = UITableViewCellSelectionStyleNone;
				cell.textLabel.text = @"Show answers";
				
				BOOL ShowMyAnswers = [[NSUserDefaults standardUserDefaults] boolForKey:@"ShowMyAnswers"];
				
				if (ShowMyAnswers ==YES) {
					
					ShowAnswers.on = YES;
				}
				else {
					ShowAnswers.on = NO;
				}
				ShowAnswers.tag = 2;
				[ShowAnswers addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
                cell.accessoryView =ShowAnswers;
				//[cell.contentView addSubview:ShowAnswers];
				
				break;
            }
            case 6:
            {
                
                 UIImage *StartImage = [UIImage imageNamed:@"btn_start_test.png"];
                if (btnStartTest == nil) {
                    
                    //UIImage *StartImage = [UIImage imageNamed:@"btn_start_test.png"];
                    btnStartTest = [UIButton buttonWithType:UIButtonTypeCustom];
                    
                    [btnStartTest setBackgroundImage:StartImage forState:UIControlStateNormal];
                    //btnStartTest.frame = CGRectMake(85, 20, 139, 40);
                }
                
				cell.selectionStyle = UITableViewCellSelectionStyleNone;
				[btnStartTest addTarget:self action:@selector(StartTest:) forControlEvents:UIControlEventTouchUpInside];
                btnStartTest.frame = CGRectMake((tableView.bounds.size.width/2) - (StartImage.size.width/2), cell.contentView.center.y, 139, 40);
				[cell.contentView addSubview:btnStartTest];
				
				break;
                
                
            }
                
                
        }
    }
	
    
	
	//[self willAnimateRotationToInterfaceOrientation:self.interfaceOrientation duration:1];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    if (indexPath.row == 0) {
        
        SelectNumberofQuestionsViewController *noofquestions =[[SelectNumberofQuestionsViewController alloc] initWithStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:noofquestions animated:YES];
		
    }
    
    
    
    if (indexPath.row == 1) {
		SelectDifficulty *Difficulty_view = [[SelectDifficulty alloc]initWithNibName:nil bundle:nil];
		Difficulty_view.UserConfigure =  YES;
		[self.navigationController pushViewController:Difficulty_view animated:YES];
		
		
	}
	else if(indexPath.row == 2) {
		
		SelectTopic *Topic_view  =[[SelectTopic alloc] initWithNibName:nil bundle:nil];
		Topic_view.UserConfigure = YES;
		[self.navigationController pushViewController:Topic_view animated:YES];
		
	}
	
	else if(indexPath.row == 3){
		
		SelectQuestionTemplate *QT_view = [[SelectQuestionTemplate alloc] initWithNibName:nil bundle:nil];
		QT_view.UserConfigure = YES;
		[self.navigationController pushViewController:QT_view animated:YES];
		
	}
	
}


- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
	
		
	
	
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 1){
        
        [self reviewPressed];
        
    }
    
    else {
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        NSString *ReviewID = [prefs stringForKey:@"Review"];
        NSInteger Counter = [ReviewID integerValue];
        NSInteger CounterPlus = Counter + 1;
        NSString *ID = [NSString stringWithFormat:@"%d",CounterPlus];
        [prefs setObject:ID  forKey:@"Review"];
        [prefs synchronize];
        
    }
    

    
}

- (void)reviewPressed {
    
    //Set user has reviewed.
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *ID = @"1";
    [prefs setObject:ID forKey:@"IHaveLeftReview"];
    
    [prefs synchronize];
    
    // Report to  analytics
    NSError *error;
    if (![[GANTracker sharedTracker] trackEvent:@"User Sent to Review English Question iPhone at app store"
                                         action:@"User Sent to Review English Question iPhone at app store"
                                          label:@"User Sent to Review English Question iPhone at app store"
                                          value:1
                                      withError:&error]) {
        NSLog(@"error in trackEvent");
    }
    
    
    NSString *str = @"https://userpub.itunes.apple.com/WebObjects/MZUserPublishing.woa/wa/addUserReview?id=435896386&type=Purple+Software"; 
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}





- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	//FirstView = nil;
//	FirstTable = nil;
//	SecondView = nil;
//	SecondTable = nil;
//	QuestionPickerView = nil;
//	CustomDataSource = nil;
//	Sound = nil;
	
	
}




@end
