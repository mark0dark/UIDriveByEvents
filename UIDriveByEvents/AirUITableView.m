//
//  AirUITableView.m
//  UIDriveByEvents
//
//  Created by lwh on 13-7-25.
//  Copyright (c) 2013年 air. All rights reserved.
//

#import "AirUITableView.h"

@implementation AirUITableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

-(void)addData:(NSArray *)data
{
    _tableData = data;
    NSNotification *note = [NSNotification notificationWithName:kTableViewDataInitCompleteEvent object:nil];
    [[NSNotificationCenter defaultCenter] postNotification:note];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellIndent = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndent];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndent];
    }
    
    cell.textLabel.text = [_tableData objectAtIndex:[indexPath row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = [indexPath row];
    NSNotification *note = [NSNotification notificationWithName:kTableViewCellSelectEvent object:[NSNumber numberWithInteger:index]];
    [[NSNotificationCenter defaultCenter] postNotification:note];
}


@end
