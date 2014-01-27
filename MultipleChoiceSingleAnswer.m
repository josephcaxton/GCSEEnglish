//
//  MultipleChoiceSingleAnswer.m
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 28/09/2010.
//  Copyright 2010 caxtonidowu. All rights reserved.
//

#import "MultipleChoiceSingleAnswer.h"
#import "TransparentToolBar.h"


@implementation MultipleChoiceSingleAnswer

@synthesize QuestionTemplate, SelectedTopic; //, QuestionHeaderBox; //Search;  //QuestionItemBox
@synthesize  fileList, FileListTable, DirLocation,SFileName;
@synthesize   SFileName_Edit,QItem_Edit,QItem_View;//DirLocation_Edit,
@synthesize AnswerObjects,CorrectAnswers,MultichoiceAnswers,SelectedAnswers,AnswerCounter,ShowAnswer,Continue,HighlightedAnswers;

int Answerflag = 0;
//int ThereIsAnswerReasonflag = 0;
static UIWebView *QuestionHeaderBox = nil;
#pragma mark -
#pragma mark View lifecycle

#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 470

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //To fix ios7 extending edges
    if([UIViewController instancesRespondToSelector:@selector(edgesForExtendedLayout)]){
        
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }

	
	if (!QuestionHeaderBox) {
		
		QuestionHeaderBox =[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 300)];
	}
	
	QuestionHeaderBox.scalesPageToFit = YES;
	self.FileListTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 160, SCREEN_WIDTH, SCREEN_HEIGHT - 170) style:UITableViewStyleGrouped];
	FileListTable.delegate = self;
	FileListTable.dataSource = self;
	//FileListTable.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    
    
    [self.FileListTable setBackgroundView:nil];
    NSString *BackImagePath = [[NSBundle mainBundle] pathForResource:@"back320x450" ofType:@"png"];
	UIImage *BackImage = [[UIImage alloc] initWithContentsOfFile:BackImagePath];
    self.FileListTable.backgroundColor = [UIColor colorWithPatternImage:BackImage];
    
	
	// Now I have added 1000 pdfs to the bundle. App is now ver slow
	// I don't need this to go live, it is just for admin only so i comment out CheckExistingFiles

	//CheckExistingFiles *ExistingFiles = [[CheckExistingFiles alloc]init];
	//NSArray *lists = ExistingFiles.ListofPdfsNotInDataBase;
	
	//self.fileList = lists; 
	
	
	//if ([fileList count ]  > 0) {
		
	//	NSString *FullFileName = [NSString stringWithFormat:@"%@",[fileList objectAtIndex:0]];
	//	[self setSFileName:[FullFileName lastPathComponent]];
		
		
	//}
	

	if (QItem_Edit != nil || QItem_View != nil) {
		// this means we are in edit or view  mode. we are not in create mode.
		
		 
		if (QItem_Edit) {
			
			NSString *result = [NSString stringWithFormat:@"%@",[QItem_Edit Question]];
			SFileName_Edit = result;
			
			UIBarButtonItem *NextButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style: UIBarButtonItemStyleBordered target:self action:@selector(Edit:)];
			self.navigationItem.rightBarButtonItem = NextButton;
		}
		else
		{
            
            if(!ShowAnswer){
            // create a toolbar where we can place some buttons
            TransparentToolBar* toolbar = [[TransparentToolBar alloc]
                                           initWithFrame:CGRectMake(250, 0, 200, 45)];
            
            
            
            // create an array for the buttons
            NSMutableArray* buttons = [[NSMutableArray alloc] initWithCapacity:3];
            
            UIBarButtonItem *SendSupportMail = [[UIBarButtonItem alloc] initWithTitle:@"Report Problem" style: UIBarButtonItemStyleBordered target:self action:@selector(ReportProblem:)];
            
            [buttons addObject:SendSupportMail];
            
            
            // create a spacer between the buttons
            UIBarButtonItem *spacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil
                                       action:nil];
            [buttons addObject:spacer];
            
            
         
                
                
                UIBarButtonItem *EndTestnow = [[UIBarButtonItem alloc] initWithTitle:@"Stop Test" style: UIBarButtonItemStyleBordered target:self action:@selector(StopTest:)];
                
                
                [buttons addObject:EndTestnow];
         
            
            
            [toolbar setItems:buttons animated:NO];
            
            // place the toolbar into the navigation bar
            self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                                      initWithCustomView:toolbar];
			
            }
			
			NSString *result = [NSString stringWithFormat:@"%@",[QItem_View Question]];
			SFileName_Edit = result;
			
			AnswerObjects=  [[NSMutableArray alloc] initWithArray:[[QItem_View Answers1] allObjects]];
			
			// Get all correct answer Objects put them into CorrectAnswers
			CorrectAnswers = [[NSMutableArray alloc] init];
			for (int i = 0; i < [AnswerObjects count]; i++) {
				
				int Correct = [[[AnswerObjects objectAtIndex:i] valueForKey:@"Correct"]intValue];
				
				if ( Correct == 1) {
					[CorrectAnswers addObject:[AnswerObjects objectAtIndex:i]];
                    
                    
				}
			}
			
			MultichoiceAnswers = [[NSMutableArray alloc] init];
			SelectedAnswers = [[NSMutableArray alloc] init];
			AnswerCounter = [[NSMutableArray alloc] init];
			HighlightedAnswers = [[NSMutableArray alloc] init];
			
		}
		
		
		
		
		[self loadDocument:[SFileName_Edit stringByDeletingPathExtension] inView:QuestionHeaderBox];
	}
	
	
	else{
		
		// Create mode
		
	UIBarButtonItem *NextButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style: UIBarButtonItemStyleBordered target:self action:@selector(Next:)];
	
	self.navigationItem.rightBarButtonItem = NextButton;
	 
	[self loadDocument:[SFileName stringByDeletingPathExtension] inView:QuestionHeaderBox];
	}
	
	[self.view addSubview:QuestionHeaderBox];
	
	[self.view addSubview:FileListTable];
}

-(void)viewWillAppear:(BOOL)animated{
	
	
	Answerflag = 0;
	[self willAnimateRotationToInterfaceOrientation:self.interfaceOrientation duration:1];
	
}

-(IBAction)Next:(id)sender{
	
	MultipleChoiceSingleAnswer1 *M_view1 = [[MultipleChoiceSingleAnswer1 alloc] initWithNibName:nil bundle:nil];
	
	
	M_view1.QuestionTemplate = self.QuestionTemplate;
	M_view1.SelectedTopic = self.SelectedTopic;
	M_view1.SFileNameValue = self.SFileName;
	
	[self.navigationController pushViewController:M_view1 animated:YES];
	
	
	
}

-(IBAction)Edit:(id)sender{
	
	MultipleChoiceSingleAnswer1 *M_view1 = [[MultipleChoiceSingleAnswer1 alloc] initWithNibName:nil bundle:nil];
	
	M_view1.QItem_ForEdit = QItem_Edit;
	
	//M_view1.QuestionTemplate = self.QuestionTemplate;
	//M_view1.SelectedTopic = self.SelectedTopic;
	//M_view1.SFileNameValue = self.SFileName;
	
	[self.navigationController pushViewController:M_view1 animated:YES];
	
	
	
}

-(IBAction)ReportProblem:(id)sender{
	
	if ([MFMailComposeViewController canSendMail]) {
		
		NSArray *SendTo = [NSArray arrayWithObjects:@"Support@LearnersCloud.com",nil];
		
		MFMailComposeViewController *SendMailcontroller = [[MFMailComposeViewController alloc]init];
		SendMailcontroller.mailComposeDelegate = self;
		[SendMailcontroller setToRecipients:SendTo];
		[SendMailcontroller setSubject:[NSString stringWithFormat:@"Ref %@ problem English question detected on IPhone/IPod",[[NSString stringWithFormat:@"%@",QItem_View.Question] stringByDeletingPathExtension]]];
		
		[SendMailcontroller setMessageBody:[NSString stringWithFormat:@"Question Number %@ -- \n Add your message below ", [[NSString stringWithFormat:@"%@",QItem_View.Question] stringByDeletingPathExtension]] isHTML:NO];
		[self presentModalViewController:SendMailcontroller animated:YES];
		
	}
	
	else {
		UIAlertView *Alert = [[UIAlertView alloc] initWithTitle: @"Cannot send mail" 
														message: @"Device is unable to send email in its current state. Configure email" delegate: self 
											  cancelButtonTitle: @"Ok" otherButtonTitles: nil];
		
		
		
		[Alert show];
		
	}
	
	
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error{
	
	
	[self becomeFirstResponder];
	[self dismissModalViewControllerAnimated:YES];
	
	
	
	
}


-(IBAction)ContinueToNextQuestion:(id)sender{
	
	[self.navigationController popViewControllerAnimated:YES];
	
}

-(IBAction)Cancel:(id)sender{
	
  //[self dismissModalViewControllerAnimated:YES];
}

/*-(void)CheckAppDirectory:(NSString *)Location{
	
	NSFileManager *FM = [NSFileManager defaultManager];
	BOOL isDir = YES;
	
	if (![FM fileExistsAtPath:Location isDirectory:&isDir]) {
		NSError **error = nil;
		if (![FM createDirectoryAtPath:Location withIntermediateDirectories:YES attributes:nil error:error]) {
			
				NSLog(@"Error: Create folder failed Reason: %@",error);

		}
	}
	
} */

/*-(NSString *) getApplicationDirectory{
	
	
	NSArray *array = [[NSBundle mainBundle] pathsForResourcesOfType:@"pdf" inDirectory:nil];
	
	for (NSString *filePath in array) {
		
		NSLog(@"%@", [filePath lastPathComponent]);
		
	}
	
	
	
	 NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *result = [documentsDirectory stringByAppendingString:@"/Evaluator_Questions/Data"];
	return @"finish"; 
	

	
} */

-(void)loadDocument:(NSString*)documentName inView:(UIWebView*)webView{

    NSString *path = [[NSBundle mainBundle] pathForResource:documentName ofType:@"pdf"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
	
	
}


//- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
	
//	NSLog(@"%@", searchBar.text);
	
//}
/*
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	if (textField == self.LFileName) {
		[LFileName resignFirstResponder];
		
	}
	DirLocation = [self.getApplicationDirectory stringByAppendingString:@"/"];
	
	NSString *FullLocation = [DirLocation stringByAppendingString:(@"%@",LFileName.text)]; 
	//NSLog(@"test %@", FullLocation);
	
	[self loadDocument:FullLocation inView:self.QuestionHeaderBox];
	return YES;
}

 */
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);

}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration{
	
	if (interfaceOrientation == UIInterfaceOrientationPortrait ) {
		
		QuestionHeaderBox.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 300);
		self.FileListTable.frame = CGRectMake(0, 160, SCREEN_WIDTH, SCREEN_HEIGHT - 170);
		Continue.frame = CGRectMake(165, 0, 138, 38);
		
	}
	
	else {
		
		QuestionHeaderBox.frame = CGRectMake(80, 0, SCREEN_HEIGHT - 122, 160);
		self.FileListTable.frame = CGRectMake(0, 160, SCREEN_HEIGHT + 30, SCREEN_HEIGHT - 160);
		Continue.frame = CGRectMake(165, 0, 138, 38);
	}
	
	
}



#pragma mark -
#pragma mark Table view data source



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
	if (QItem_View && Answerflag == 1) {
		
		return 2;
	}
	
	else{
		
		return 1;
		
	}
	
}


#define  SECTION_ONE  0
#define  SECTION_TWO  1
#define  SECTION_THREE 2

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	NSString *title;
	
	if (QItem_View && Answerflag == 0) {
		
		title = @"";
	}
	else if (QItem_View && Answerflag == 1 && section == 1){
		
		title = @"The correct answer is :";
	}
	else {
		
		title = @"Available Files";
	}
	
	return title; 
	
	
	
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if(QItem_View && Answerflag == 1 && section == 1){
        
        UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 300.0, 44.0)];
        
        // create the button object
        UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.opaque = NO;
        headerLabel.textColor = [UIColor whiteColor];
        headerLabel.font = [UIFont boldSystemFontOfSize:10];
        headerLabel.frame = CGRectMake(10.0, 0.0, 300.0, 44.0);
        
        headerLabel.text = @"The correct answer is :";
        [customView addSubview:headerLabel];
        
        
        return customView;
    }
    return nil;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
	NSInteger count;
	
	if (QItem_View && section == 0){
		
		count = [AnswerObjects count];
		
	}
	else if (QItem_View && section == 1){
		
		count = [CorrectAnswers count]+ 1 ;// I am adding one more row here to add Continue button
	}
	else {
		
		count = [fileList count];
	}
	
	return count; 
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = nil; //@"Cell" used nil here to stop table moving text to other cells
    
    WebViewInCell *cell = (WebViewInCell *)[tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil) {
        cell = [[WebViewInCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
		if (QItem_Edit != nil) {
			// We are in edit mode here so don't show any row
			 if (indexPath.row == 0) {
				 cell.textLabel.text =@"You can't select file in edit mode";
			 }
			return cell;
			
		}
	
	if (QItem_View && [QuestionTemplate.Description isEqualToString:@"Multiple Choice Multiple Answer"]) {
		
		int correct = [[[AnswerObjects objectAtIndex:indexPath.row] valueForKey:@"Correct"]intValue];
		
		if (correct == 1){
			
			[MultichoiceAnswers addObject:[AnswerObjects objectAtIndex:indexPath.row]];
			if (ShowAnswer) {
				
				cell.accessoryType = UITableViewCellAccessoryCheckmark;	
			}
		}
		
	}
	
		if (QItem_View !=nil ) {
			
			//i have had to use the detailtextLabel here because some text are very long
			if (indexPath.section == 1) {
				// This will show the answers and add a button to continue
				if (indexPath.row < [CorrectAnswers count]) {
					//NSLog(@"%i -- %i", indexPath.row,[CorrectAnswers count]);
					
					//cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",[[CorrectAnswers objectAtIndex:indexPath.row] valueForKey:@"AnswerText"]];
					NSMutableString *AnswerText = [NSMutableString stringWithFormat:@"%@",[[CorrectAnswers objectAtIndex:indexPath.row] valueForKey:@"AnswerText"]];
                    NSMutableString *Reason = [NSMutableString stringWithFormat:@"%@",[[CorrectAnswers objectAtIndex:indexPath.row] valueForKey:@"Reason"]];
                    
					NSMutableString *FormatedString = [[NSMutableString alloc]initWithString:@"<p><font size =\"2\" face =\"times new roman \"> "];
					[FormatedString appendString:AnswerText];
                    [FormatedString appendFormat:@"<br/>"];
                    if([Reason isEqualToString:@"(null)"] || !Reason) {
                        
                    }
                    else 
                    { 
                        
                        [FormatedString appendString:Reason]; 
                        
                    }
                    

					[FormatedString appendString:@"</font></p>"];
					[self configureCell:cell HTMLStr:FormatedString];
					cell.accessoryType = UITableViewCellAccessoryCheckmark;
					cell.selectionStyle = UITableViewCellSelectionStyleNone;
				}
				else {
					
                    NSString *ContinueImageLocation = [[NSBundle mainBundle] pathForResource:@"btn_continue" ofType:@"png"];
                    UIImage *ContinueImage = [[UIImage alloc] initWithContentsOfFile:ContinueImageLocation];
                    
                    Continue = [UIButton buttonWithType:UIButtonTypeCustom];
                    [Continue setImage:ContinueImage forState:UIControlStateNormal];
					
					
					[Continue addTarget:self action:@selector(ContinueToNextQuestion:) forControlEvents:UIControlEventTouchUpInside];
					[cell addSubview:Continue];
					
					cell.selectionStyle = UITableViewCellSelectionStyleNone;
					if (self.interfaceOrientation == UIInterfaceOrientationPortrait || self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
						
						Continue.frame = CGRectMake(165, 0, 138, 38);
					}
					else {
						
						Continue.frame = CGRectMake(165, 0, 138, 38);
					}
					
				}
				
				
			}
			
			else{
				
				
				//cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",[[AnswerObjects objectAtIndex:indexPath.row] valueForKey:@"AnswerText"]];
				NSMutableString *value = [NSMutableString stringWithFormat:@"%@",[[AnswerObjects objectAtIndex:indexPath.row] valueForKey:@"AnswerText"]];
				NSMutableString *FormatedString = [[NSMutableString alloc]initWithString:@"<p><font size =\"2\" face =\"times new roman\"> "];
				[FormatedString appendString:value];
				[FormatedString appendString:@"</font></p>"];	
				[self configureCell:cell HTMLStr:FormatedString];
			}
			
			if (ShowAnswer && [[[AnswerObjects objectAtIndex:indexPath.row] valueForKey:@"Correct"]intValue] == 1) {
				cell.accessoryType = UITableViewCellAccessoryCheckmark;
				
			}
			if (ShowAnswer) {
				cell.selectionStyle = UITableViewCellSelectionStyleNone;
			}
			
			return cell;
			
		}
			
	  else
		{
			NSString *FileName = [NSString stringWithFormat:@"%@",[fileList objectAtIndex:indexPath.row]];
			cell.textLabel.text = [FileName lastPathComponent];
			return cell;
		
		}

	
	
	
	
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//	
//	cell.selectionStyle = UITableViewCellSelectionStyleGray;
//	
//	
//}
- (void)configureCell:(WebViewInCell *)mycell HTMLStr:(NSString *)value; {
    
    mycell.HTMLText =value;
	
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // increase the size of the answer cell, but ignore the the continue button cell 
    if (indexPath.section == 1 && indexPath.row != [CorrectAnswers count] && Answerflag == 1) {
        
		return 270.0;
		
	}
	return 40;

}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}









#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     
	// This looks very messy don't blame me. I should have split this screen though
	// This screen is used 3 times.
	
	if (QItem_Edit == nil && QItem_View == nil){
		//not in edit mode
	NSString *FullFileName = [NSString stringWithFormat:@"%@",[fileList objectAtIndex:indexPath.row]];
	
	[self setSFileName:FullFileName];

	
	[self loadDocument:[SFileName stringByDeletingPathExtension] inView:QuestionHeaderBox];
	}

	if (QItem_View && [QuestionTemplate.Description isEqualToString:@"Multiple Choice Single Answer"] && !ShowAnswer && Answerflag == 0) {
		
		GCSEEnglishAppDelegate *appDelegate = (GCSEEnglishAppDelegate *)[UIApplication sharedApplication].delegate;
		
		NSNumber *Val = [[AnswerObjects objectAtIndex:indexPath.row] valueForKey:@"Correct"];
		
		if ([Val boolValue] == YES) {
			
			
			//Play Clappy Sound 
			BOOL PlaySound = [[NSUserDefaults standardUserDefaults] boolForKey:@"PlaySound"];
			if (PlaySound == YES) {
				
				[appDelegate PlaySound:@"Clapping"];
				
			}
			
			
			// Users Answer is correct so add the marks on the question to appdelegate.ClientScores
			
			
			NSInteger Counter = [[appDelegate ClientScores]intValue];
			NSNumber *Marks =QItem_View.AllocatedMark;
			
			Counter += [Marks intValue];
			
			appDelegate.ClientScores = [NSNumber numberWithInt:Counter];
			
			[self.navigationController popViewControllerAnimated:YES];
			
			
		}
		
		else {
			// Users Answer is wrong
			// So Do nothing
			
			//Play Saddy Sound
			BOOL PlaySound = [[NSUserDefaults standardUserDefaults] boolForKey:@"PlaySound"];
			if (PlaySound == YES) {
			[appDelegate PlaySound:@"Cough"];
				
			}
			
			// if user want answer to be shown then show answer
			
			BOOL ShowMyAnswer = [[NSUserDefaults standardUserDefaults] boolForKey:@"ShowMyAnswers"];
			
			if (ShowMyAnswer == YES){
				
                UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
                cell.contentView.backgroundColor=[UIColor redColor];
				//  Don't worry about this madness it works All i am trying to so is add a section to the table dynamically 
				//to show answer and the continue button.
				Answerflag = 1;
				[tableView beginUpdates];
				NSIndexSet *indices = [NSIndexSet indexSetWithIndex:1];
				[tableView insertSections:indices withRowAnimation:UITableViewRowAnimationFade];
				[tableView endUpdates];
				[self AdjustScreenToSee: Answerflag];
				
				
			}
			
			else {
				
				[self.navigationController popViewControllerAnimated:YES];
			}
			
			
			
		}
		
		
	}
	
					   
		else if (QItem_View && [QuestionTemplate.Description isEqualToString:@"Multiple Choice Multiple Answer"] && !ShowAnswer){
			
			// Now this loop is to check if the user is clicking the same row on the table twice. If so ignore that click
				
			for (int i = 0; i < [AnswerCounter count]; i++) {
				
				if ([AnswerCounter objectAtIndex:i] == [NSNumber numberWithInt:indexPath.row]) {
					
					return;
					
				}
				
				
			}
			
			
			[AnswerCounter addObject:[NSNumber numberWithInt:indexPath.row]];
			
			
			NSNumber *Val = [[AnswerObjects objectAtIndex:indexPath.row] valueForKey:@"Correct"];
			if ([Val boolValue] == YES) {
				
				// Add it to the collection of right answers
				[SelectedAnswers addObject:Val];
				
				// change the color of the cell to show the user it has been selected, an intresting workaround
				if (indexPath.section == 0) {
				
					[HighlightedAnswers addObject:indexPath];
					for (int i = 0; i < [HighlightedAnswers count]; i++) {
					
					UITableViewCell* theCell = [tableView cellForRowAtIndexPath:[HighlightedAnswers objectAtIndex:i]];
					theCell.contentView.backgroundColor=[UIColor blueColor];

					}
				}
				
				// If All the answers are correct and the SelectedAnswer are the same number of Answers then Add to score
				if ([SelectedAnswers count ] == [MultichoiceAnswers count]) {
					
					GCSEEnglishAppDelegate *appDelegate = (GCSEEnglishAppDelegate *)[UIApplication sharedApplication].delegate;
					
					BOOL PlaySound = [[NSUserDefaults standardUserDefaults] boolForKey:@"PlaySound"];
					if (PlaySound == YES) {
					
					[appDelegate PlaySound:@"Clapping"];
					}
					// Users Answer is correct so add the marks on the question to appdelegate.ClientScores
					
					NSInteger Counter = [[appDelegate ClientScores]intValue];
					NSNumber *Marks =QItem_View.AllocatedMark;
					
					Counter += [Marks intValue];
					
					appDelegate.ClientScores = [NSNumber numberWithInt:Counter];
					
					[self.navigationController popViewControllerAnimated:YES];
				
				}
			}
			
				
			else if ([AnswerCounter count] == [MultichoiceAnswers count]) {
					
					GCSEEnglishAppDelegate *appDelegate = (GCSEEnglishAppDelegate *)[UIApplication sharedApplication].delegate;
               
                UITableViewCell* theCell = [tableView cellForRowAtIndexPath:indexPath];
                theCell.contentView.backgroundColor=[UIColor redColor];
					
				BOOL PlaySound = [[NSUserDefaults standardUserDefaults] boolForKey:@"PlaySound"];
				if (PlaySound == YES) {
					
					[appDelegate PlaySound:@"Cough"];
					
				}
				// if user want answer to be shown then show answer
				
				BOOL ShowMyAnswer = [[NSUserDefaults standardUserDefaults] boolForKey:@"ShowMyAnswers"];
				
				if (ShowMyAnswer == YES){
					
					Answerflag = 1;
					[tableView beginUpdates];
					NSIndexSet *indices = [NSIndexSet indexSetWithIndex:1];
					[tableView insertSections:indices withRowAnimation:UITableViewRowAnimationFade];
					
					[tableView endUpdates];
					[self AdjustScreenToSee: Answerflag];
					
				}
				else {
					
					[self.navigationController popViewControllerAnimated:YES];
					
				}
			}
			
			else {
				
				GCSEEnglishAppDelegate *appDelegate = (GCSEEnglishAppDelegate *)[UIApplication sharedApplication].delegate;
                
                UITableViewCell* theCell = [tableView cellForRowAtIndexPath:indexPath];
                theCell.contentView.backgroundColor=[UIColor redColor];
				
				BOOL PlaySound = [[NSUserDefaults standardUserDefaults] boolForKey:@"PlaySound"];
				if (PlaySound == YES) {
					
					[appDelegate PlaySound:@"Cough"];
					
				}
				// if user want answer to be shown then show answer
				
				BOOL ShowMyAnswer = [[NSUserDefaults standardUserDefaults] boolForKey:@"ShowMyAnswers"];
				
				if (ShowMyAnswer == YES){
					
					Answerflag = 1;
					[tableView beginUpdates];
					NSIndexSet *indices = [NSIndexSet indexSetWithIndex:1];
					[tableView insertSections:indices withRowAnimation:UITableViewRowAnimationFade];
					
					[tableView endUpdates];
					[self AdjustScreenToSee: Answerflag];
				}
				
			}
		}
}


- (void)AdjustScreenToSee:(int)value{
	
	if(value == 1){
        
       GCSEEnglishAppDelegate *appDelegate = (GCSEEnglishAppDelegate *)[UIApplication sharedApplication].delegate;
        if([appDelegate IsThisiPhone5] == YES){
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            CGRect rect = self.FileListTable.frame;
            rect.origin.y = -220; // I have changes this to -180 because English has mostly 3 possible answers
            rect.size.height = 690;
            self.FileListTable.frame = rect;
            [UIView commitAnimations];
            
        }
        else{
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            CGRect rect = self.FileListTable.frame;
            rect.origin.y = -220; // I have changes this to -180 because English has mostly 3 possible answers
            rect.size.height = 590;
            self.FileListTable.frame = rect;
            [UIView commitAnimations];
            
        }
        
    }
	
	
}

-(IBAction)StopTest:(id)sender {
    
    GCSEEnglishAppDelegate *appDelegate = (GCSEEnglishAppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.FinishTestNow = YES;
    [self ContinueToNextQuestion:nil];
}

 

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	//NSLog(@"Memory warning from Joseph %i", [QuestionHeaderBox retainCount]);
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
	//NSLog(@"%i", [QuestionHeaderBox retainCount]);
	QuestionHeaderBox = nil;
}




@end

