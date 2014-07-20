//
//  SDPopupTextView.m
//  SDPopupTextViewExample
//
//  Created by Sean O'Connor on 20/07/2014.
//  Copyright (c) 2014 Mojito Fridays. All rights reserved.
//

#import "SDPopupTextView.h"

static NSInteger const kImageSize = 25;
static NSInteger const kSpacer = 10;

@implementation SDPopupTextView
@synthesize textString;
@synthesize textView;
@synthesize delegate;
@synthesize font;
@synthesize textColour;

#pragma mark - Initialization methods
- (id)init
{
    self = [super init];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self drawViewItems];
    }
    
    return self;
    
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self drawViewItems];
    }
    return self;
}

#pragma mark - Drawing methods
- (void)drawViewItems
{
    // SET THE BORDER
    [[self layer] setMasksToBounds:YES];
    [[self layer] setCornerRadius: kImageSize / 2 + kSpacer];
    [[self layer] setBorderWidth:2.0];
    [[self layer] setBorderColor:[[UIColor blackColor] CGColor]];
    
    // CREATE THE SAVE AND EXIT BUTTON
    CGRect saveFrame = CGRectMake(self.frameWidth - kImageSize - kSpacer, kSpacer, kImageSize, kImageSize);
    UIButton *saveButton = [[UIButton alloc] initWithFrame:saveFrame];
    [saveButton setImage:[UIImage imageNamed:@"saveImage"] forState:UIControlStateNormal];
    [saveButton addTarget:self action:@selector(saveAndExit) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:saveButton];
    
    
    // CREATE THE CANCEL AND EXIT BUTTON
    CGRect cancelFrame = CGRectMake(kSpacer, kSpacer, kImageSize, kImageSize);
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:cancelFrame];
    [cancelButton setImage:[UIImage imageNamed:@"cancelImage"] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelAndExit) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelButton];
    
    
    // CREATE THE TEXT VIEW
    CGRect textFrame = CGRectMake(kSpacer, cancelButton.frameBottom + kSpacer, self.frameWidth - 2 * kSpacer, self.frameHeight - (cancelButton.frameBottom + 2 * kSpacer));
    textView = [[UITextView alloc] initWithFrame:textFrame];
    [self addSubview:textView];
    
}

#pragma mark - Setter Methods
- (void)setTextColour:(UIColor *)newTextColour
{
    [textView setTextColor:newTextColour];
}
- (void)setFont:(UIFont *)newFont
{
    [textView setFont:newFont];
}
- (void)setTextString:(NSString *)newTextString
{
    [textView setText:newTextString];
}

#pragma mark - CPPopupTextViewDelegate Methods
- (void)saveAndExit
{
    [[self delegate] DidSaveAndExitSDPopupTextView:self withText:[textView text]];
}
- (void)cancelAndExit
{
    [[self delegate] DidCancelAndExitSDPopupTextView:self];
}


@end
