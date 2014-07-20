//
//  viewController.m
//  SDPopupTextViewExample
//
//  Created by Sean O'Connor on 20/07/2014.
//  Copyright (c) 2014 Mojito Fridays. All rights reserved.
//

#import "viewController.h"

static NSInteger const kViewWidth = 200;
static NSInteger const kViewHeight = 200;
static NSInteger const kViewYInset = 50;

@implementation viewController

- (void)loadView
{
    // SET THE BACKGROUND VIEW
    CGRect frame = [[UIScreen mainScreen] bounds];
    UIView *background = [[UIView alloc] initWithFrame:frame];
    [self setView:background];
    
    // CREATE AND SHOW THE POPOVER VIEW
    CGRect popupFrame = CGRectMake(background.frameWidth / 2 - kViewWidth / 2, kViewYInset, kViewWidth, kViewHeight);
    SDPopupTextView *popupView = [[SDPopupTextView alloc] initWithFrame:popupFrame];
    [popupView setDelegate:self];
    [popupView setTextColour:[UIColor blackColor]];
    [popupView setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:18]];
    [background addSubview:popupView];
    [[popupView textView] becomeFirstResponder];
}

#pragma mark - CPPopupTextView Delegate Methods
- (void)DidSaveAndExitSDPopupTextView:(SDPopupTextView *)SDPopupTextView withText:(NSString *)text
{
    NSLog(@"You just saved: %@", text);
    [self resignFirstResponder];
    [SDPopupTextView removeFromSuperview];
}
- (void)DidCancelAndExitSDPopupTextView:(SDPopupTextView *)SDPopupTextView
{
    NSLog(@"You just cancelled SDPopupTextView");
    [self resignFirstResponder];
    [SDPopupTextView removeFromSuperview];
}
@end
