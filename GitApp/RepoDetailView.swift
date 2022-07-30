//
//  Detail.swift
//  git_api
//
//  Created by 須崎良祐 on 2022/07/30.
//

import SwiftUI

struct DetailView: View {
    let repo: GithubRepo
    
    var body: some View {
        VStack(){
                HStack(spacing: 20){
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
                        /*Image("GithubMark")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .mask(RoundedRectangle(cornerRadius: 20))*/
                        Text(repo.owner.name)
                        .font(.title)
                        Spacer()
                    }.padding()
                    
                    Divider()
                    .background(Color.black)
                    
                    HStack{
                        Text(repo.fullName)
                            .foregroundColor(.blue)
                            .font(.largeTitle)
                        Spacer()
                    }.padding()
                    
                    if let description = repo.description {
                        Text(description)
                            .padding(.top, 4)
                    }
                    Spacer()
                    Label(String(repo.stargazersCount),systemImage: "star")
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .symbolRenderingMode(.multicolor)
                Spacer()
            }
    }
}

/*struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(repo: .mock)
    }
}*/
