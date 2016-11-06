//
//  Article.m
//  RuntimeP
//
//  Created by Mac on 16/11/6.
//  Copyright © 2016年 Lneayce. All rights reserved.
//

#import "Article.h"
#import <objc/runtime.h>
#import "NSObject+KV.h"
@implementation Article

+ (void)run
{
    NSLog(@"Article Run");
}

- (void)publish
{
    NSLog(@"Article Publish");
}

void lei(id self, SEL _cmd)
{
    NSLog(@"Article lei");
}

void shili(id self, SEL _cmd)
{
    NSLog(@"Article shili");
}

+ (BOOL)resolveClassMethod:(SEL)sel
{
    if (sel == @selector(lei)) {
        class_addMethod([self class], sel, (IMP)lei, "v@:");
    }
    
    return [super resolveClassMethod:sel];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(shili)) {
        class_addMethod(self, sel, (IMP)shili, "v@:");
    }
    
    return [super resolveInstanceMethod:sel];
}

- (void)solidMethod
{
    NSLog(@"这里是本尊方法");
}

+ (NSDictionary *)arrayContainModelClass
{
    return @{@"images":@"NSString"};
}
@end
