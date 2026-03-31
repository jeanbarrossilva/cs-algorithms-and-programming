// ===-----------------------------------------------------------------------===
// Copyright © 2026 Jean Silva
//
// This file is part of the CSAlgorithmsAndProgramming open-source project.
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
where Self: BidirectionalCollection, Self: MutableCollection {
  /// Sorts this collection using the bubble sort algorithm.
  ///
  /// Bubble sort is one of the simplest algorithms for sorting elements of a
  /// collection — and the most inefficient one: given *n* elements, the time
  /// complexity will be O(*n*) if the collection is already sorted; otherwise,
  /// O(*n*²).
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
  ///   both elements should be swaped.
  mutating func bubbleSort(by areInOrder: (Element, Element) -> Bool) {
    var wasAlreadySorted = true
    for i in indices[..<indices.index(before: indices.endIndex)] {
      let J = indices[indices.index(after: i)...]
      for j in J {
        let a = self[i]
        let b = self[j]
        if areInOrder(a, b) {
          continue
        } else if wasAlreadySorted && i == indices.last && j == J.first {
          // We have iterated over the entire collection exactly one time, and
          // no element was swapped. This means that the collection is already
          // sorted; we can skip the other n² - 1 iterations and return early.
          return
        } else {
          self[i] = b
          self[j] = a
          wasAlreadySorted = false
        }
      }
    }
  }
}
