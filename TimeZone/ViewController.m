//
//  ViewController.m
//  TimeZone
//
//  Created by 宅音かがや on 2018/03/29.
//  Copyright © 2018年 宅音かがや. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)showResult:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH-mm"];
    NSString *strDate = [dateFormatter stringFromDate:self.datePicker.date];
    NSLog(@"%@", strDate);
    [self makeResult:strDate];
}

- (void)makeResult:(NSString *)strDate {
    // 先判断时间的格式是12小时制还是24小时制
    bool hour12 = [strDate containsString:@"M"];
    if (hour12){
        NSLog(@"是12小时制");
        int dateValue = [self makeResult12:strDate];
        [self makeResultText:dateValue];
    }else{
        NSLog(@"是24小时制");
        int dateValue = [self makeResult24:strDate];
        [self makeResultText:dateValue];
    }
}

- (int)makeResult12:(NSString *)strDate {
    // 首先转化成24小时制dateValue
    // 首先区分AM和PM，如果是AM，则去掉尾部，如果是PM，则去掉尾部并且加上12
    bool pm = [strDate containsString:@"PM"];
    if (pm) {
        NSString *newStrDate = [strDate stringByReplacingOccurrencesOfString:@" PM" withString:@""];
        int intStr = [newStrDate intValue] + 12;
        if (intStr == 24) {
            intStr = 0;
        }
        NSLog(@"value is %d", intStr);
        return intStr;
    }else{
        NSString *newStrDate = [strDate stringByReplacingOccurrencesOfString:@" AM" withString:@""];
        int intStr = [newStrDate intValue];
        NSLog(@"value is %d", intStr);
        return intStr;
    }
}

- (int)makeResult24:(NSString *)strDate {
    // 首先转化成dateValue
    NSString *newStrDate = [strDate substringToIndex:2];
    int intStr = [newStrDate intValue];
    NSLog(@"value is %d", intStr);
    return intStr;
}

- (void)makeResultText:(int)dateValue {
    // 对int进行switch
    NSMutableString *resultText = [[NSMutableString alloc] initWithString:@"你是"];
    switch (dateValue) {
        case 0:
            [resultText appendString:@"泰国曼谷"];
            break;
        case 1:
            [resultText appendString:@"缅甸仰光"];
            break;
        case 2:
            [resultText appendString:@"印度新德里"];
            break;
        case 3:
            [resultText appendString:@"阿联酋阿布扎比"];
            break;
        case 4:
            [resultText appendString:@"俄罗斯莫斯科"];
            break;
        case 5:
            [resultText appendString:@"土耳其伊斯坦布尔"];
            break;
        case 6:
            [resultText appendString:@"法国巴黎"];
            break;
        case 7:
            [resultText appendString:@"英国伦敦"];
            break;
        case 8:
            [resultText appendString:@"塞内加尔达喀尔"];
            break;
        case 9:
            [resultText appendString:@"大西洋中部"];
            break;
        case 10:
            [resultText appendString:@"巴西巴西利亚"];
            break;
        case 11:
            [resultText appendString:@"智力圣地亚哥"];
            break;
        case 12:
            [resultText appendString:@"美国纽约"];
            break;
        case 13:
            [resultText appendString:@"美国芝加哥"];
            break;
        case 14:
            [resultText appendString:@"美国菲尼克斯"];
            break;
        case 15:
            [resultText appendString:@"加拿大温哥华"];
            break;
        case 16:
            [resultText appendString:@"美国安克雷奇"];
            break;
        case 17:
            [resultText appendString:@"美国檀香山"];
            break;
        case 18:
            [resultText appendString:@"太平洋"];
            break;
        case 19:
            [resultText appendString:@"新西兰惠灵顿"];
            break;
        case 20:
            [resultText appendString:@"所罗门群岛"];
            break;
        case 21:
            [resultText appendString:@"澳大利亚墨尔本"];
            break;
        case 22:
            [resultText appendString:@"日本东京"];
            break;
        case 23:
            [resultText appendString:@"中国北京"];
            break;
            
            
        default:
            self.resultLabel.text = @"月球";
            break;
    }
    [resultText appendString:@"人！"];
    self.resultLabel.text = resultText;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
