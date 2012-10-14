//
//  CNGridViewItemLayout.m
//
//  Created by cocoa:naut on 12.10.12.
//  Copyright (c) 2012 cocoa:naut. All rights reserved.
//

/*
 The MIT License (MIT)
 Copyright © 2012 Frank Gregor, <phranck@cocoanaut.com>

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the “Software”), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */


#import "CNGridViewItemLayout.h"


static CGFloat kDefaultContentInset;
static CGFloat kDefaultSelectionRingLineWidth;
static CGFloat kDefaultItemBorderRadius;


@implementation CNGridViewItemLayout

+ (void)initialize
{
    kDefaultSelectionRingLineWidth = 3.0f;
    kDefaultContentInset = 3.0f;
    kDefaultItemBorderRadius = 8.0f;
}

- (id)init
{
    self = [super init];
    if (self) {
        _backgroundColor        = [NSColor itemBackgroundColor];
        _selectionRingColor     = [NSColor itemSelectionRingColor];
        _selectionRingLineWidth = kDefaultSelectionRingLineWidth;
        _contentInset           = kDefaultContentInset;
        _itemBorderRadius       = kDefaultItemBorderRadius;
        _visibleContentMask     = (CNGridViewItemVisibleContentImage | CNGridViewItemVisibleContentTitle);
    }
    return self;
}

+ (CNGridViewItemLayout *)defaultLayout
{
    static dispatch_once_t predicate;
    static CNGridViewItemLayout *_defaultLayout = nil;

    dispatch_once(&predicate, ^{
        _defaultLayout = [[[self class] alloc] init];
    });
    return _defaultLayout;
}

@end
