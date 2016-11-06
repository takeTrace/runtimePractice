//
//  NSObject+KV.h
//  RuntimeP
//
//  Created by Mac on 16/11/6.
//  Copyright © 2016年 Lneayce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KV)
+ (instancetype)objectWithDict:(NSDictionary *)dict;

+ (NSDictionary *)arrayContainModelClass;
@end
