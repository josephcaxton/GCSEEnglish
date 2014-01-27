//
//  LocalReporting.h
//  Maths
//
//  Created by Joseph caxton-Idowu on 25/06/2013.
//  Copyright (c) 2013 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocalReporting : UIViewController <CPTPlotDataSource, NSXMLParserDelegate>{
    
    CPTGraphHostingView *hostView;
    CPTTheme *selectedTheme;
    CPTXYGraph *graph;
    
    NSMutableArray *CollectionofArrays;
	NSString *FinalString;
    
    NSMutableArray *Totals;
    int MaxValueForYValue;
    
    NSDictionary *data;
    NSDictionary *sets;
    NSMutableArray *dates;
    NSMutableArray *DataDump;
   
}
@property (nonatomic, strong) CPTGraphHostingView *hostView;
@property (nonatomic, strong) CPTTheme *selectedTheme;
@property (nonatomic, strong) CPTXYGraph *graph;

@property (nonatomic, strong) NSMutableArray *CollectionofArrays;
@property (nonatomic, strong) NSString *FinalString;

@property (nonatomic, strong) NSMutableArray *Totals;
@property (nonatomic, assign) int MaxValueForYValue;
@property (nonatomic, strong) NSDictionary *data;
@property (nonatomic, strong)  NSDictionary *sets;
@property (nonatomic, strong)  NSMutableArray *dates;
@property (nonatomic, strong) NSMutableArray *DataDump;


//-(IBAction)themeTapped:(id)sender;
-(IBAction)ClearAllLogs:(id)sender;

-(void)loadDataFromXML:(NSString *)FileLocation;
-(void)initPlot;
-(void)configureHost;
-(void)configureGraph;
-(void)configurePlots;



@end