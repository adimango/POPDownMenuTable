//
//  POPDSampleViewController.m
//  popdowntable
//
//  Created by Alex Di Mango on 15/09/2013.
//  Copyright (c) 2013 Alex Di Mango. All rights reserved.
//

#import "POPDSampleViewController.h"
#import "POPDViewController.h"

static NSString *kheader = @"menuSectionHeader";
static NSString *ksubSection = @"menuSubSection";

@interface POPDSampleViewController()<POPDDelegate> 

@end

@implementation POPDSampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *sucSectionsA = [NSArray arrayWithObjects:@"Live",@"My Subscriptions", nil];
    NSArray *sucSectionsB = [NSArray arrayWithObjects:@"Populare",@"Trailer",@"Review", nil];
    NSArray *sucSectionsC = [NSArray arrayWithObjects:@"Cover Stories",@"Popular Science",@"The Future Now", nil];

    NSDictionary *sectionA = [NSDictionary dictionaryWithObjectsAndKeys:
                                    @"News & Politics", kheader,
                                    sucSectionsA, ksubSection,
                                    nil];
    
    NSDictionary *sectionB = [NSDictionary dictionaryWithObjectsAndKeys:
                        @"Film & Animation", kheader,
                        sucSectionsB, ksubSection,
                        nil];
    
    NSDictionary *sectionC = [NSDictionary dictionaryWithObjectsAndKeys:
                        @"Science & Technology", kheader,
                        sucSectionsC, ksubSection,
                        nil];
    
    NSArray *menu = [NSArray arrayWithObjects:sectionA,sectionB,sectionC, nil];
    POPDViewController *popMenu = [[POPDViewController alloc]initWithMenuSections:menu];
    popMenu.delegate = self;
    popMenu.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    //ios7 status bar
     popMenu.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    [self addChildViewController:popMenu];
    [self.view addSubview:popMenu.view];
        
}

#pragma mark POPDViewController delegate

-(void) didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"didSelectRowAtIndexPath: %d,%d",indexPath.section,indexPath.row);

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
