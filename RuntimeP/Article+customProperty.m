//
//  Article+customProperty.m
//  RuntimeP
//
//  Created by Mac on 16/11/6.
//  Copyright © 2016年 Lneayce. All rights reserved.
//

#import "Article+customProperty.h"
#import <objc/runtime.h>

@implementation Article (customProperty)

static NSString const * key = @"title";

+ (void)initialize
{
    if (self == [Article class]) {
        NSLog(@"看看打印多少次, initialize");
    }
}

+ (void)load
{
    [super load];
    NSLog(@"看看打印多少次, load");
    
    Method sup = class_getInstanceMethod(self, @selector(solidMethod));
    Method sub = class_getInstanceMethod(self, @selector(subClassMethod));
    
    method_exchangeImplementations(sup, sub);
    
}

- (void)subClassMethod
{
    [self subClassMethod];
    NSLog(@"这是分类的方法");
}

- (NSString *)title
{
    return objc_getAssociatedObject(self, "key");
}

- (void)setTitle:(NSString *)title
{
    objc_setAssociatedObject(self, "key", title, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
