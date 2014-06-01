//
//  MCSHuePickerViewController.m
//  MyColorSeason
//
//  Created by Alexey Minaev on 01/06/14.
//  Copyright (c) 2014 Alexey MInaev. All rights reserved.
//

#import "MCSHuePickerViewController.h"

#import "MCSColorViewerView.h"
#import "MCSPhotoView.h"

#import "MCSColorType+Extension.h"

@interface MCSHuePickerViewController ()

@property (nonatomic, weak) IBOutlet MCSPhotoView *photoView;
@property (nonatomic, weak) IBOutlet MCSColorViewerView *colorViewerView;

@end

@implementation MCSHuePickerViewController

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
    [self.photoView setImage:self.colorType.image color:self.colorViewerView.backgroundColor];
}

#pragma mark - IBActions

- (IBAction)onChangeColorButton:(UIButton *)sender {
    self.colorViewerView.backgroundColor = sender.backgroundColor;
    [self.photoView setImage:self.colorType.image color:self.colorViewerView.backgroundColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
