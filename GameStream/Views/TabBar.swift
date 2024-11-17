//
//  TabBar.swift
//  GameStream
//
//  Created by Arnaldo Pedrero Varela on 24/10/24.
//

import SwiftUI

struct TabBar: View {
    @State var selectedTab:Int = 2
    
    var body: some View {
        TabView(selection: $selectedTab){
            ProfileView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)
            
            GamesView()
                .tabItem{
                    Image(systemName: "gamecontroller")
                    Text("juegos")
                }.tag(1)
            
            Home()
                .tabItem{
                    Image(systemName: "house")
                    Text("Inicio")
                }.tag(2)
            
            FavoritesView()
                .tabItem{
                    Image(systemName: "heart")
                    Text("Favoritos")
                }.tag(3)
        }
        .accentColor(.white)
    }
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor(Color("tab-bar-color").opacity(0.8))
        
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        
        UITabBar.appearance().isTranslucent = true
    }
}

#Preview {
    TabBar()
}
