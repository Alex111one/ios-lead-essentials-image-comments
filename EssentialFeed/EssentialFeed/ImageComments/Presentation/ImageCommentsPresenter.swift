//
// Copyright © Essential Developer. All rights reserved.
//

import Foundation

public struct ImageCommentsViewModel {
	public let comments: [ImageCommentViewModel]
}

public struct ImageCommentViewModel: Equatable {
	public let message: String
	public let date: String
	public let username: String

	public init(message: String, date: String, username: String) {
		self.message = message
		self.date = date
		self.username = username
	}
}

public final class ImageCommentsPresenter {
	public static var title: String {
		NSLocalizedString(
			"IMAGE_COMMENTS_VIEW_TITLE",
			tableName: "ImageComments",
			bundle: Bundle(for: Self.self),
			comment: "Title for the image comments view")
	}

	public static func map(_ comments: [ImageComment], currentDate: Date = Date(), calendar: Calendar = .current, locale: Locale = .current) -> ImageCommentsViewModel {
		let formatter = RelativeDateTimeFormatter()
		formatter.locale = locale
		formatter.calendar = calendar
		return ImageCommentsViewModel(comments: comments.map {
			ImageCommentViewModel(
				message: $0.message,
				date: formatter.localizedString(for: $0.createdAt, relativeTo: Date()),
				username: $0.username)
		})
	}
}
