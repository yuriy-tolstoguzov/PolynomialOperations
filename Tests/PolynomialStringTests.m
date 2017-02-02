//
//  PolynomialStringTests.m
//  PolynomialStringTests
//
//  Created by Yuriy Tolstoguzov on 1/2/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PolynomialOperations.h"
#import "TestUtils.h"

@interface PolynomialStringTests : XCTestCase

@end


@implementation PolynomialStringTests

- (void)testStringRepresentation0 {
    pln_t op;
    pln_init(op);
    const char *source = "0";
    int flag = pln_set_str(op, source, 2);
    XCTAssertEqual(flag, kReturnFlagSuccess);

    mp_bitcnt_t stringSize = pln_pretty_str_size(op);
    char pretty_str[stringSize];
    pln_get_pretty_str(pretty_str, op);

    NSString *str = [[NSString alloc] initWithUTF8String:pretty_str];
    XCTAssertEqualObjects(str, @"0");
}

- (void)testStringRepresentation01 {
    pln_t op;
    pln_init(op);
    const char *source = "1";
    int flag = pln_set_str(op, source, 2);
    XCTAssertEqual(flag, kReturnFlagSuccess);

    mp_bitcnt_t string_size = pln_pretty_str_size(op);
    char pretty_str[string_size];
    pln_get_pretty_str(pretty_str, op);

    NSString *str = [[NSString alloc] initWithUTF8String:pretty_str];
    XCTAssertEqualObjects(str, @"1");
}

- (void)testStringRepresentation010000 {
    pln_t op;
    pln_init(op);
    const char *source = "1000000000000";
    int flag = pln_set_str(op, source, 2);
    XCTAssertEqual(flag, kReturnFlagSuccess);

    mp_bitcnt_t stringSize = pln_pretty_str_size(op);
    char pretty_str[stringSize];
    pln_get_pretty_str(pretty_str, op);

    NSString *str = [[NSString alloc] initWithUTF8String:pretty_str];
    XCTAssertEqualObjects(str, @"x^12");
}

- (void)testStringRepresentation025 {
    pln_t op;
    pln_init(op);
    const char *source = "10101";
    int flag = pln_set_str(op, source, 2);
    XCTAssertEqual(flag, kReturnFlagSuccess);

    pln_t expected_rop;
    pln_init_set_ui(expected_rop, 025);
    XCTAssertEqual(pln_cmp(op, expected_rop), kCompareFlagEqual);

    mp_bitcnt_t stringSize = pln_pretty_str_size(op);
    char pretty_str[stringSize];
    pln_get_pretty_str(pretty_str, op);

    NSString *str = [[NSString alloc] initWithUTF8String:pretty_str];
    XCTAssertEqualObjects(str, @"x^4 + x^2 + 1");
}

- (void)testStringRepresentation01276601 {
    pln_t polinom;
    pln_init(polinom);
    const char *source = "1010111110110000001";
    int flag = pln_set_str(polinom, source, 2);
    XCTAssertEqual(flag, kReturnFlagSuccess);

    mp_bitcnt_t stringSize = pln_pretty_str_size(polinom);
    char pretty_str[stringSize];
    pln_get_pretty_str(pretty_str, polinom);

    NSString *str = [[NSString alloc] initWithUTF8String:pretty_str];
    XCTAssertEqualObjects(str, @"x^18 + x^16 + x^14 + x^13 + x^12 + x^11 + x^10 + x^8 + x^7 + 1");
}

@end
