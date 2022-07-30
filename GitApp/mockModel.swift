//
//  mockdata.swift
//  git_api
//
//  Created by 須崎良祐 on 2022/07/30.
//

import Foundation

extension GithubRepo{
    static let mock = GithubRepo(
        id: 1,
        fullName: "Repo fullname",
        name: "Repo name",
        description: "Repo description",
        stargazersCount:100,
        htmlUrl:"Repo Test",
        owner: .mock
    )
}

extension GithubRepoOwner{
    static let mock = GithubRepoOwner(
        avatarUrl: "Repo Test",
        name: "User"
    )
}
