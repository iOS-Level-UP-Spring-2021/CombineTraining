import Combine
import XCTest

// Zadanie 1 (5min)
// Dany jest strumień elementów jadalnych (stringi/emotki):

private let input =
  ["🍕", "🍎", "🍎", "🍺", "🥕", "🍺", "🥕", "🥕", "🍺", "🍕"]
  .publisher
  .eraseToAnyPublisher()

// Użyj odpowiedniego operatora, aby otrzymać tylko te, które programiści lubią najbardziej. Podpowiedź: 🍕 i 🍺 :)
// Edytuj tylko strumień przypisany do zmiennej `solution`.

private let solution: AnyPublisher<String, Never> = input
  // TODO
  .eraseToAnyPublisher()

class Exercise1: XCTestCase {

  var resultSubscriber: TestSubscriber<String, Never>!

  override func setUp() {
    resultSubscriber = TestSubscriber()
  }

  override func tearDown() {
    resultSubscriber = nil
  }

  func testSolution() {
    solution.subscribe(resultSubscriber)

    resultSubscriber.assert(valuesEqualTo: ["🍕", "🍺", "🍺", "🍺", "🍕"])
  }

}
