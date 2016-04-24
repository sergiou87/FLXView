@import UIKit;

#import <FLXView/FLXTypes.h>

@class FLXLayoutStrategy;

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Flex)

@property (readwrite, nonatomic, assign) CGFloat flx_flex;

@property (readwrite, nonatomic, strong) FLXLayoutStrategy *flx_layoutStrategy;

@property (readwrite, nonatomic, assign) FLXMargins flx_margins;

@property (readwrite, nonatomic, assign) CGFloat flx_marginLeft;
@property (readwrite, nonatomic, assign) CGFloat flx_marginRight;
@property (readwrite, nonatomic, assign) CGFloat flx_marginTop;
@property (readwrite, nonatomic, assign) CGFloat flx_marginBottom;

@property (readwrite, nonatomic, assign) FLXSelfAlignment flx_selfAlignment;

// Whether this view should take up space in the container FLXView when it's hidden.
// Default: NO
//
@property (readwrite, nonatomic, assign) BOOL flx_layoutWhenHidden;

- (void)flx_setMarginValue:(CGFloat)margin; // Sets all 4 margins with the same value

@end

NS_ASSUME_NONNULL_END
