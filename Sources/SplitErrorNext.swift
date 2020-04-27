
import RxSwift

extension ObservableConvertibleType {
    public func splitErrorAndNext<Target>(
        _ transform: @escaping (Element) -> Target
    ) -> (
        next: Observable<Target.Element>,
        error: Observable<Error>
    ) where Target: ObservableConvertibleType {
        
        let stream = self.asObservable()
            .flatMapLatest { element -> Observable<Event<Target.Element>> in
                return transform(element).asObservable()
                    .materialize()
            }
            .share(replay: 1)

        return (
            stream.compactMap { $0.element },
            stream.compactMap { $0.error }
        )
    }
}
