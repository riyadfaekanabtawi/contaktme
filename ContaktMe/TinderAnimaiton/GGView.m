#import "GGView.h"
#import "GGDraggableView.h"
#import "Functions.h"

@interface GGView ()
@property(nonatomic, strong) GGDraggableView *draggableView;

@end

@implementation GGView

- (id)init
{
    self = [super init];
    if (!self) return nil;

    self.backgroundColor = [UIColor whiteColor];

    [self loadDraggableCustomView];

    return self;
}

- (void)loadDraggableCustomView
{
    

    self.draggableView = [[GGDraggableView alloc] initWithFrame:CGRectMake(50, 100, 280, 400)];
    [self addSubview:self.draggableView];

}

@end