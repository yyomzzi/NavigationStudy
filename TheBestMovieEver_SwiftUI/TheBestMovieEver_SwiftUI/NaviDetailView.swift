//
//  NaviDetailView.swift
//  TheBestMovieEver_SwiftUI
//
//  Created by 안지영 on 2023/06/29.
//

import SwiftUI

struct NaviDetailView: View {
    
    let movie: Movie
    
    var body: some View {
        VStack(spacing: 0) {
            movieImage
            
        }
        .edgesIgnoringSafeArea(.top)
    }
}

private extension NaviDetailView {
    var movieImage: some View {
        Image(movie.poster)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaledToFill()
    }
    
    var orderView: some View {
        GeometryReader { _ in 
            VStack(alignment: .leading) {
                productDescripsion
            }
        }
    }
    
    var productDescripsion: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(movie.name)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: "heart")
                    .font(.title2)
                    .foregroundColor(Color.red)
                    .frame(width: 32, height: 32)
            }
            Text(movies.description)
                .foregroundColor(.gray)
        }
    }
}


//struct NaviDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NaviDetailView(movie: [Movie] = movies[0])
//    }
//}
