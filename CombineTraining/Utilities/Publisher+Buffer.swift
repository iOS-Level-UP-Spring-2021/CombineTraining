import Combine

public extension Publisher {

  func buffer(count: Int) -> AnyPublisher<[Self.Output], Failure> {
    return scan([Self.Output]()) { $0.count == count ? [$1] : $0 + [$1] }
      .filter { $0.count == count }
      .eraseToAnyPublisher()
  }

}
