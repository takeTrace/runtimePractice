//
//  Article.h
//  RuntimeP
//
//  Created by Mac on 16/11/6.
//  Copyright © 2016年 Lneayce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject
@property (nonatomic, strong) NSString *_id;

@property (nonatomic, strong) NSArray *images;

@property (nonatomic, strong) NSString *source;

@property (nonatomic, strong) NSString *who;

@property (nonatomic, strong) NSString *publishedAt;

@property (nonatomic, strong) NSString *used;

@property (nonatomic, strong) NSString *createdAt;

@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSString *desc;

@property (nonatomic, strong) NSString *url;


- (void)solidMethod;
@end
