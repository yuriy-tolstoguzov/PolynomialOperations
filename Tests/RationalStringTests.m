//
//  RationalStringTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/24/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RationalPolynomialOperations.h"

@interface RationalStringRepresentationTests : XCTestCase

@end


@implementation RationalStringRepresentationTests

- (void)testRationalStringRepresentation0 {
    r_pln_t op;
    r_pln_init_set_ui(&op, 0b0);

    mp_bitcnt_t stringSize = r_pln_pretty_str_size(op);
    char pretty_str[stringSize];
    r_pln_get_pretty_str(pretty_str, op);

    NSString *str = [[NSString alloc] initWithUTF8String:pretty_str];
    XCTAssertEqualObjects(str, @"0 / 1");
}

- (void)testRationalStringRepresentation01 {
    r_pln_t op;
    r_pln_init_set_ui(&op, 0b1);

    mp_bitcnt_t stringSize = r_pln_pretty_str_size(op);
    char pretty_str[stringSize];
    r_pln_get_pretty_str(pretty_str, op);

    NSString *str = [[NSString alloc] initWithUTF8String:pretty_str];
    XCTAssertEqualObjects(str, @"1 / 1");
}

- (void)testRationalStringRepresentation010000 {
    r_pln_t op;
    r_pln_init_set_ui(&op, 0b1000000000000);

    mp_bitcnt_t stringSize = r_pln_pretty_str_size(op);
    char pretty_str[stringSize];
    r_pln_get_pretty_str(pretty_str, op);

    NSString *str = [[NSString alloc] initWithUTF8String:pretty_str];
    XCTAssertEqualObjects(str, @"x^12 / 1");
}

- (void)testRationalStringRepresentation01276601_010000 {
    r_pln_t op;
    r_pln_init_set_ui(&op, 0b1010111110110000001);
    pln_init_set_ui(op.denominator, 0b1000000000000);

    mp_bitcnt_t stringSize = r_pln_pretty_str_size(op);
    char pretty_str[stringSize];
    r_pln_get_pretty_str(pretty_str, op);

    NSString *str = [[NSString alloc] initWithUTF8String:pretty_str];
    XCTAssertEqualObjects(str, @"x^18 + x^16 + x^14 + x^13 + x^12 + x^11 + x^10 + x^8 + x^7 + 1 / x^12");
}

- (void)testGetString01276601_010000 {
    r_pln_t op;
    r_pln_init_set_ui(&op, 0b1010111110110000001);
    pln_init_set_ui(op.denominator, 0b1000000000000);

    mp_bitcnt_t stringSize = r_pln_str_size(op, 2);
    char pretty_str[stringSize];
    r_pln_get_str(pretty_str, op, 2);

    NSString *str = [[NSString alloc] initWithUTF8String:pretty_str];
    XCTAssertEqualObjects(str, @"1010111110110000001/1000000000000");
}

@end
