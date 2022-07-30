//
//  ContentView.swift
//  git_api
//
//  Created by 須崎良祐 on 2022/07/30.
//

import SwiftUI

struct RepoListView: View {
    private var apiClient = APIClient()
    
    @State var searchText: String = ""
    @State var items: [GithubRepo] = []
    @State var isLoading: Bool = false
    @State var isShowAlert: Bool = false
    @State var alertMessage: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                List(items) { item in
                    NavigationLink(destination: DetailView(repo: item)) {
                        ItemView(repo: item)
                    }
                }
                if isLoading {
                    ProgressView()
                        .scaleEffect(1.5, anchor: .center)
                        .tint(.cyan)
                }
            }
        }
        .searchable(text: $searchText)
        .onSubmit(of: .search, {
            fetch()
        })
        .alert(isPresented: $isShowAlert) {
            Alert(
                title: Text("エラー"),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK")))
        }
    }

    private func fetch() {
        guard searchText.count > 0 else { return }
        Task {
            isLoading = true
            do {
                items = try await apiClient
                    .fetchGithubRepo(
                        url: APIUrl.githubRepo(query: searchText))
                    .items
            } catch let error {
                if let apiError = error as? APIError {
                    alertMessage = apiError.message
                    isShowAlert.toggle()
                }
            }
            isLoading = false
        }
    }
}

struct RepoListView_Previews: PreviewProvider {
    static var previews: some View {
        RepoListView()
    }
}
