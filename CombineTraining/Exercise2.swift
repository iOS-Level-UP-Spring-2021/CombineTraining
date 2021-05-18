import Combine
import XCTest

// Zadanie 2 (5min)
// Dany jest strumień osób (stringi/emotki):

private let input =
  ["👮‍♀️", "👮‍♀️", "👩‍💻", "👩‍💻", "👨‍⚕️", "👮‍♀️", "👮‍♀️", "👨‍⚕️", "👨‍⚕️"]
  .publisher
  .eraseToAnyPublisher()

// Wybierz z niego tylko policjantów a następnie zamień ich na radiowozy.
// Edytuj tylko strumień przypisany do zmiennej `solution`.

private let solution: AnyPublisher<String, Never> = input
  // TODO
  .eraseToAnyPublisher()

class Exercise2: XCTestCase {

  var resultSubscriber: TestSubscriber<String, Never>!

  override func setUp() {
    resultSubscriber = TestSubscriber()
  }

  override func tearDown() {
    resultSubscriber = nil
  }

  func testSolution() {
    solution.subscribe(resultSubscriber)

    resultSubscriber.assert(valuesEqualTo: ["🚓", "🚓", "🚓", "🚓"])
  }

}
