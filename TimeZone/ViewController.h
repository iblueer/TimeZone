//
//  ViewController.h
//  TimeZone
//
//  Created by 宅音かがや on 2018/03/29.
//  Copyright © 2018年 宅音かがや. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// Model
@property (nonatomic) int timeZoneIndex;
@property (nonatomic) NSArray *timeZoneList;

// View
@property (nonatomic) IBOutlet UILabel *resultLabel;
@property (nonatomic) IBOutlet UIButton *checkItButton;
@property (nonatomic) IBOutlet UIDatePicker *datePicker;

- (void)makeResult:(NSString *)strDate;
- (int)makeResult12:(NSString *)strDate;
- (int)makeResult24:(NSString *)strDate;
- (void)makeResultText:(int)dateValue;

@end
