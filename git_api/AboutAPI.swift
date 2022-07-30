//
//  File.swift
//  git_api
//
//  Created by 須崎良祐 on 2022/07/30.
//

import Foundation
import SwiftUI

struct APIUrl {
    static func githubRepo(query: String) -> URL {
        return URL(string: "https://api.github.com/search/repositories?q=\(query)")!
    }
}


final class APIClient {
    func fetchGithubRepo(url: URL) async throws -> GithubRepoList {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
                  throw APIError.unknownError
              }
        do {
            let list = try JSONDecoder().decode(GithubRepoList.self, from: data)
            return list
        } catch {
            throw APIError.jsonParseError
        }
    }
}

enum APIError: Error {
    case customError(message: String)
    case jsonParseError
    case unknownError

    var message: String {
        switch self {
        case .customError(let message):
            return message
        case .jsonParseError:
            return "申し訳ありません、データが見つかりませんでした。"
        default:
            return "不具合が発生しました。お手数ですが時間をおいてもう一度お試しください。"
        }
    }
}
