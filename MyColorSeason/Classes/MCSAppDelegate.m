//
//  MCSAppDelegate.m
//  MyColorSeason
//
//  Created by Alexey Minaev on 16/05/14.
//  Copyright Alexey MInaev 2014. All rights reserved.
//

#import "MCSAppDelegate.h"

@implementation MCSAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{
    [MagicalRecord setupAutoMigratingCoreDataStack];
	return YES;
}

@end
