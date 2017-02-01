//
//  RowInitSetTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/28/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestUtils.h"
#import "PolynomialRow.h"


@interface RowInitSetTests : XCTestCase

@end

@implementation RowInitSetTests

- (void)testInit {
    size_t size = 10;
    pln_row_t row;
    pln_row_init(&row, size);

    for (int i = 0; i < size; i++) {
        r_pln_set_ui(&row[i], i);
        XCTAssertEqual(r_pln_cmp_ui(&row[i], i), kCompareFlagEqual);
    }

    pln_row_clear(row, size);
}

- (void)testInitSet {
    size_t size = 10;
    pln_row_t src;
    pln_row_init(&src, size);

    for (int i = 0; i < size; i++) {
        r_pln_set_ui(&src[i], i);
    }

    pln_row_t dst;
    pln_row_init(&dst, size);
    pln_row_set(dst, src, size);

    for (int i = 0; i < size; i++) {
        XCTAssertEqual(r_pln_cmp(&dst[i], src[i]), kCompareFlagEqual);
    }

    pln_row_clear(src, size);
}

@end
