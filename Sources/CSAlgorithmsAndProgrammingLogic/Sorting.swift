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
where
  Self: BidirectionalCollection, Self: MutableCollection, Element: Comparable
{
  /// Sorts this collection using the bubble sort algorithm.
  ///
  /// Bubble sort is one of the simplest algorithms for sorting elements of a
  /// collection — and may be one of the most inefficient: given *n* elements,
  /// the time complexity will be, at best, O(*n*) if the collection is already
  /// sorted; otherwise, O(*n*²).
  ///
  /// An iteration is performed over each element of this collection; such
  /// element is, then, compared to the one adjacent to it, with both being
  /// swapped in case the first is greater than the second. Upon reaching the
  /// last pair, subsequent iterations from the start of the resulting
  /// collection will not be performed if no two elements were swapped in the
  /// last one; otherwise, this process repeats.
  ///
  /// This is similar to ``selectionSort(by:)``.
  ///
  /// - Complexity: O(*n*²).
  mutating func bubbleSort() {
    guard count > 1 else { return }
    var didSwapInLastIteration = false
    let secondIndex = index(after: indices.startIndex)
    var sortingEndIndex = index(before: indices.endIndex)
    repeat {
      for startingIndex in indices[..<sortingEndIndex] {
        let adjacentIndex = index(after: startingIndex)
        let startingElement = self[startingIndex]
        let adjacentElement = self[adjacentIndex]
        guard startingElement > adjacentElement else {
          didSwapInLastIteration = false
          continue
        }
        self[startingIndex] = adjacentElement
        self[adjacentIndex] = startingElement
        didSwapInLastIteration = true
      }
      guard sortingEndIndex > secondIndex else { break }
      sortingEndIndex = index(before: sortingEndIndex)
    } while didSwapInLastIteration
  }

  /// Sorts this collection using the insertion sort algorithm.
  ///
  /// Insertion sort works as follows:
  ///
  /// 1. The element at *i*, where *i* starts off by being the second index of
  ///    this collection containing *n* elements, is considered to be the "key"
  ///    element.
  /// 2. The key is compared to each of its predecessors at *j*, where
  ///    0 ≤ *j* < *i*.
  /// 3. Once the lower predecessor which is greater than the key is
  ///    encountered, such element and those succeeding it are offset by one
  ///    index.
  /// 4. The key element is placed at the index at which that lower predecessor
  ///    was before being offset.
  /// 5. *i* is incremented.
  ///
  /// This process is repeated until *i* becomes the last index of this
  /// collection.
  ///
  /// - Complexity: O(*n*²).
  mutating func insertionSort() {
    guard count > 1 else { return }
    for keyIndex in indices[index(after: startIndex)...] {
      let key = self[keyIndex]
      var predecessorIndex = index(before: keyIndex)
      var predecessor: Element { self[predecessorIndex] }
      while predecessorIndex >= startIndex && key < predecessor {
        self[index(after: predecessorIndex)] = predecessor
        predecessorIndex = index(before: predecessorIndex)
      }
      self[index(after: predecessorIndex)] = key
    }
  }

  /// Sorts this collection using the selection sort algorithm.
  ///
  /// Every element at index *i* will be compared to each of those by which it
  /// is succeeded, and swapped with such successor in case both the element at
  /// *i* and that at *i* + *j*, with *i* < *j* < *n*, where *j* is the distance
  /// between both in indices, are unordered.
  ///
  /// This is similar to ``bubbleSort(by:)``.
  ///
  /// - Complexity: O(*n*²), where *n* is the amount of elements in
  ///   collection.
  mutating func selectionSort() {
    guard count > 1 else { return }
    var didSwapInLastIteration = false
    repeat {
      for startingIndex in indices[..<index(before: endIndex)] {
        for successorIndex in indices[index(after: startingIndex)...] {
          let startingElement = self[startingIndex]
          let successorElement = self[successorIndex]
          guard startingElement > successorElement else {
            didSwapInLastIteration = false
            continue
          }
          self[startingIndex] = successorElement
          self[successorIndex] = startingElement
          didSwapInLastIteration = true
        }
      }
    } while didSwapInLastIteration
  }
}
