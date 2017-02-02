//
//  MatrixDecimationTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/30/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestUtils.h"
#import "PolynomialDecimation.h"

@interface MatrixDecimationTests : XCTestCase

@end


@implementation MatrixDecimationTests

- (void)testDecimation23 {
    pln_t pln;
    pln_init_set_ui(pln, 023);

    pln_t rop;
    pln_init(rop);
    pln_decimate(&rop, pln, 3);

    pln_t expected_rop;
    pln_init_set_ui(expected_rop, 0b11111);

    XCTAssertEqual(pln_cmp(rop, expected_rop), kCompareFlagEqual);

    pln_clear(pln);
    pln_clear(rop);
    pln_clear(expected_rop);
}

- (void)testDecimation10021 {
    pln_t pln;
    pln_init_set_ui(pln, 010021);

    pln_t rop;
    pln_init(rop);
    pln_decimate(&rop, pln, 1);

    pln_t expected_rop;
    pln_init_set_ui(expected_rop, 010401);

    XCTAssertEqual(pln_cmp(rop, expected_rop), kCompareFlagEqual);

    pln_clear(pln);
    pln_clear(rop);
    pln_clear(expected_rop);
}



@end
