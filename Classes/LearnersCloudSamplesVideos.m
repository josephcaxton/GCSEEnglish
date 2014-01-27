    //
//  LearnersCloudSamplesVideos.m
//  EvaluatorForIPad
//
//  Created by Joseph caxton-Idowu on 21/02/2011.
//  Copyright 2011 caxtonidowu. All rights reserved.
//

#import "LearnersCloudSamplesVideos.h"
#import "VideoPlayer.h"

@implementation LearnersCloudSamplesVideos

@synthesize listofItems,ImageNames,LCButton;

//static MPMoviePlayerController *moviePlayerController = nil; 

//- (id) initWithCoder: (NSCoder *) coder {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
  //  if (self = [super initWithStyle:UITableViewStyleGrouped]) {
   // }
 //   return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
	
    self.navigationItem.title = @"GCSE Sample Videos";
    
    NSString *HeaderLocation = [[NSBundle mainBundle] pathForResource:@"header_bar" ofType:@"png"];
    UIImage *HeaderBackImage = [[UIImage alloc] initWithContentsOfFile:HeaderLocation];
    [self.navigationController.navigationBar setBackgroundImage:HeaderBackImage forBarMetrics:UIBarMetricsDefault];
    
    self.tableView.backgroundView = nil;
    NSString *BackImagePath = [[NSBundle mainBundle] pathForResource:@"back320x450" ofType:@"png"];
	UIImage *BackImage = [[UIImage alloc] initWithContentsOfFile:BackImagePath];
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:BackImage];

    
	listofItems = [[NSMutableArray alloc] init];
	ImageNames = [[NSMutableArray alloc] init];
	// Add items to the array this is hardcoded for now .. may need to be migrated to the database
	[listofItems addObject:@"   Maths - Trailer"];
	[ImageNames addObject:@"Maths.png"];
	[listofItems addObject:@"   English - Trailer"];
	[ImageNames addObject:@"English.png"];
	[listofItems addObject:@"   Physics - Trailer"];
	[ImageNames addObject:@"Physics.png"];
	[listofItems addObject:@"   Chemistry - Trailer"];
	[ImageNames addObject:@"Chemistry.png"];
    [listofItems addObject:@"    Biology - Trailer"];
    [ImageNames addObject:@"Biology.png"];
//	[listofItems addObject:@"Batteries"];
//	[ImageNames addObject:@"Batteries.png"];
//	[listofItems addObject:@"The Ruined Maid"];
//	[ImageNames addObject:@"Ruined_maid.png"];
//	[listofItems addObject:@"Les Grand Seigneurs"];
//	[ImageNames addObject:@"LesGrandSeignors.png"];
//	[listofItems addObject:@"Horse Whisperer"];
//	[ImageNames addObject:@"HorseWhisperer.png"];
//	[listofItems addObject:@"Hunchback in the Park"];
//	[ImageNames addObject:@"Hunchback.png"];
//	[listofItems addObject:@"The Clown Punk"];
//	[ImageNames addObject:@"ClownPunk.png"];
//	[listofItems addObject:@"Concave Convex Rap"];
//	[ImageNames addObject:@"Convexrap.png"];

	//Get the files and stream from website
	
	//NSString *File = [self GetFilesFromURL];
	//NSLog(@"%@", File);
	
	
}

//- (NSString*)GetFilesFromURL{
//	
//	NSURL *url = [NSURL URLWithString:@"http://46.38.169.206/mobile/Config.txt"];
//	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//	[request startSynchronous];
//	NSError *error = [request error];
//	if (!error) {
//		NSString *response = [request responseString];
//		return response;
//	}
//}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
	[self willAnimateRotationToInterfaceOrientation:self.interfaceOrientation duration:1];
	//[self.tableView reloadData];
	
	//UIActivityIndicatorView *Activity =(UIActivityIndicatorView *)[self.tabBarController.view viewWithTag:1];
//	[Activity removeFromSuperview];
//	
//	GCSEEnglishAppDelegate *appDelegate = (GCSEEnglishAppDelegate *)[UIApplication sharedApplication].delegate;
//	[appDelegate.SecondThread cancel];
//	[appDelegate.SecondThread release];
//	appDelegate.SecondThread = nil;
	
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	if (section == 0) {
		
		return [listofItems count];
	}
	else {
		return 1;
	}

    
	
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 1 && indexPath.row == 0  ) {		
        return  295;
    }
	
    else
        return 50;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
	
    
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    if (indexPath.section == 0) {
		
	
    // Configure the cell...
    
        NSString *cellValue = [[NSString alloc] initWithFormat:@"%@",[listofItems objectAtIndex:indexPath.row]];
        NSString *PicLocation = [[NSString alloc] initWithFormat:@"%@",[ImageNames objectAtIndex:indexPath.row]];
        
        UILabel *Title = [[UILabel alloc] initWithFrame:CGRectMake(100.0,0.0,240,50)];
        Title.text = cellValue;
        [cell.contentView addSubview:Title];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImage* theImage = [UIImage imageNamed:PicLocation];
        cell.imageView.image = theImage;
        
		
	}
	
	else if (indexPath.section == 1) {
	
        UIView *PromoView = [[UIView alloc] init];
        NSString *PromoImagePath = [[NSBundle mainBundle] pathForResource:@"website_promo" ofType:@"png"];
        UIImage *PromoImage = [[UIImage alloc] initWithContentsOfFile:PromoImagePath];
        UIImageView *PromoImageView = [[UIImageView alloc] initWithImage:PromoImage];
        PromoImageView.frame = CGRectMake(10, 10.0, 300, 250);
        [PromoView addSubview:PromoImageView];
        [cell addSubview:PromoView];
        
        
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        ///// LC image
        
        NSString *LCImageLocation = [[NSBundle mainBundle] pathForResource:@"web_promo_btn" ofType:@"png"];
        
        UIImage *LCImage = [[UIImage alloc] initWithContentsOfFile:LCImageLocation];
        
        
        LCButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [LCButton setImage:LCImage forState:UIControlStateNormal];
        LCButton.frame = CGRectMake(35, 200, 250, 50);
        [LCButton addTarget:self action:@selector(WebsitebuttonPressed) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:LCButton];
        
        ////
		
	}
    

	
	return cell;
	
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int index = indexPath.row;
	
		if (indexPath.section == 0) {
			
		
	
	switch (index) {
			
		case 0:
        {
			VideoPlayer *VP1 = [[VideoPlayer	alloc] initWithNibName:nil bundle:nil];
			VP1.VideoFileName =@"Maths";
			//VP1.hidesBottomBarWhenPushed = YES;
			[self.navigationController pushViewController:VP1 animated:YES];
			break;
        }
			
		case 1:
        {
			VideoPlayer *VP2 = [[VideoPlayer	alloc] initWithNibName:nil bundle:nil];
			VP2.VideoFileName =@"English";
			//VP2.hidesBottomBarWhenPushed = YES;
			[self.navigationController pushViewController:VP2 animated:YES];
			break;
        }
			
		case 2:
        {
			
			VideoPlayer *VP3 = [[VideoPlayer	alloc] initWithNibName:nil bundle:nil];
			VP3.VideoFileName =@"Physics";
			//VP3.hidesBottomBarWhenPushed = YES;
			[self.navigationController pushViewController:VP3 animated:YES];
			
			
			
			break;
        }
			
		case 3:
        {
			VideoPlayer *VP4 = [[VideoPlayer	alloc] initWithNibName:nil bundle:nil];
			VP4.VideoFileName =@"Chemistry";
			//VP4.hidesBottomBarWhenPushed = YES;
			[self.navigationController pushViewController:VP4 animated:YES];
			
			
			
			break;
        }
            
        case 4:
        {
			VideoPlayer *VP5 = [[VideoPlayer	alloc] initWithNibName:nil bundle:nil];
			VP5.VideoFileName =@"Biology";
			//VP5.hidesBottomBarWhenPushed = YES;
			[self.navigationController pushViewController:VP5 animated:YES];
			
			
			
			break;
        }

    }
            
    }
			
}

- (void)WebsitebuttonPressed {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.learnerscloud.com"]];
    
}




- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration{
	
	
	if (interfaceOrientation == UIInterfaceOrientationPortrait) {
		
		//WebText.frame = CGRectMake(0,20,350,20);
		
	}
	
	else {
		
		//WebText.frame = CGRectMake(35,20,350,20);
		
		
	}
	
	
	
	
	
}

#pragma mark -
#pragma mark Memory management


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}




@end
