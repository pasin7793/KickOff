import Foundation

// MARK: - NewsList
struct NewsList: Codable{
    let news: News
}


// MARK: - News
struct News: Codable{
    let data: [NewsData]
}

// MARK: - Datum
struct NewsData: Codable{
    let imageUrl: String
    let title, gmtTime: String
    let sourceIconUrl: String
    let sourceStr: String
    let page: Page
}

// MARK: - Page
struct Page: Codable {
    let url: String
}
