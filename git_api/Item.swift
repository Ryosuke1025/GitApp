//
//  File.swift
//  git_api
//
//  Created by 須崎良祐 on 2022/07/30.
//

import SwiftUI
import Foundation

struct ItemView: View {
    var repo: GithubRepo

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: repo.owner.avatarUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
                    .tint(.cyan)
            }
            .frame(width: 40, height: 40)
            .mask(RoundedRectangle(cornerRadius: 20))
            VStack(alignment: .leading, spacing: 2) {
                Text(repo.name)
                    .font(.body)
                    .foregroundColor(.blue)
                Label(String(repo.stargazersCount),
                      systemImage: "star")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .symbolRenderingMode(.multicolor)
            }
        }
    }
}
