//
// Copyright © Essential Developer. All rights reserved.
//

import XCTest
import EssentialFeediOS
@testable import EssentialFeed

class ImageCommentsSnapshotTests: XCTestCase {
	func test_listWithContent() {
		let sut = makeSUT()

		sut.display(comments())

		assert(snapshot: sut.snapshot(for: .iPhone(style: .light)), named: "IMAGE_COMMENTS_light")
		assert(snapshot: sut.snapshot(for: .iPhone(style: .dark)), named: "IMAGE_COMMENTS_dark")
		assert(snapshot: sut.snapshot(for: .iPhone(style: .light, contentSize: .extraExtraExtraLarge)), named: "IMAGE_COMMENTS_light_extraExtraExtraLarge")
	}

	// MARK: - Helpers

	private func makeSUT() -> ListViewController {
		let bundle = Bundle(for: ListViewController.self)
		let storyboard = UIStoryboard(name: "ImageComments", bundle: bundle)
		let controller = storyboard.instantiateInitialViewController() as! ListViewController
		controller.loadViewIfNeeded()
		controller.tableView.showsVerticalScrollIndicator = false
		controller.tableView.showsHorizontalScrollIndicator = false
		return controller
	}

	private func comments() -> [CellController] {
		return []
	}
}
