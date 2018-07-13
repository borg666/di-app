import XCTest
import RxSwift

@testable import DIApp

class AnalyticsRequestTests: XCTestCase {

    private let disposeBag: DisposeBag = DisposeBag()

    func testAsUrlRequest_whenHasValidDetail_returnsUrlRequest() {
        let detail = AnalyticsEventDetail(description: "request failed with 401")
        let request = AnalyticsRequest(event: AnalyticsEvent.error(detail))
        let expectedUrl: String = "https://raw.githubusercontent.com/k-marinov/json-resource/master/fruits.json?"
            + "event=error&data=request%20failed%20with%20401"
  
        XCTAssertEqual(request.asUrlRequest().url?.absoluteString, expectedUrl)
        XCTAssertEqual(request.asUrlRequest().httpMethod, "GET")
        XCTAssertEqual(request.asUrlRequest().cachePolicy, URLRequest.CachePolicy.reloadIgnoringLocalCacheData)
        XCTAssertEqual(request.asUrlRequest().timeoutInterval, 33.0)
    }

}
