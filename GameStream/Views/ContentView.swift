//
//  ContentView.swift
//  GameStream
//
//  Created by Arnaldo Pedrero Varela on 21/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("marine")
                
                VStack{
                    Logo()
                    InitAndRegisterView()
                }
            }
        }
        .navigationBarHidden(true)
    }
}


struct InitAndRegisterView:View {
    @State var initSessionType = true
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button("INICIA SESSION"){
                    initSessionType=true
                    print("inicio")
                }.foregroundColor(initSessionType ? .white : .gray)
                Spacer()
                Button("REGISTRATE"){
                    initSessionType=false
                    print("registro")
                }.foregroundColor(initSessionType ? .gray : .white)
                Spacer()
            }
            
            Spacer(minLength: 42)
            if(initSessionType==true){
                InitSessionView()
            }
            else{
                RegistryView()
            }
        }
    }
}

struct InitSessionView:View{
    @State var mail=""
    @State var password=""
    @State var isTabActive:Bool = false
    
    var body: some View{
       
            ScrollView{
                VStack(alignment: .leading){
                    MailInputTextView(text: $mail)
                    
                    PassInputText(text: $password)
                    Text("¿Olvidaste tu contraseña?")
                        .font(.footnote)
                        .frame(width: 300, alignment: .trailing)
                        .foregroundColor(Color("dark-cian"))
                        .padding(.bottom)
                    
                    LoginButton(label: "INICIAR SESIÓN", action: initSession).padding(.bottom)
                    
                    SocialMedia(headerText: "Inicia sesión con redes sociales")
                    
                }
                .padding(.horizontal,42.0)
            }
            
            .navigationDestination(isPresented: $isTabActive) {
                TabBar()
            }
        
        
    }
    
    func initSession(){
        print("iniciar session")
        isTabActive = true
    }
}

struct RegistryView:View{
    @State var mail=""
    @State var password=""
    @State var confirPass=""
    
    var body: some View{
        ScrollView{
            VStack(alignment: .center){
                Text("Elije una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Puedes cambiar o elegirla más adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                Button(action: takePhoto, label: {
                    ZStack{
                        Image("perfil-ejemplo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80,height: 80)
                        
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                    }
                })
            }.padding(.bottom)
            
            VStack(alignment: .leading){
                MailInputTextView(text: $mail)
                
                PassInputText(text: $password, label: "Contraseña*")
                PassInputText(text: $confirPass, label: "Confirmar contraseña*", placeholder: "Confirma tu contraseña")
                
                LoginButton(label: "REGÍSTRATE", action: registry).padding(.bottom)
                
                SocialMedia(headerText: "Regístrate con redes sociales")
                
            }.padding(.horizontal,42.0)
        }
    }
}

func takePhoto(){
    print("toma foto")
}

func registry(){
    print("registarse")
}

#Preview {
    ContentView()
}

struct TestView: View {
    var body: some View {
        HStack {
            Image(systemName: "lock")
                .frame(width: 25.0, height: 25.0)
            
            Spacer()
            
            Text("Helloooooooooo")
        }
    }
}
