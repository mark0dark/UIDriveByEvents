//
//  AirUITableView.h
//  UIDriveByEvents
//
//  Created by lwh on 13-7-25.
//  Copyright (c) 2013年 air. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kTableViewCellSelectEvent @"tableViewCellSelectEvent"
#define kTableViewDataInitCompleteEvent @"tableViewDataInitCompleteEvent"

@interface AirUITableView : UITableView <UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) NSArray *tableData;
-(void)addData:(NSArray *)data;
@end
