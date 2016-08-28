//
//  ViewController.m
//  TableViewTest
//
//  Created by tony hung on 8/28/16.
//  Copyright © 2016 tony hung. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController


- (void)viewDidLoad {
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reselectCell:) name:@"reselectCell" object:nil];
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return 10;
}

- (NSView *)tableView:(NSTableView *)tableView
   viewForTableColumn:(NSTableColumn *)tableColumn
                  row:(NSInteger)row {
    
    // Get an existing cell with the MyView identifier if it exists
    NSTextField *result = [tableView makeViewWithIdentifier:@"MyView" owner:self];
    
    // There is no existing cell to reuse so create a new one
    if (result == nil) {
        
        // Create the new NSTextField with a frame of the {0,0} with the width of the table.
        // Note that the height of the frame is not really relevant, because the row height will modify the height.
        result = [[NSTextField alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        
        // The identifier of the NSTextField instance is set to MyView.
        // This allows the cell to be reused.
        result.identifier = @"MyView";
    }
    
    // result is now guaranteed to be valid, either as a reused cell
    // or as a new cell, so set the stringValue of the cell to the
    // nameArray value at row
    result.stringValue = @"test";
    
    // Return the result
    return result;
}

- (BOOL)tableView:(NSTableView *)aTableView
  shouldSelectRow:(NSInteger)rowIndex {
    return YES;
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification {
    if ([notification object] == self.table1) {
    } else {
        NSTableRowView *myRowView = [self.table1 rowViewAtRow:self.table1.selectedRowIndexes.lastIndex makeIfNecessary:NO];
        [myRowView setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleRegular];
        [myRowView setEmphasized:YES];
        [self.table1 selectRowIndexes:self.table1.selectedRowIndexes byExtendingSelection:NO];
    }
    
}

- (void)reselectCell:(id)sender {
//    [self.table1 selectRowIndexes:[NSIndexSet indexSetWithIndex:1] byExtendingSelection:NO];
    
//    NSInteger selectedRow = [self.table1 selectedRow];
    NSTableRowView *myRowView = [self.table1 rowViewAtRow:1 makeIfNecessary:NO];
    [myRowView setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleRegular];
    [myRowView setEmphasized:YES];

}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
