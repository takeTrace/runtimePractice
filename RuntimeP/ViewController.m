//
//  ViewController.m
//  RuntimeP
//
//  Created by Mac on 16/11/6.
//  Copyright © 2016年 Lneayce. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import <objc/message.h>
//#import <objc/runtime.h>
#import "Article+customProperty.h"
#import "NSObject+KV.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self logProperty];
    
    NSDictionary *dict = @{@"_id": @"111" ,@"source":@"safa" ,@"who":@"ajksfka" ,@"publishedAt":@"alskfl",@"used":@"asfl" ,@"createdAt":@"aklsfla" ,@"type":@"asfla" ,@"desc":@"alsfa" ,@"url":@"ajksfk"};
    
    
    Article *art = [Article objectWithDict:dict];
    
    NSLog(@"art: %@", art);
    
    
}

- (void)test2
{
    Article *art = [[Article alloc] init];
    
    objc_msgSend(art, @selector(publish));
    objc_msgSend([Article class], @selector(run));
    
    objc_msgSend(objc_getClass("Article"), @selector(run));
    
    //    objc_msgSend([Article class], @selector(lei));
    
    objc_msgSend(art, @selector(shili));
    
    [art performSelector:@selector(shili)];
    
    
    [art solidMethod];
    
    [art performSelector:@selector(subClassMethod)];
    
    
    art.title = @"hahahahah";
    
    NSLog(@"%@", art.title);
}
    
    
- (void)logProperty {

    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    [mgr GET:@"https://gank.io/api/data/iOS/20/2" parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary * responseObject) {
        
        
        NSDictionary *art = [responseObject[@"results"] firstObject];
        
        NSMutableString *property = [NSMutableString string];
        //  根据字典里的键值对获取 key, 作为属性名
        [art enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSString *type;
            NSString *str;
            
            if ([obj isKindOfClass:NSClassFromString(@"__NSCFString")]) {
                type = @"NSString";
            }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFArray")]){
                type = @"NSArray";
            }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")]){
                type = @"int";
            }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFDictionary")]){
                type = @"NSDictionary";
            } else {
                NSLog(@"%@", NSStringFromClass([obj class]));
                type = @"NSString";
            }
            
            //   判断类型, 看是需要设置属性对象还是普通的参数
//            if ([type containsString:@"NS"]) {
//                str = [NSString stringWithFormat:@"@property (nonatomic, strong) %@ *%@;",type,key];
//            }else{
//                str = [NSString stringWithFormat:@"@property (nonatomic, assign) %@ %@;",type,key];
//            }
            str = [NSString stringWithFormat:@"@\"%@\": ",key];
            [property appendFormat:@"%@,", str];
        }];
        
        NSLog(@"%@", property);
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"夹子数据失败");
    }];
}

@end
