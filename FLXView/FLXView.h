@import UIKit;

FOUNDATION_EXPORT double FLXViewVersionNumber;

FOUNDATION_EXPORT const unsigned char FLXViewVersionString[];

#import <FLXView/FLXTypes.h>
#import <FLXView/FLXLayoutStrategy.h>
#import <FLXView/UIView+Flex.h>

NS_ASSUME_NONNULL_BEGIN

@interface FLXView : UIView

@property (readwrite, nonatomic, assign) FLXDirection direction;

@property (readwrite, nonatomic, assign) FLXChildAlignment childAlignment;

@property (readwrite, nonatomic, assign) FLXJustification justification;

@property (readwrite, nonatomic, assign) FLXPadding padding;

@property (readwrite, nonatomic, assign) CGFloat paddingLeft;
@property (readwrite, nonatomic, assign) CGFloat paddingRight;
@property (readwrite, nonatomic, assign) CGFloat paddingTop;
@property (readwrite, nonatomic, assign) CGFloat paddingBottom;

@property (readwrite, nonatomic, assign) BOOL wrap;

- (void)setPaddingValue:(CGFloat)padding; // Sets all 4 paddings with the same value

@end

NS_ASSUME_NONNULL_END
