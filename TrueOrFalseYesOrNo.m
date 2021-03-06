//
//  TrueOrFalseYesOrNo.m
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 27/10/2010.
//  Copyright 2010 caxtonidowu. All rights reserved.
//

#import "TrueOrFalseYesOrNo.h"
#import "lk_QuestionTemplate.h"
#import "Topics.h"
#import "QuestionHeader.h"
#import "QuestionItems.h"
#import "Answers.h"
#import "TrueOrFalseYesOrNo1.h"
#import "TransparentToolBar.h"

static NSString *kViewKey = @"viewKey";

@implementation TrueOrFalseYesOrNo


@synthesize QuestionTemplate, SelectedTopic; // QuestionHeaderBox; //Search;  //QuestionItemBox
@synthesize fileList, FileListTable, DirLocation,SFileName;
@synthesize  SFileName_Edit,QItem_Edit,QItem_View,AnswerObjects,AnswerControls,True,False,ShowAnswer,RemoveContinueButton,Continue;

int Answerflag_Show = 0;
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

	QuestionHeaderBox =[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 300)];
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
		// this means we are not in edit mode. we are in create mode.
		
		
		if (QItem_Edit) {
		
		NSString *result = [NSString stringWithFormat:@"%@",[QItem_Edit Question]];
		SFileName_Edit = result;
		
		
		UIBarButtonItem *NextButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style: UIBarButtonItemStyleBordered target:self action:@selector(Edit:)];
		self.navigationItem.rightBarButtonItem = NextButton;
		
		}
		else
		{
			// This is QItem_View  : View Mode
			
			CGRect frame = CGRectMake(5, 5, 250, 30);
			self.True =[[UILabel alloc] initWithFrame:frame];
			self.False =[[UILabel alloc] initWithFrame:frame];
			
			self.AnswerControls = [NSArray arrayWithObjects:
								   [NSDictionary dictionaryWithObjectsAndKeys:
									self.True,kViewKey,nil],
								   
								   [NSDictionary dictionaryWithObjectsAndKeys:
									self.False,kViewKey,nil],
								   
								   nil];
			
			NSString *result = [NSString stringWithFormat:@"%@",[QItem_View Question]];
			SFileName_Edit = result;
			
			AnswerObjects=  [[NSMutableArray alloc] initWithArray:[[QItem_View Answers1] allObjects]];
			
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

		}
		
		
		[self loadDocument:[SFileName_Edit stringByDeletingPathExtension] inView:QuestionHeaderBox];
	}
	
	else{
		
		
		UIBarButtonItem *NextButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style: UIBarButtonItemStyleBordered target:self action:@selector(Next:)];
		
		self.navigationItem.rightBarButtonItem = NextButton;
		
		[self loadDocument:[SFileName stringByDeletingPathExtension] inView:QuestionHeaderBox];
	}
	
	[self.view addSubview:QuestionHeaderBox];
	[self.view addSubview:FileListTable];
	
}
-(void)viewWillAppear:(BOOL)animated{
	
	[self willAnimateRotationToInterfaceOrientation:self.interfaceOrientation duration:1];
}

-(IBAction)Next:(id)sender{
	
	TrueOrFalseYesOrNo1 *T_view1 = [[TrueOrFalseYesOrNo1 alloc] initWithNibName:nil bundle:nil];
	
	
	T_view1.QuestionTemplate = self.QuestionTemplate;
	
	T_view1.SelectedTopic = self.SelectedTopic;
	T_view1.SFileNameValue = self.SFileName;
	
	[self.navigationController pushViewController:T_view1 animated:YES];
	
	
	
}

-(IBAction)Edit:(id)sender{
	
	TrueOrFalseYesOrNo1 *T_view1 = [[TrueOrFalseYesOrNo1 alloc] initWithNibName:nil bundle:nil];
	
	T_view1.QItem_ForEdit = QItem_Edit;
	T_view1.QuestionTemplate = (lk_QuestionTemplate *)QItem_Edit.QuestionHeader1.QuestionTemplate;
	
	
	[self.navigationController pushViewController:T_view1 animated:YES];
	
	
	
}

-(IBAction)Cancel:(id)sender{
	
	//[self dismissModalViewControllerAnimated:YES];
}


-(IBAction)ContinueToNextQuestion:(id)sender{
	
	[self.navigationController popViewControllerAnimated:YES];
	
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



-(void)loadDocument:(NSString*)documentName inView:(UIWebView*)webView{
	
	NSString *path = [[NSBundle mainBundle] pathForResource:documentName ofType:@"pdf"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
	
	
}

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



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
	return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // increase the size of the answer cell
    if(indexPath.row == 3){
        
        return 65.0;
    }
    
    else{
        
        
        return 44;
    }
    
}




- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	NSString *title;
	
	if (QItem_View && !ShowAnswer) {
		
		title = @"";
	}
	else if (QItem_View && ShowAnswer){
		
		title = @"The correct answer is :";
	}
	else {
		
		title = @"Available Files";
	}
	
	return title; 
	
	
	
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if(QItem_View && ShowAnswer){
        
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
	
	if (QItem_View  && !ShowAnswer){
		
		count = [AnswerControls count];
		
	}
	else if (QItem_View && ShowAnswer){
		
        NSMutableString *Reason = [NSMutableString stringWithFormat:@"%@",[[AnswerObjects objectAtIndex:0] valueForKey:@"Reason"]];
        if([Reason isEqualToString:@"(null)"] || !Reason) {
            
            count = [AnswerControls count] + 1; // If there is no reason then don't show row for reason
        }
        else {
            
            count = [AnswerControls count] + 2;// adding rows here for Continue button and reason
        }

	}
	
	else {
		
		count = [fileList count];
	}
	
	return count; 
	
}

// Customize the appearance of table view cells.
// Note all answers are on IndexPath row: 0 because there is only one line on the answers table of the database
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    WebViewInCell *cell = (WebViewInCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[WebViewInCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
	if (QItem_Edit != nil) {
		// We are in edit mode here so don't show any row
		if (indexPath.row == 0) {
			cell.textLabel.text =@"You can't select file in edit mode";
		}
		return cell;
		
	}
	
	if (QItem_View !=nil ) {
		
		if (indexPath.row == 0) {
			
			UILabel *LabelField = [[self.AnswerControls objectAtIndex:indexPath.row] valueForKey:kViewKey];
			
			LabelField.adjustsFontSizeToFitWidth = YES;
			LabelField.textColor = [UIColor blackColor];
			LabelField.textAlignment = UITextAlignmentLeft;
			LabelField.tag = indexPath.row;
            LabelField.backgroundColor = [UIColor clearColor];

			
			if ([QuestionTemplate.Description isEqualToString:@"True or False"] ) {
				
				LabelField.text = [NSString stringWithFormat:@"True"];
				if (ShowAnswer && [[[AnswerObjects objectAtIndex:0] valueForKey:@"AnswerText"]boolValue] == TRUE) {
					
					cell.accessoryType = UITableViewCellAccessoryCheckmark;
					
				}
				
			}
			
			else {
				
				
				LabelField.text = [NSString stringWithFormat:@"Yes"];
				if (ShowAnswer && [[[AnswerObjects objectAtIndex:0] valueForKey:@"AnswerText"]boolValue] == TRUE) {
					
					cell.accessoryType = UITableViewCellAccessoryCheckmark;
					
				}
				
			}
			
			[cell.contentView addSubview:LabelField]; 
		}
		else if (indexPath.row	== 1){
			
			UILabel *LabelField = [[self.AnswerControls objectAtIndex:indexPath.row] valueForKey:kViewKey];
			
			LabelField.adjustsFontSizeToFitWidth = YES;
			LabelField.textColor = [UIColor blackColor];
			LabelField.textAlignment = UITextAlignmentLeft;
			LabelField.tag = indexPath.row;
            LabelField.backgroundColor = [UIColor clearColor];
			
			if ([QuestionTemplate.Description isEqualToString:@"True or False"]) {
				
				LabelField.text = [NSString stringWithFormat:@"False"];
				if (ShowAnswer && [[[AnswerObjects objectAtIndex:0] valueForKey:@"AnswerText"]boolValue] == FALSE) {
					
					cell.accessoryType = UITableViewCellAccessoryCheckmark;
					
				}
			}
			else{
				LabelField.text = [NSString stringWithFormat:@"No"];
				if (ShowAnswer && [[[AnswerObjects objectAtIndex:0] valueForKey:@"AnswerText"]boolValue] == FALSE) {
					
					cell.accessoryType = UITableViewCellAccessoryCheckmark;
					
				}
			}
						
			[cell.contentView addSubview:LabelField]; 
		}
		else if (indexPath.row ==2){
			
            NSString *ContinueImageLocation = [[NSBundle mainBundle] pathForResource:@"btn_continue" ofType:@"png"];
            UIImage *ContinueImage = [[UIImage alloc] initWithContentsOfFile:ContinueImageLocation];
            
            Continue = [UIButton buttonWithType:UIButtonTypeCustom];
            [Continue setImage:ContinueImage forState:UIControlStateNormal];

			
			[Continue addTarget:self action:@selector(ContinueToNextQuestion:) forControlEvents:UIControlEventTouchUpInside];
			[cell addSubview:Continue];
            NSMutableString *Reason = [NSMutableString stringWithFormat:@"%@",[[AnswerObjects objectAtIndex:0] valueForKey:@"Reason"]];
            
            
            if([Reason isEqualToString:@"(null)"] || !Reason) {
                
                //ThereIsAnswerReason = 0;
            }
            else 
            { 
                //ThereIsAnswerReason = 1;
                
                NSMutableString *FormatedString = [[NSMutableString alloc]initWithString:@"<p><font size =\"1\" face =\"times new roman \"> "];
                [FormatedString appendFormat:@"<br/>"];
                [FormatedString appendFormat:@"<br/>"];
                [FormatedString appendFormat:@"<br/>"];
                [FormatedString appendString:Reason]; 
                [FormatedString appendString:@"</font></p>"];
                [self configureCell:cell HTMLStr:FormatedString];
                
            }
            

			
			if (self.interfaceOrientation == UIInterfaceOrientationPortrait || self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
				
				Continue.frame = CGRectMake(165, 0, 138, 38);
			}
			else {
				
				Continue.frame = CGRectMake(165, 0, 138, 38);
			}
			
			
		}
		
		
		
		//[cell.contentView addSubview:LabelField]; 
		
		if (ShowAnswer) {
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
		}
        if(ShowAnswer && RemoveContinueButton)
        {
            
            Continue.hidden = YES;
        }

		
		return cell;
	}
	
	
	
	else
	{
		cell.textLabel.text = [NSString stringWithFormat:@"%@",[fileList objectAtIndex:indexPath.row]];
		return cell;
		
	}
	
	
}

- (void)configureCell:(WebViewInCell *)mycell HTMLStr:(NSString *)value; {
    
    mycell.HTMLText =value;
	
}

- (void)AdjustScreenToSee:(int)value{
	
	if(value == 1){
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        CGRect rect = self.FileListTable.frame;
        rect.origin.y = 0;
        rect.size.height = 690;
        self.FileListTable.frame = rect;
        [UIView commitAnimations];
	}
	
	else {
		
	}
    
	
	
}




- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	if (QItem_Edit == nil && QItem_View == nil ){
		//not in edit mode
		NSString *FullFileName = [NSString stringWithFormat:@"%@",[fileList objectAtIndex:indexPath.row]];
		[self setSFileName:FullFileName];
		
		
		[self loadDocument:[SFileName stringByDeletingPathExtension] inView:QuestionHeaderBox];
		
	}
	
	if (QItem_View && !ShowAnswer) {
		
		GCSEEnglishAppDelegate *appDelegate = (GCSEEnglishAppDelegate *)[UIApplication sharedApplication].delegate;
		
		//ObjectAtindex here has been hardcoded as zero reason is only one object is return on this template
		// For this template YES and TRUE will always be on indexpath.Row = 0
		
		NSNumber *Val = [[AnswerObjects objectAtIndex:0] valueForKey:@"AnswerText"];
		// @Val will always be 1.
		
		
		if ([Val boolValue] == TRUE && indexPath.row + 1  == 1) {
			
			
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
		else if ([Val boolValue] == FALSE  && indexPath.row == 1){
			
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
		
		else{
		
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
				
				ShowAnswer = TRUE;
                [self AdjustScreenToSee: 1];
				[tableView reloadData];
				
				
				
				
			}
			
			else {
				
				[self.navigationController popViewControllerAnimated:YES];
			}
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
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	QuestionHeaderBox = nil;
}




@end
