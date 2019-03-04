//
//  ListTableViewCell.h
//  XLUITableViewCellHeightDemo
//
//  Created by Mac-Qke on 2019/3/4.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ListTableViewCell : UITableViewCell
@property (nonatomic, strong) ListModel *model;
@end

NS_ASSUME_NONNULL_END
