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

extension Sequence
where Self: MutableCollection, Indices: BidirectionalCollection {
  /// Sorts this collection using the bubble sort algorithm.
  ///
  /// Bubble sort is one of the simplest algorithms for sorting elements of a
  /// collection — and may be one of the most inefficient: given *n* elements,
  /// the time complexity will be, at best, O(*n*) if the collection is already
  /// sorted; otherwise, O(*n*²).
  ///
  /// Every element at index *i* in this collection will be compared to each of
  /// those by which it is succeeded, and swapped with such successor in case
  /// both the element at *i* and that at *i* + *j*, with *i* < *j* < *n*, where
  /// *j* is the distance between both in indices, are deemed unordered.
  ///
  /// - Complexity: O(*n*²).
  /// - Parameter areInOrder: Determines whether two elements of this
  ///   collection, one at index *i* and another at index *i* + *j*, are already
  ///   sorted. This closure returning `false` indicates to the algorithm that
  ///   both elements should be swapped.
  mutating func bubbleSort(by areInOrder: (Element, Element) -> Bool) {
    var didSwapInLastIteration = false
    let indexOfSecondIndex = indices.index(after: indices.startIndex)
    var indexOfSortingEndIndex = indices.index(before: indices.endIndex)
    repeat {
      for startingIndex in indices[..<indexOfSortingEndIndex] {
        let adjacentIndex = index(after: startingIndex)
        let startingElement = self[startingIndex]
        let adjacentElement = self[adjacentIndex]
        if areInOrder(startingElement, adjacentElement) {
          didSwapInLastIteration = false
          continue
        }
        self[startingIndex] = adjacentElement
        self[adjacentIndex] = startingElement
        didSwapInLastIteration = true
      }
      guard indexOfSortingEndIndex > indexOfSecondIndex else { break }
      indexOfSortingEndIndex = indices.index(before: indexOfSortingEndIndex)
    } while didSwapInLastIteration
  }
}
