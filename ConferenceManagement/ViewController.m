//
//  ViewController.m
//  ConferenceManagement
//
//  Created by MacAir2 on 15/4/11.
//  Copyright (c) 2015年 lixiang. All rights reserved.
//

#import "ViewController.h"
#import "Myfunction.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *inputTextView;
@property (weak, nonatomic) IBOutlet UITextView *outputTextView;

@property (strong, nonatomic) NSArray *inputArray;

- (IBAction)chooseOneInputButtonPressed:(id)sender;
- (IBAction)callMyFunctionButtonPressed:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //test1
    
    _inputArray = @[[[Talk alloc] initWithTitle:@"Writing Fast Tests Against Enterprise Rails" andTime:60],
                    [[Talk alloc] initWithTitle:@"Overdoing it in Python" andTime:45],
                    [[Talk alloc] initWithTitle:@"Lua for the Masses" andTime:30],
                    [[Talk alloc] initWithTitle:@"Ruby Errors from Mismatched Gem Versions" andTime:55],
                    [[Talk alloc] initWithTitle:@"Common Ruby Errors" andTime:55],
                    [[Talk alloc] initWithTitle:@"Rails for Python Developers lightning" andTime:5],
                    [[Talk alloc] initWithTitle:@"Communicating Over Distance" andTime:60],
                    [[Talk alloc] initWithTitle:@"Accounting-Driven Development" andTime:45],
                    [[Talk alloc] initWithTitle:@"Woah" andTime:30],
                    [[Talk alloc] initWithTitle:@"Sit Down and Write" andTime:30],
                    [[Talk alloc] initWithTitle:@"Pair Programming vs Noise" andTime:45],
                    [[Talk alloc] initWithTitle:@"Rails Magic" andTime:60],
                    [[Talk alloc] initWithTitle:@"Ruby on Rails: Why We Should Move On" andTime:60],
                    [[Talk alloc] initWithTitle:@"Clojure Ate Scala (on my project)" andTime:45],
                    [[Talk alloc] initWithTitle:@"Programming in the Boondocks of Seattle" andTime:30],
                    [[Talk alloc] initWithTitle:@"Ruby vs. Clojure for Back-End Development" andTime:30],
                    [[Talk alloc] initWithTitle:@"Ruby on Rails Legacy App Maintenance" andTime:60],
                    [[Talk alloc] initWithTitle:@"A World Without HackerNews" andTime:30],
                    [[Talk alloc] initWithTitle:@"User Interface CSS in Rails Apps" andTime:30]];
    
    _inputTextView.text = [self fillInputTextViewWithArray:_inputArray];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - fillTextView
- (NSString *)fillInputTextViewWithArray:(NSArray *)arr{
    NSMutableString *temp = [[NSMutableString alloc] init];
    for (Talk *talk in arr) {
        [temp appendFormat:@"%@ %limin\n",talk.title,talk.time];
    }
    NSLog(@"%@",temp);
    return temp;
}
- (NSString *)fillOutputTextViewWithArray:(NSArray *)arr{
    NSMutableString *temp = [[NSMutableString alloc] init] ;
    for (Talk *talk in arr) {
        [temp appendFormat:@"%@ %limin\n",talk.title,talk.time];
    }
    NSLog(@"%@",temp);
    return temp;
}

#pragma mark - IBAction
- (IBAction)chooseOneInputButtonPressed:(id)sender {
}

- (IBAction)callMyFunctionButtonPressed:(id)sender {
    Myfunction *myfunction = [[Myfunction alloc] initWithInputArray:_inputArray];
    
    _outputTextView.text = [self fillOutputTextViewWithArray:[myfunction conferenceManagement]];
    
}
@end
