//
//  ContentView.swift
//  TheBestMovieEver_SwiftUI
//
//  Created by 안지영 on 2023/06/28.
//

import SwiftUI

struct ContentView: View {
    
    let movie = movies
    var heart = false
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(getGenres(), id: \.self) { genre in
                    // 이 함수가 리턴하는게 배열이라서 여기 들어가는거 가능
                    // id 값 안넣어주면 에러난리부르스라서 넣어줌 ㅜ 이거 공부해야함
                    
                    Section(header: Text(genre)) {
                        //섹션 이름에 장르들만 넣을 수 있음!!!! 드디어..ㅜ
                        
                        ForEach(getMovies(arrayGenre: genre)) { movie in
                            // movies 배열에서 장르 배열이랑 비교해서 장르별로 분류 가능!
                            NavigationLink {
                                ScrollView {
                                    DetailView(movie: movie)
                                }
                            } label: {
                                HStack {
                                    Image(movie.poster)
                                        .resizable()
                                        .frame(width: 80, height: 120)
                                        .aspectRatio(contentMode: .fit)
                                    VStack {
                                        Text(movie.name)
                                            .font(.system(size: 18))
                                            .fontWeight(.bold)
                                        
                                            Text(movie.openingDate)
                                                .foregroundColor(.secondary)
                                            

                                        
                                    }
                                    .frame(width: 200, alignment: .trailing)
                                    
                                }
                            }
                        }
                        
                        
                    }
                    
                }
                .listRowSeparator(.hidden)
            }
            .navigationTitle("🎬욤찌네 영화 맛집")
        }
        
        
    }
    
    
    
    /*
     movies 배열에서 장르만 빼서 일단 섹션에 담고 싶어,,
     근데 아무리,, forEach 돌리고 리스트 해도 안돼,,,,,,
     그렇다면..? 나는 지금 movies 배열에서 장르만 빼서 어떻게 하고 싶자나...
     고차함수..?
     GPT 도움으로!!! 결론!!
     ==> movies 배열에서 map 으로 장르만 꺼내와! 그러면 중복되는게 있으니까
     중복 없앨 수 있게 Set 으로 바꿨다가 다시 배열로 가져와!!!
     그리고 사실 sorted는 생각도 못했는데.. 배열이라서 순서대로 나올줄..
     근데 화면이 업데이트 될 때마다 섹션 순서가 바뀌어서 sorted 씀!!
     */
    func getGenres() -> [String] {
        let mapMovies = movies.map { movie in
            movie.genre
        }
        let movieSet = Set(mapMovies)
        let movieArray = Array(movieSet)
        return movieArray.sorted()
    }
    
    // 헉 함수 output 지정 안해주면 실행 안됨? 대박 몰랐음.
    
    
    
    /*
     째뜬!! getGenres()함수로 이제 장르만 빼놓은 배열 만들어버리릴륌~
     그러면 이제 이 장르별로 영화 구분해서 네비게이션링크에 넣어버리자~
     
     필터로 인풋 장르랑 같은지 확인해서 다시 배열로 리턴해주기
     이렇게 해서 forEach 로 genre 돌려서 확인해서 각 섹션으로 넣어주기
     */
    func getMovies(arrayGenre: String) -> [Movie] {
        movies.filter { movie in
            movie.genre == arrayGenre
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
