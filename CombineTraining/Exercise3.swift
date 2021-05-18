import Combine
import XCTest

// Zadanie 3 (5min)
// Dane są dwa strumienie liczb (Int):

private let inputLeft = [3, 4, 7, 15].publisher.eraseToAnyPublisher()
private let inputRight = [1, 2, 21, 5, 9].publisher.eraseToAnyPublisher()

// Połącz te strumienie w jeden a następnie pobieraj elementy dopóki nie pojawi się element większy od 20.
// Edytuj tylko strumień przypisany do zmiennej `solution`.

private let solution: AnyPublisher<Int, Never> = inputLeft
  .eraseToAnyPublisher()

class Exercise3: XCTestCase {

  var resultSubscriber: TestSubscriber<Int, Never>!

  override func setUp() {
    resultSubscriber = TestSubscriber()
  }

  override func tearDown() {
    resultSubscriber = nil
  }

  func testSolution() {
    solution.subscribe(resultSubscriber)

    resultSubscriber.assert(valuesEqualTo: [3, 4, 7, 15, 1, 2])
  }

}
