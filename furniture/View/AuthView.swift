//
//  AuthView.swift
//  furniture
//
//  Created by Have Dope on 09.04.2023.
//

import SwiftUI

struct AuthView: View {
    
    @State var login = ""
    @State var password = ""
    @State var securePass = ""
    
    @State var isShowAlert = false
    @State var AlertMessage = ""
    
    @State var isAuth = true
    @State var isPresentNextView = false
    
    
    
    @State var nativeAlert = false
    @State var HUD = false


    var body: some View {
        ZStack{
            Image("Bg")
            
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .blur(radius: 2)
            
            VStack(spacing: 70){
                Text(isAuth ? "Авторизация" : "Регистрация")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                    .padding()
                    .background(Color(.white.withAlphaComponent(0.7)))
                    .cornerRadius(43)
                
                
                
                VStack(spacing: 30){
                    if !HUD {
                        VStack(spacing: 10){
                            TextField("Ведите логин", text: $login)
                                .frame(width: 270, height: 30)
                                .padding()
                                .background(Color(.white.withAlphaComponent(0.8)))
                                .cornerRadius(40)
                            
                            
                            SecureField("Ведите пароль", text: $password)
                                .frame(width: 270, height: 30)
                                .padding()
                                .background(Color(.white.withAlphaComponent(0.8)))
                                .cornerRadius(40)
                            
                            if isAuth == false{
                                
                                SecureField("Повтортие пароль", text: $securePass)
                                    .frame(width: 270, height: 30)
                                    .padding()
                                    .background(Color(.white.withAlphaComponent(0.8)))
                                    .cornerRadius(40)
                                
                            }
                        }
                    }
                    VStack{
                        
                        ZStack{
                            VStack(spacing: 25) {
                                
                                    Button(action: {
                                        
                                    withAnimation{
                                        HUD.toggle()
                                    }
                                            if isAuth{
                                                AuthService.shared.SignIn(email: self.login, password: self.password) { result in
                                                    switch result {
                                                    case .success(_):
                                                        isPresentNextView.toggle()
                                                        self.HUD.toggle()

                                                    case .failure(let error):
                                                        print(error.localizedDescription)
                                                        AlertMessage = "Что-то не так с логином или паролем. Попробуйте еще раз ^.^"
                                                        isShowAlert.toggle()
                                                        self.HUD.toggle()

                                                    }
                                                }
                                            }else{
                                                guard password == securePass else{
                                                    AlertMessage = "Пароли не совпадают"
                                                    isShowAlert.toggle()
                                                    self.HUD.toggle()

                                                    return
                                                }
                                                AuthService.shared.singUp(email: self.login, password: self.password) { result in
                                                    switch result{
                                                    case .success(let user):
                                                        AlertMessage = "Вы успешно зарегистрировались. Ваша почта \(user.email!)"
                                                        self.isShowAlert.toggle()
                                                        self.HUD.toggle()
                                                        self.login = ""
                                                        self.password = ""
                                                        self.securePass = ""
                                                        self.isAuth.toggle()
                                                        
                                                    case .failure(let error):
                                                        print(error.localizedDescription)
                                                    }
                                                }
                                                
                                                
                                            }
                                        
                                }) {
                                    
                                        Text( isAuth ? "Войти": "Создать аккаунт")
                                            .font(.system(.title2, design: .rounded))
                                            .foregroundColor(.white)
                                            .frame(width: 210, height: 30)
                                            .padding()
                                            .background(HUD ? Color.clear : Color(.black.withAlphaComponent(0.8)))
                                            .cornerRadius(40)
                                            
                                    }.fullScreenCover(isPresented: $isPresentNextView) {
                                        let mainTabBarViewModel = MainTabBarViewModel(user: AuthService.shared.currentUser!)
                                        TabBarView(viewmodel: mainTabBarViewModel)
                                    }
                            }
                            
                            if HUD{
                                
                                HUDprogressView(placeholder: "Please waite", show: $HUD)
                            }
                        }
                        .edgesIgnoringSafeArea(.all)
                        
                        Button {
                            isAuth.toggle()
                        } label: {
                            Text(isAuth ? "Зарегистрироваться" : "У меня уже есть аккаунт")
                                .font(.system(.subheadline, design: .rounded))
                                .foregroundColor(isAuth ? .gray : .mint)
                                .fontWeight(.bold)
                                .padding()
                                .cornerRadius(43)
                        }.edgesIgnoringSafeArea(.all)
                    }
                    
                }
                .padding(16)
                .background(Color(.white.withAlphaComponent(0.3)))
                .cornerRadius(20)
                
                
                
            }
            
            
            
        }.animation(.easeIn(duration: 0.2), value: isAuth)
            .animation(.easeIn(duration: 0.2), value: HUD)
            .alert(AlertMessage, isPresented: $isShowAlert) {
                Button {  } label: {
                    Text("Ок")
                }
                
            }
        
        
    }
    
    

    
    
    struct HUDprogressView : View{
        var placeholder : String
        @Binding var show: Bool
        @State var animate = false
        
        
        var body: some View {
            
            VStack(spacing: 20){
                Circle()
                // For darkmode adaption
                    .stroke(AngularGradient(gradient: .init(colors: [Color.primary,Color.primary.opacity(0)]), center: .center))
                    .frame(width: 80, height: 80)
                //animating ...
                    .rotationEffect(.init(degrees: animate ? 360 : 0))
                
                Text(placeholder)
                    .fontWeight(.bold )
                   
            }.ignoresSafeArea()
            .padding(.vertical, 25)
            .padding(.horizontal, 35 )
            .background(BlurView())
            .cornerRadius(20)
            .frame(maxWidth:  .infinity , maxHeight: .infinity)
            .background(.primary.opacity(0.35))
                .onTapGesture {
                    withAnimation {
                        // closing view
                       // show.toggle()
                    }
                    
                }
                .onAppear {
                    //starting animation
                    withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)){
                        
                        animate.toggle()
                    }
                }
        }
    }
    struct  BlurView: UIViewRepresentable {
        func makeUIView(context: Context) -> UIVisualEffectView {
            let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
            
            return view
        }
        func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
            
        }
    }
    
}



struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}



 
