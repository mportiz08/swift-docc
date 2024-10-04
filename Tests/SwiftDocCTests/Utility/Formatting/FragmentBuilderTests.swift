/*
 This source file is part of the Swift.org open source project

 Copyright (c) 2024 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See https://swift.org/LICENSE.txt for license information
 See https://swift.org/CONTRIBUTORS.txt for Swift project authors
*/

import XCTest
@testable import SwiftDocC

typealias Fragment = FragmentBuilder.Fragment

class FragmentBuilderTests: XCTestCase {
    func testBuildFragments() {
        XCTAssertEqual(
            FragmentBuilder().buildFragments(from: """
            @attached(peer)
            macro Test<C1, C2>(
                _ displayName: String? = nil,
                _ traits: any TestTrait...,
                arguments zippedCollections: Zip2Sequence<C1, C2>
            )
            where
                C1: Collection,
                C1: Sendable,
                C2: Collection,
                C2: Sendable,
                C1.Element: Sendable,
                C2.Element: Sendable
            """),
            [
                Fragment(spelling: "@", kind: .keyword),
                Fragment(spelling: "attached", kind: .attribute),
                Fragment(spelling: "("),
                Fragment(spelling: "peer"),
                Fragment(spelling: ")"),
                Fragment(spelling: "\n"),
                Fragment(spelling: "macro", kind: .keyword),
                Fragment(spelling: " "),
                Fragment(spelling: "Test"),
                Fragment(spelling: "<"),
                Fragment(spelling: "C1"),
                Fragment(spelling: ","),
                Fragment(spelling: " "),
                Fragment(spelling: "C2"),
                Fragment(spelling: ">"),
                Fragment(spelling: "("),
                Fragment(spelling: "\n    "),
                Fragment(spelling: "_", kind: .externalParameter),
                Fragment(spelling: " "),
                Fragment(spelling: "displayName", kind: .internalParameter),
                Fragment(spelling: ":"),
                Fragment(spelling: " "),
                Fragment(spelling: "String", kind: .typeIdentifier),
                Fragment(spelling: "?"),
                Fragment(spelling: " "),
                Fragment(spelling: "="),
                Fragment(spelling: " "),
                Fragment(spelling: "nil", kind: .keyword),
                Fragment(spelling: ","),
                Fragment(spelling: "\n    "),
                Fragment(spelling: "_", kind: .externalParameter),
                Fragment(spelling: " "),
                Fragment(spelling: "traits", kind: .internalParameter),
                Fragment(spelling: ":"),
                Fragment(spelling: " "),
                Fragment(spelling: "any", kind: .keyword),
                Fragment(spelling: " "),
                Fragment(spelling: "TestTrait", kind: .typeIdentifier),
                Fragment(spelling: "..."),
                Fragment(spelling: ","),
                Fragment(spelling: "\n    "),
                Fragment(spelling: "arguments", kind: .externalParameter),
                Fragment(spelling: " "),
                Fragment(spelling: "zippedCollections", kind: .internalParameter),
                Fragment(spelling: ":"),
                Fragment(spelling: " "),
                Fragment(spelling: "Zip2Sequence", kind: .typeIdentifier),
                Fragment(spelling: "<"),
                Fragment(spelling: "C1", kind: .typeIdentifier),
                Fragment(spelling: ","),
                Fragment(spelling: " "),
                Fragment(spelling: "C2", kind: .typeIdentifier),
                Fragment(spelling: ">"),
                Fragment(spelling: "\n"),
                Fragment(spelling: ")"),
                Fragment(spelling: "\n"),
                Fragment(spelling: "where", kind: .keyword),
                Fragment(spelling: "\n    "),
                Fragment(spelling: "C1", kind: .typeIdentifier),
                Fragment(spelling: ":"),
                Fragment(spelling: " "),
                Fragment(spelling: "Collection", kind: .typeIdentifier),
                Fragment(spelling: ","),
                Fragment(spelling: "\n    "),
                Fragment(spelling: "C1", kind: .typeIdentifier),
                Fragment(spelling: ":"),
                Fragment(spelling: " "),
                Fragment(spelling: "Sendable", kind: .typeIdentifier),
                Fragment(spelling: ","),
                Fragment(spelling: "\n    "),
                Fragment(spelling: "C2", kind: .typeIdentifier),
                Fragment(spelling: ":"),
                Fragment(spelling: " "),
                Fragment(spelling: "Collection", kind: .typeIdentifier),
                Fragment(spelling: ","),
                Fragment(spelling: "\n    "),
                Fragment(spelling: "C2", kind: .typeIdentifier),
                Fragment(spelling: ":"),
                Fragment(spelling: " "),
                Fragment(spelling: "Sendable", kind: .typeIdentifier),
                Fragment(spelling: ","),
                Fragment(spelling: "\n    "),
                Fragment(spelling: "C1", kind: .typeIdentifier),
                Fragment(spelling: "."),
                Fragment(spelling: "Element", kind: .typeIdentifier),
                Fragment(spelling: ":"),
                Fragment(spelling: " "),
                Fragment(spelling: "Sendable", kind: .typeIdentifier),
                Fragment(spelling: ","),
                Fragment(spelling: "\n    "),
                Fragment(spelling: "C2", kind: .typeIdentifier),
                Fragment(spelling: "."),
                Fragment(spelling: "Element", kind: .typeIdentifier),
                Fragment(spelling: ":"),
                Fragment(spelling: " "),
                Fragment(spelling: "Sendable", kind: .typeIdentifier),
                Fragment(spelling: ""),
            ]
        )
    }
}
