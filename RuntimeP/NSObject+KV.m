//
//  NSObject+KV.m
//  RuntimeP
//
//  Created by Mac on 16/11/6.
//  Copyright © 2016年 Lneayce. All rights reserved.
//

#import "NSObject+KV.h"
#import <objc/runtime.h>
@implementation NSObject (KV)
+ (instancetype)objectWithDict:(NSDictionary *)dict
{
    id obj = [[self alloc] init];
    
    //  在运行时获得调用类的成员属性
    unsigned int count;
    Ivar *ivar = class_copyIvarList(self, &count);
    
    for (int i = 0; i < count; i++) {
        //  取出某个成员变量
        Ivar var = ivar[i];
        //  变量名
        NSString *key = [NSString stringWithUTF8String:ivar_getName(var)];
        key = [key substringFromIndex:1];
        NSLog(@"key: %@", key);
        //  变量类型
        NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(var)];
        type = [type stringByReplacingOccurrencesOfString:@"@\"" withString:@""];
        type = [type stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        NSLog(@"type: %@", type);
        
        //  根据属性的 key 对字典取值
        id value = dict[key];
        
        //   处理以下, 判断这个值是不是字典, 是的话还要继续根据这个 key 的 type 来转换
        //          是不是数组, 是的话拿到声明这个数组中对象类型的方法获取类型, 遍历数组转换
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            //  转到对应类的模型
            Class dictClass = NSClassFromString(type);
            
            if (dictClass) {    // 存在这个类的模型才转
                value = [dictClass objectWithDict:value];
            }
        }
        
        //  是数组的话
        if ([value isKindOfClass:[NSArray class]]) {
            //  看看有没有实现声明数组内是什么类型的方法
            if (![self respondsToSelector:@selector(arrayContainModelClass)]) return obj;
            
            NSString *typ = [self arrayContainModelClass][key];
            
            Class arrayClass = NSClassFromString(typ);
            NSMutableArray *arrayM = [NSMutableArray array];
            for (NSDictionary *dict in value) {
                id model = [arrayClass objectWithDict:dict];
                [arrayM addObject:model];
            }
            
            value = arrayM;
        }
        
        if (value) {
            [obj setValue:value forKey:key];
        }
    }
    
    return obj;
}
@end
