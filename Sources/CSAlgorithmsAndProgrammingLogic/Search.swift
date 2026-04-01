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

extension BidirectionalCollection where Element: Comparable {
  /// Attempts to find the index at which a given element is in this collection
  /// using the binary search algorithm. This collection is implied to already
  /// be sorted.
  ///
  /// In binary search, the element at the ⌈*n* ÷ 2⌋-th index of a sorted
  /// subsequence containing *n* elements is compared against the element whose
  /// index is being searched for. In case that first element is less than the
  /// target one, this search is performed on right-hand half of such
  /// subsequence; otherwise, on the left-hand one. This process is repeated
  /// until the target element is found.
  ///
  /// - Complexity: O(log *n*), where *n* is the amount of elements in this
  ///   collection.
  /// - Parameter element: Element to search for.
  /// - Returns: The index of the given element; or `nil` if the element is not
  ///   in this collection.
  func binarySearch(forIndexOf element: Element) -> Index? {
    if isEmpty { return nil }
    let index = index(startIndex, offsetBy: count / 2)
    return if element > self[index] {
      self[self.index(after: index)...].binarySearch(forIndexOf: element)
    } else if element == self[index] { index } else {
      self[...self.index(before: index)].binarySearch(forIndexOf: element)
    }
  }
}
