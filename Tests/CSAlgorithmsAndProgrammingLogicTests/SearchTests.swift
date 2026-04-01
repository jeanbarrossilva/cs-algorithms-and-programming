// ===-----------------------------------------------------------------------===
// Copyright © 2026 Jean Silva
//
// This file is part of the CSAlgorithmsAndProgrammingLogic open-source project.
//
// This program is free software: you can redistribute it and/or modify it under
// the terms of the GNU General Public License as published by the Free Software
// Foundation, either version 3 of the License, or (at your option) any later
// version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
// details.
//
// You should have received a copy of the GNU General Public License along with
// this program. If not, see https://www.gnu.org/licenses.
// ===-----------------------------------------------------------------------===

@testable import CSAlgorithmsAndProgrammingLogic
import Testing

struct SearchTests {
  @Test
  func binarySearches() {
    let A = [Int](count: 64) { i in (i + 1) * 2 }
    #expect(A.binarySearch(forIndexOf: 0) == nil)
    #expect(A.binarySearch(forIndexOf: 2) == A.startIndex)
  }
}
