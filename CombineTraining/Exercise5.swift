import Combine
import XCTest

// Zadanie 5 (5min)
// Dany jest skończony strumień liczb (Int):

private let input: AnyPublisher<Int, Never> =
  [1, 2, 2, 3, 4, 5, 5, 6, 7, 8, 9, 9]
  .publisher
  .eraseToAnyPublisher()

// Użyj odpowiednich operatorów aby otrzymać tablicę, w której pominięte
// zostaną takie same elementy, które następują bezpośrednio po sobie.
// Edytuj tylko strumień przypisany do zmiennej `solution`.

private let solution: AnyPublisher<[Int], Never> = input
  .map { _ in [] }
  .eraseToAnyPublisher()

class Exercise5: XCTestCase {

  var resultSubscriber: TestSubscriber<[Int], Never>!

  override func setUp() {
    resultSubscriber = TestSubscriber()
  }

  override func tearDown() {
    resultSubscriber = nil
  }

  func testSolution() {
    solution.subscribe(resultSubscriber)

    resultSubscriber.assert(valuesEqualTo: [[1, 2, 3, 4, 5, 6, 7, 8, 9]])
  }

}
