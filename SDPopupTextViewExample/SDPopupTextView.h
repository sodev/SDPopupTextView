//
//  SDPopupTextView.h
//  SDPopupTextViewExample
//
//  Created by Sean O'Connor on 20/07/2014.
//  Copyright (c) 2014 Mojito Fridays. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "UIView+position.h"

// Create a class of the SDPopupTextView for use in the delegate methods
@class SDPopupTextView;

// Declare the SDPopupTextView delegate protocol
@protocol SDPopupTextViewDelegate <NSObject>

// Declare the delegate method/s
- (void)DidSaveAndExitSDPopupTextView:(SDPopupTextView *)SDPopupTextView withText:(NSString *)text;
- (void)DidCancelAndExitSDPopupTextView:(SDPopupTextView *)SDPopupTextView;

@end

@interface SDPopupTextView : UIView

// --VIEW--

// Create the UITextView property
@property (nonatomic, strong) UITextView *textView;


// --MODEL--

@property (nonatomic, strong) NSString *textString;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColour;


// --CONTROLLER--

#pragma mark - Custom actions
- (void)drawViewItems;
- (void)saveAndExit;
- (void)cancelAndExit;

// --DELEGATES--

// Create the delegate property
@property (nonatomic, weak) id <SDPopupTextViewDelegate> delegate;

@end
