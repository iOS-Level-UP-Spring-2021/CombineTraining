import Combine
import XCTest

// Zadanie 4 (5min)
// Dany jest skończony strumień słów (String):

private let input: AnyPublisher<String, Never> =
  ["ala", "ma", "kota"]
  .publisher
  .eraseToAnyPublisher()

// Ze strumienia stringów utwórz jedno zdanie.
// - pamiętaj że zdania rozpoczynamy z dużej litery
// - pamiętaj o spacjach pomiędzy słowami
// - zdanie zakończ kropką (bezpośrednio po ostatnim słowie)
// Edytuj tylko strumień przypisany do zmiennej `solution`.

private let solution: AnyPublisher<String, Never> = input
  .eraseToAnyPublisher()

class Exercise4: XCTestCase {

  var resultSubscriber: TestSubscriber<String, Never>!

  override func setUp() {
    resultSubscriber = TestSubscriber()
  }

  override func tearDown() {
    resultSubscriber = nil
  }

  func testSolution() {
    solution.subscribe(resultSubscriber)

    resultSubscriber.assert(valuesEqualTo: ["Ala ma kota."])
  }

}
