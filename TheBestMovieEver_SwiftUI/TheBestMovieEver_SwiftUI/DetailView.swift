//
//  DetailView.swift
//  TheBestMovieEver_SwiftUI
//
//  Created by 안지영 on 2023/06/28.
//

import SwiftUI

struct DetailView: View {
    
    let movie: Movie
    
    var body: some View {
        VStack {
            Text(movie.name)
                .font(.system(size: 30))
                .frame(width: 350, height: 60, alignment: .center)
                .multilineTextAlignment(.center)
                .overlay(
                    Capsule(style: .continuous)
                        .stroke(Color.black, style: StrokeStyle(lineWidth: 3))
                )
            
            Image(movie.poster)
                .resizable()
                .frame(width: 230, height: 300)
                .aspectRatio(contentMode: .fit)
                .padding(20)
            
            VStack {
                HStack {
                    Text("🎬 감독 :")
                    Text("\(movie.director)")
                        .fontWeight(.bold)
                }
                HStack {
                    Text("📆 개봉일자 :")
                    Text("\(movie.openingDate)")
                        .fontWeight(.bold)
                }
                HStack {
                    Text("🍿 장르 :")
                    Text("\(movie.genre)")
                        .fontWeight(.bold)
                }
            }
            .frame(width: 400, height: 80)
            .border(.black, width: 3)
            
            
            
                VStack {
                Text("📍영화 소개📍")
                    .font(.system(.title2))
                    .fontWeight(.bold)
                    .padding(5)
                Text("\(movie.detailedDiscription)")
                    .padding(7)
            }
            .frame(alignment: .leading)
            .padding(10)
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        DetailView()
//    }
//}
