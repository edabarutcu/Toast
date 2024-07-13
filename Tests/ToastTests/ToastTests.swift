import XCTest
import SwiftUI
@testable import Toast

@available(iOS 14.0, *)
final class ToastTests: XCTestCase {
    
    @State private var toast: Toast? = nil
    
    func testToastCreation() {
        let toast = Toast(style: .success, message: "Success Message", duration: 3.0, width: 200)
        
        XCTAssertEqual(toast.style, .success)
        XCTAssertEqual(toast.message, "Success Message")
        XCTAssertEqual(toast.duration, 3.0)
        XCTAssertEqual(toast.width, 200)
    }
    
    func testToastModifierShowsToast() {
        let expectation = XCTestExpectation(description: "Toast should show and dismiss correctly")
        
        let initialToast = Toast(style: .info, message: "Info Message")
        toast = initialToast
        
        let modifier = ToastModifier(toast: Binding(get: { self.toast }, set: { self.toast = $0 }))
        
        // Simulating the showing of the toast
        modifier.showToast()
        
        XCTAssertNotNil(toast) // Check if the toast is not nil
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.1) {
            XCTAssertNil(self.toast) // After duration, toast should be dismissed
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 4.0)
    }
}

