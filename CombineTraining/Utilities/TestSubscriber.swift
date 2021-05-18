import Combine
import XCTest

public enum Event<Wrapped, Failure: Error> {
  case next(next: Wrapped)
  case completion(completion: Subscribers.Completion<Failure>)
}

public class TestSubscriber<Input, Failure: Error>: Subscriber {
  public func receive(subscription: Subscription) {
    subscription.request(.unlimited)
  }

  public func receive(_ input: Input) -> Subscribers.Demand {
    events.append(.next(next: input))
    return .unlimited
  }

  public func receive(completion: Subscribers.Completion<Failure>) {
    events.append(.completion(completion: completion))
  }




  public init() {}

  private var events: [Event<Input, Failure>] = []

}


public extension TestSubscriber {

  func assert(eventsEqualTo expectation: [Event<Input, Failure>], line: Int = #line) -> String {
    if events.debugDescription == expectation.debugDescription {
      return "✅"
    } else {
      printFailure(expectation.debugDescription, events.debugDescription, line)
      return "❌"
    }
  }

  func assert(valuesEqualTo expectation: [Input], line: UInt = #line, file: StaticString = #file) {
    let result: [Input] = events.compactMap {
      switch $0 {
      case .next(next: let value): return value
      default: return nil
      }
    }

    XCTAssertEqual(expectation.debugDescription, result.debugDescription, file: file, line: line)
  }

  private func printFailure(_ expectation: String, _ result: String, _ line: Int = #line) {
    print("""
            ❌ assertion failed (line \(line))
            Expected: \(expectation)
            Got:      \(result)
            """)
  }

}
