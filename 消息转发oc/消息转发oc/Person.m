//
//  Person.m
//  消息转发oc
//
//  Created by define on 2018/8/11.
//  Copyright © 2018年 刘绍强. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "PersonTwo.h"
#import "PersonThree.h"

void try(id self,SEL_cmd){
    NSLog(@"我能一切皆有可能");
}

@implementation Person


/*
 消息转发机制
   防止报错unrecognized selector
有任何一步完成都不会执行下面的操作
 系统处理的步骤:
   1、第一步先调用这个方法，看有没有动态添加方法。
    resolveInstanceMethod 用来添加动态方法
   2、没有动态添加方法，然后进行消息转发
 forwardingTargetForSelector:(SEL)aSelector
   3、
 
 */



+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(try)) {
        class_addMethod(self, @selector(try), (IMP)try, "V@:");
        return YES;
         NSLog(@"%@",NSStringFromSelector(sel));
    }
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
    NSLog(@"%s",__func__);
     NSLog(@"%@",NSStringFromSelector(aSelector));
    PersonTwo *personTwo = [[PersonTwo alloc]init];
    
    if ([personTwo respondsToSelector:aSelector]) {
        return personTwo;
    }
    return [super forwardingTargetForSelector:aSelector];
}


//获取到选择子的的方法签名，如果获取不到方法签名也会抛异常
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    
    NSLog(@"Method signature for selector: %@",NSStringFromSelector(aSelector));
    if (aSelector == @selector(code)) {
        return [NSMethodSignature signatureWithObjCTypes:"V@:@"];
    }
    return [super methodSignatureForSelector:aSelector];
}


- (void)forwardInvocation:(NSInvocation *)anInvocation{
    
    NSLog(@"forwardInvocation : %@",NSStringFromSelector([anInvocation selector]));
    if ([anInvocation selector] == @selector(code)) {
        PersonThree *three = [[PersonThree alloc]init];
        [anInvocation invokeWithTarget:three];
    }
}









@end
