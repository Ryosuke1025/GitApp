//
//  Struct.swift
//  git_api
//
//  Created by 須崎良祐 on 2022/07/30.
//
import Foundation
import SwiftUI

struct GithubRepoList: Codable {
    let items: [GithubRepo]
}

struct GithubRepo: Codable, Identifiable {
    let id: Int
    let fullName: String
    var name: String
    var description: String?
    let stargazersCount: Int
    let htmlUrl: String
    let owner: GithubRepoOwner

    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case name
        case description
        case stargazersCount = "stargazers_count"
        case htmlUrl = "html_url"
        case owner
    }
}

struct GithubRepoOwner: Codable {
    let avatarUrl: String
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case name = "login"
    }
}
