//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftNIO open source project
//
// Copyright (c) 2020-2021 Apple Inc. and the SwiftNIO project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftNIO project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import NIOPosix

func run(identifier: String) {
    measure(identifier: identifier) {
        var numberDone = 1
        for _ in 0..<1000 {
            let newDones = try! UDPShared.doUDPRequests(group: group, number: 1)
            precondition(newDones == 1)
            numberDone += newDones
        }
        return numberDone
    }
}
