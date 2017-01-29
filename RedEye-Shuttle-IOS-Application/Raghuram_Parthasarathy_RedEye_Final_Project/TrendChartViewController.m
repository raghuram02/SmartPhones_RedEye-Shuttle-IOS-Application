//
//  TrendChartViewController.m
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/16/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import "TrendChartViewController.h"

@interface TrendChartViewController (){
    NSMutableArray *chartValues;
    UIColor *mainColor;
    NSInteger selectedIndex;
}


@end

@implementation TrendChartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // populate char values array
    chartValues = [[NSMutableArray alloc] init];
    
    for(id obj in _details){
        
        FrequentRides *feq=[[FrequentRides alloc]init];
        feq=obj;
        [chartValues addObject:[NSNumber numberWithFloat:feq.count]];
        
    }
    
    
    self.barChart.dataSource = self;
    self.barChart.cornerRadiusPercentage = 0;
    
    self.barChart.xAxisTextColor    = [MCUtil flatPeterRiverColor];
    self.barChart.yAxisTextColor    = [MCUtil flatPeterRiverColor];
    self.barChart.barColor          = [MCUtil flatAlizarinColor];
    self.barChart.backBarColor      = [[MCUtil flatAlizarinColor] colorWithAlphaComponent:0.1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Bar Chart View data source

- (NSInteger)numberOfBarsInBarChartView:(MCBarChartView*)barChartView
{
    return chartValues.count;
}

- (CGFloat)barCharView:(MCBarChartView*)barChartView valueForBarAtIndex:(NSInteger)index
{
    return [[chartValues objectAtIndex:index] floatValue];
}

- (IBAction)percentageSwitchDidChange:(id)sender
{
    UISwitch *switchControl = (UISwitch*)sender;
    
    if (switchControl.isOn) {
        self.barChart.textStyle = MCBarChartBarTextPercentage;
    }
    else {
        self.barChart.textStyle = MCBarChartBarTextRealValue;
    }
    
    [self.barChart reloadData];
}

- (IBAction)cornerRadiusSliderDidChange:(id)sender
{
    UISlider *slider = (UISlider*)sender;
    self.barChart.cornerRadiusPercentage = slider.value;
    self.cornerRadiusLabel.text = [NSString stringWithFormat:@"%.2f", slider.value];
    [self.barChart reloadData];
}


- (IBAction)animate:(id)sender
{
    [self.barChart animate];
}








// optional data source methods:

- (UIImage*)barCharView:(MCBarChartView *)barChartView imageForBarAtIndex:(NSInteger)index
{
    return [UIImage imageNamed:@"texture-red-dots"];
}
- (IBAction)switchImageStyle:(id)sender
{
    if (self.barChart.imageBoundsStyle == MCNewCustomLayerImageBoundsFullRect) {
        self.barChart.imageBoundsStyle = MCNewCustomLayerImageBoundsItemRect;
    }
    else {
        self.barChart.imageBoundsStyle = MCNewCustomLayerImageBoundsFullRect;
    }
    
    [self.barChart reloadData];
}

@end
