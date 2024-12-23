//
// Copyright 2019 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "GSCXScannerSettingsTableViewCell.h"

#import "NSLayoutConstraint+GSCXUtilities.h"

NS_ASSUME_NONNULL_BEGIN

const CGFloat kGSCXScannerSettingsTableViewCellButtonMargin = 4.0;

const CGFloat kGSCXScannerSettingsTableViewCellButtonMinimumHeight = 48.0;

const CGFloat kGSCXScannerSettingsTableViewCellButtonMinimumWidthMultiplier = 0.7;

@interface GSCXScannerSettingsTableViewCell ()

/**
 * @c YES if this cell's autolayout constraints have already been initialized, @c NO otherwise.
 */
@property(assign, nonatomic, getter=hasSetupConstraints) BOOL setupConstraints;

@end

@implementation GSCXScannerSettingsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(nullable NSString *)reuseIdentifier {
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    _button = [UIButton buttonWithType:UIButtonTypeSystem];
    _button.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_button];
  }
  return self;
}

- (void)updateConstraints {
  [super updateConstraints];
  if (self.setupConstraints) {
    return;
  }
  self.setupConstraints = YES;
  NSDictionary<NSString *, id> *metrics = @{
    @"margin" : @(kGSCXScannerSettingsTableViewCellButtonMargin),
    @"minimumHeight" : @(kGSCXScannerSettingsTableViewCellButtonMinimumHeight),
  };
  NSDictionary<NSString *, id> *views = @{@"button" : self.button};
  [NSLayoutConstraint gscx_constraintsCenteringView:self.button
                                           withView:self.contentView
                                       horizontally:YES
                                         vertically:YES
                                          activated:YES];
  [NSLayoutConstraint
      constraintWithItem:self.button
               attribute:NSLayoutAttributeWidth
               relatedBy:NSLayoutRelationGreaterThanOrEqual
                  toItem:self.contentView
               attribute:NSLayoutAttributeWidth
              multiplier:kGSCXScannerSettingsTableViewCellButtonMinimumWidthMultiplier
                constant:0.0]
      .active = YES;
  [NSLayoutConstraint
      gscx_constraintsWithHorizontalFormat:@"|-(>=margin)-[button]-(>=margin)-|"
                            verticalFormat:@"V:|-(>=margin)-[button(>=minimumHeight)]-(>=margin)-|"
                                   options:0
                                   metrics:metrics
                                     views:views
                                 activated:YES];
}

@end

NS_ASSUME_NONNULL_END
