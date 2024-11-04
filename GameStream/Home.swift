//
//  Home.swift
//  GameStream
//
//  Created by Arnaldo Pedrero Varela on 24/10/24.
//

import SwiftUI
import AVKit

struct Home: View {
    @State var searchText = ""
    
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View {
        ZStack{
            Color("marine")
            
            ScrollView{
                VStack{
                    Logo()
                    
                    HStack{
                        Button(action: search, label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(searchText.isEmpty ? Color(red: 174/255, green: 177/255, blue: 185/255,opacity: 1.0) : Color("dark-cian"))
                        })
                        
                        ZStack(alignment: .leading){
                            if(searchText.isEmpty){
                                Text("Buscar un video")
                                    .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                            }
                            
                            TextField("", text: $searchText).foregroundColor(.white)
                        }
                    }
                    .padding([.top,.leading,.bottom] , 11)
                    .background(Color("blue-gray"))
                    .clipShape(Capsule())
                    
                    FavoriteGameView (urlVideos: urlVideos, url:$url)
                    
                    CategoriesView()
                    
                    RecommendedView(urlVideos: urlVideos, url:$url)
                    
                    WhatYouLikeView(urlVideos: urlVideos, url:$url)
                    
                }.padding(.horizontal , 18)
                
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

func search(){
    
}

struct Title:View {
    var text: String = ""
    var body: some View {
        
        Text(text)
            .font(.title3)
            .foregroundColor(.white)
            .bold()
            .frame(minWidth: 0, maxHeight: .infinity,alignment: .leading)
            .padding(.top)
    }
}

struct FavoriteGameView: View{
    @State var isPlayerActive = false
    @State var urlVideos:[String]
    @Binding var url: String
    
    var body: some View{
        VStack(alignment: .leading){
            Title(text:"LOS MÁS POPULARES")
            
            VStack(spacing: 0){
                Button(action:{
                    url=urlVideos[0]
                    isPlayerActive = true
                }, label: {
                    ZStack{
                        Image("the-witcher")
                            .resizable()
                            .scaledToFill()
                        
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 42, height: 42)
                        
                        NavigationLink(
                            destination: VideoPlayer(player:
                                                        AVPlayer(url:  URL(string: url)!))
                            .frame(width: 400, height: 300)
                            ,
                            isActive: $isPlayerActive,
                            label: {
                                
                                
                                EmptyView()
                            })
                        
                    }
                    .padding(0.0)
                })
                
                Text("The witcher 3: Wild Hunt")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                .background(Color("blue-gray"))}
            
        }
        .frame(minWidth: 0, maxHeight: .infinity,alignment: .center)
    }
}

struct CategoriesView: View {
    var body: some View {
        VStack(alignment: .leading){
            Title(text: "CATEGORÍAS SUGERIDAS PARA TI")
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Category(image: "fps", text: "FPS")
                    Category(image: "rpg", text: "RPG")
                    Category(image: "open-world", text: "OPEN WORLD")
                }
            }
        }
    }
}

struct Category: View {
    var image: String = ""
    var text: String = ""
    
    var body: some View {
        Button(action: {}, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("blue-gray"))
                    .frame(width: 160, height: 90)
                VStack{
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 42)
                    Text(text)
                        .fontWeight(.bold)
                        .foregroundColor(Color("cian"))
                }
            }
        })
    }
}

struct RecommendedView : View {
    @State var isPlayerActive = false
    @State var urlVideos:[String]
    @Binding var url: String
    
    var body : some View{
        VStack(alignment: .leading){
            Title(text: "RECOMENDADO PARA TI")
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    VideoGame(image: "abzu", action:{
                        url = urlVideos[1]
                        print("URL: \(url)")
                        isPlayerActive = true})
                    
                    VideoGame(image: "crash-bandicoot", action:{
                        url = urlVideos[2]
                        print("URL: \(url)")
                        isPlayerActive = true})
                    
                    VideoGame(image: "death-stranding", action:{
                        url = urlVideos[3]
                        print("URL: \(url)")
                        isPlayerActive = true})
                    
                    
                }
            }
        }
    }
}

struct WhatYouLikeView : View {
    @State var isPlayerActive = false
    @State var urlVideos:[String]
    @Binding var url: String
    
    var body : some View{
        VStack(alignment: .leading){
            Title(text: "VIDEOS QUE PODRÍAN GUSTARTE")
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    VideoGame(image: "cuphead", action:{
                        url = urlVideos[4]
                        print("URL: \(url)")
                        isPlayerActive = true})
                    
                    VideoGame(image: "hades", action:{
                        url = urlVideos[5]
                        print("URL: \(url)")
                        isPlayerActive = true})
                    
                    VideoGame(image: "grand-theft-auto-v", action:{
                        url = urlVideos[6]
                        print("URL: \(url)")
                        isPlayerActive = true})
                }
            }
        }
    }
}

struct VideoGame: View {
    @State var image: String = ""
    @State var action: () -> Void
    
    var body: some View{
        Button(action:action,label: {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 240, height: 135)
        })
    }
}

#Preview {
    Home()
}
