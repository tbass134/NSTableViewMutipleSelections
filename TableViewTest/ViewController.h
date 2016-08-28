//
//  ViewController.h
//  TableViewTest
//
//  Created by tony hung on 8/28/16.
//  Copyright © 2016 tony hung. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController {
    BOOL table1RowSelected;
    NSInteger selectedRow;
}
@property (nonatomic, strong) IBOutlet NSTableView *table1;
@property (nonatomic, strong) IBOutlet NSTableView *table2;

@end

