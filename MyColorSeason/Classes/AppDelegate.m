//
//  AppDelegate.m
//  MyColorSeason
//
//  Created by Alexey Minaev on 16/05/14.
//  Copyright Alexey MInaev 2014. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@implementation AppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{    
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	RootViewController *rootViewController = [[RootViewController alloc] initWithStyle:UITableViewStylePlain];
	UINavigationController *navigationController = [[[UINavigationController alloc] initWithRootViewController:rootViewController] autorelease];
	window.rootViewController = navigationController;
	[window makeKeyAndVisible];
	return YES;
}

- (void)applicationWillTerminate:(UIApplication *) application
{
	
}

- (void)applicationDidEnterBackground:(UIApplication *) application
{
	
}

- (void)applicationDidBecomeActive:(UIApplication *) application
{
		
}

- (void)dealloc 
{
	[window release];
	[super dealloc];
}


@end
