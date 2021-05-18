import Combine
import XCTest

// Zadanie 6 (10min)
// Dany jest strumień opcjonalnych liczb (Int?):

private let input: AnyPublisher<Int?, Never> = [Int?](
  arrayLiteral: 2,   6,   8,    3, nil, 24, -1, 8, 4,  8,
  9,  41,   1, -109,   0,  9, 16, 4, 6, -2,
  8,   9,   1,    9,   1,  2,  7, 5, 3,  1,
  9,   3,   3,    4, nil,  8, -1, 9, 2,  9,
  4, -44, 111,  nil,   1,  6)
  .publisher
  .eraseToAnyPublisher()

// Zignoruj nile oraz wartości spoza przedziału 0-9.
// Zbuduj tablicę numerów telefonów w podanym formacie ["123-456-789", "234-567-890", ...].
// Każdy numer telefonu musi mieć dokładnie 9 cyfr.
// Edytuj tylko strumień przypisany do zmiennej `solution`.

private let solution: AnyPublisher<String, Never> = input
  .map { _ in "" }
  .eraseToAnyPublisher()

class Exercise6: XCTestCase {

  var resultSubscriber: TestSubscriber<String, Never>!

  override func setUp() {
    resultSubscriber = TestSubscriber()
  }

  override func tearDown() {
    resultSubscriber = nil
  }

  func testSolution() {
    solution.subscribe(resultSubscriber)

    resultSubscriber.assert(valuesEqualTo: ["268-384-891", "094-689-191", "275-319-334"])
  }

}
