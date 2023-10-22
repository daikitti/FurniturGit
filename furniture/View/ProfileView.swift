//
//  ProfileView.swift
//  furniture
//
//  Created by Have Dope on 12.04.2023.
//

import SwiftUI



struct ProfileView: View {
    
    @State var isPopUP = false
    @State var isPresentAuthView = false
    @State var isRed = false
    
    @State var Name = "ghbdt"
    @State var phone = " df"
    
    @State var gorod = " df"
    @State var street = " df"
    @State var dom = " fd"
    @State var kvartira = " df"

    @StateObject var viewmodel: ProfileViewModel
    
    
    var body: some View {
        VStack{
            HStack(alignment: .center){
                Spacer()
                Text(!isRed ? "Профиль" : "").font(.system(size: 35, weight: .light, design: .rounded)).foregroundColor(.gray)
               
                
                
                    Button {
                        
                        isRed.toggle()
                            
                    } label: {
                        Text(isRed ? "Сохранить":" Ред.")
                    }.padding(.leading, screen.width/5)
                    .padding(.trailing)
                    .onSubmit {

                    }
                

            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: screen.width/1.2, height: isRed ?  screen.height/4 : screen.height/8 )
                    .background(.clear)
                    .foregroundColor(.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray)
                    }
                    .shadow(radius: 10)
                if !isRed{
                VStack{
                    
                
                    Text(String(viewmodel.profile.name))
                            .padding(10)
                            .font(.system(size: 30, weight: .bold , design: .rounded))
                        
                        
                        
                    Text(String(viewmodel.profile.phone))
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .bold , design: .rounded))
                        
                    }.foregroundColor(.black)
                }else{
                    VStack(alignment: .leading){
                        Text("Имя")
                        TextField("Ваше имя", text: $viewmodel.profile.name)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 230)
                        Text("Номер телефона")

                        TextField("Ваш номер телефона", text: $viewmodel.profile.phone)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 230)
                        
                    }
                    
                }
                
                
                
                }
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: screen.width/1.2,
                           height: isRed ? screen.height/5 : screen.height/8)
                    .background(.clear)
                    .foregroundColor(.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.orange)
                        
                    }
                    .padding()
                
                VStack{
                    Text("Адрес доставки")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .bold , design: .rounded))
                    if isRed{
                    HStack(alignment: .center){
                        
                        TextField("Ведите адрес", text: $viewmodel.profile.adres)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 230)
                        
                            
                        }.foregroundColor(.black)
                        
                    }else{
                        
                        Text("\(viewmodel.profile.adres)")
                       
                    }
                }
            
                
            }
            
            Button {
                isPopUP.toggle()
            } label: {
                Text("Popup")
            }

            
            Spacer()
            Text(viewmodel.profile.email)
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .bold , design: .rounded))
            Button {
                print("Выход из аккаунта")
                AuthService.shared.SingOut()
                isPresentAuthView.toggle()
                
            } label: {
                VStack{
                    
                    Text("Выход").foregroundColor(.red)
                }
            }

        }.onSubmit {
            viewmodel.setProfile()
            
        }
        .fullScreenCover(isPresented: $isPresentAuthView) {
            AuthView()
        }
        .sheet(isPresented: $isPopUP) {
            popUp()
                           .presentationDetents([.medium, .large])
                           .presentationCornerRadius(21)
                           .background(Color(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1)))
                                   
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewmodel: ProfileViewModel(profile: MVUser(id: "1", email: "1", name: "1", phone: "1", adres: "1")))
    }
}

private func popUp() -> some View {
    VStack {
        Text("Похоже в вашем профиле пусто ")
    }
    
   
}



