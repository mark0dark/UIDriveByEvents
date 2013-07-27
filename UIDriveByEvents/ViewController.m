//
//  ViewController.m
//  UIDriveByEvents
//
//  Created by lwh on 13-7-25.
//  Copyright (c) 2013年 air. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
{
    NSString *noteName;
    UIAlertView *alert;
    NSMutableArray *tableData;
}
@property(nonatomic,strong) AirUITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    _tableView = [[AirUITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    tableData = [NSMutableArray arrayWithObjects:@"red",@"blue",@"pink", nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTableViewNotifications:) name:kTableViewCellSelectEvent object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTableViewNotifications:) name:kTableViewDataInitCompleteEvent object:nil];

    [_tableView addData:tableData];
    [self.view addSubview:_tableView];
}

-(void)handleTableViewNotifications:(NSNotification *)note
{
    noteName = [note name];
    //本来想写switch语句
    //switch(noteName) ,结果出错。。
    
    NSNumber *numIndex = [note object];
    
    if([noteName isEqualToString:kTableViewCellSelectEvent])
    {
        [self createAlert:[tableData objectAtIndex:[numIndex integerValue]]];
    }
    else if([noteName isEqualToString:kTableViewDataInitCompleteEvent])
    {
        [self createAlert:@"数据初始完成"];
    }
}

-(void)createAlert:(NSString *)msg
{
    alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
