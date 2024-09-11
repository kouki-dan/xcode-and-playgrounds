//
//  xcode_and_playgroundsTests.swift
//  xcode-and-playgroundsTests
//
//  Created by Kouki Saito on 2024/09/09.
//

import Testing
@testable import xcode_and_playgrounds

struct xcode_and_playgroundsTests {

    @Test func example() async throws {
        let actual = testableFunction()
        #expect(actual == "OK")
    }

}
