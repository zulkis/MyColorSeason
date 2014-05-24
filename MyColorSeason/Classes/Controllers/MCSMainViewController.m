//
//  MCSMainViewController.m
//  MyColorSeason
//
//  Created by Alexey Minaev on 18/05/14.
//  Copyright (c) 2014 Alexey MInaev. All rights reserved.
//

#import "MCSMainViewController.h"

#import "MCSColorType+Extension.h"

#import "MCSColorTypeTableViewCell.h"

#import <DBCameraContainerViewController.h>
#import <DBCameraViewController.h>

@interface MCSMainViewController () <DBCameraViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *colorTypes;

@end

@implementation MCSMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (![MCSColorType findFirst]) {
        [self showCameraAnimated:NO];
    }
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.colorTypes = [NSMutableArray arrayWithArray:[MCSColorType findAllSortedBy:@"date" ascending:NO]];
    [self.tableView reloadData];
}

#pragma mark - Working Methods

- (void)showCameraAnimated:(BOOL)animated {
    DBCameraContainerViewController *cameraContainer = [[DBCameraContainerViewController alloc] initWithDelegate:self];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:cameraContainer];
    [nav setNavigationBarHidden:YES];
    [self presentViewController:nav animated:animated completion:nil];
}

#pragma mark - IBActions

- (IBAction)onCameraButtonTap:(id)sender {
    [self showCameraAnimated:YES];
}

#pragma mark - UITanleViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.colorTypes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MCSColorTypeTableViewCell class]) forIndexPath:indexPath];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        MCSColorType *ct = self.colorTypes[indexPath.row];
        [self.colorTypes removeObjectAtIndex:indexPath.row];
        [ct deleteEntity];
        [ct.managedObjectContext saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }];
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    MCSColorType *ct = self.colorTypes[indexPath.row];
    cell.imageView.image = ct.image;
    cell.textLabel.text = ct.colorTypeTitle;
    cell.detailTextLabel.text = ct.dateString;
}

#pragma mark - DBCameraViewControllerDelegate

- (void)captureImageDidFinish:(UIImage *)image withMetadata:(NSDictionary *)metadata {
    //TODO: crete new item in history with 1st step
    MCSColorType *ct = [MCSColorType createEntity];
    ct.image = image;
    [ct.managedObjectContext saveToPersistentStoreAndWait];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)dismissCamera {
    //TODO: check for existing history items and dismiss if available
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
