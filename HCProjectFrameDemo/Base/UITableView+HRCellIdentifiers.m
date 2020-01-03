

#import "UITableView+HRCellIdentifiers.h"

@implementation UITableView (HRCellIdentifiers)

- (void)registerTableViewIndentifiers:(NSArray *)cellIndentifiers {
    
    [self registerClassArray:cellIndentifiers];
}

- (void)registerClassArray:(NSArray *)cellIdentifier {
    for (NSString * cell in cellIdentifier) {
        [self registerClass:NSClassFromString(cell) forCellReuseIdentifier:cell];
    }
}

@end
