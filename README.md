SDPopupTextView
===============

Popover text view for iOS

##Usage
SDPopupTextView is a simple UIView that can be used as a modal to display or edit large quantities of text.

The data can be either an array of strings or an array of dictionaries, to use an array of dictionaries simply set the sortKey property

Set the delegate to access the saved text and dismiss the modal view
##Example
```objective-c
    SDPopupTextView *popupView = [[SDPopupTextView alloc] initWithFrame:popupFrame];
    [popupView setDelegate:self];
    [popupView setTextColour:[UIColor blackColor]];
    [popupView setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:18]];
    [background addSubview:popupView];
    [[popupView textView] becomeFirstResponder];
    
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
```

##Resouces
SDAutoComplete utilises UIView+position from Tyler Neylon for positioning view objects
see here for more info https://github.com/tylerneylon/moriarty

