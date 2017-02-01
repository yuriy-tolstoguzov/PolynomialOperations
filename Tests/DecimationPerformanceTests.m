//
//  DecimationPerformanceTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 2/1/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PolynomialDecimation.h"

@interface DecimationPerformanceTests : XCTestCase

@end

@implementation DecimationPerformanceTests

- (void)testDecimation400000000000000000000000000151 {
    [self measureBlock:^{
        pln_t pln;
        pln_init(pln);
        pln_set_str(pln, "400000000000000000000000000151", 8);

        pln_t rop;
        pln_init(rop);
        pln_decimate(&rop, pln, 7);

        pln_clear(pln);
        pln_clear(rop);
    }];
}

@end
