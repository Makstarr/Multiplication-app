//
//  ContentView.swift
//  Multiplication
//
//  Created by Максим on 17.02.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI
var number = 0
struct BigButton: ViewModifier {
func body(content: Content) -> some View {
    content
    .font(.largeTitle)
    .foregroundColor(.white)
    .padding(.vertical, 5.0)
    .padding(.horizontal, 10.0)
    .frame(width: 300, height: 40)

    .background(LinearGradient(gradient: Gradient(colors: [.green, .green]), startPoint: .top, endPoint: .bottom))
    .overlay(RoundedRectangle(cornerRadius: 200).stroke(Color.black,lineWidth:3))
    .clipShape(RoundedRectangle(cornerRadius: 200))
     .shadow(color: .black, radius:1)
    
    }
}
struct ButtonLook: ViewModifier {
func body(content: Content) -> some View {
    content
    .font(.title)
    .foregroundColor(.black)
    .padding(.vertical, 15.0)
    .padding(.horizontal, 20.0)
    .frame(width: 90, height: 30)

    .background(LinearGradient(gradient: Gradient(colors: [.red, .yellow]), startPoint: .top, endPoint: .bottom))
    .overlay(RoundedRectangle(cornerRadius: 200).stroke(Color.black,lineWidth:3))
    .clipShape(RoundedRectangle(cornerRadius: 200))
     .shadow(color: .black, radius:1)
    
    }
}
struct Delete: ViewModifier {
func body(content: Content) -> some View {
    content
    .font(.title)
    .foregroundColor(.black)
    .padding(.vertical, 5.0)
    .padding(.horizontal, 20.0)
    .frame(width: 195, height: 30)
    
    .background(LinearGradient(gradient: Gradient(colors: [.red, .yellow]), startPoint: .top, endPoint: .bottom))
    .overlay(RoundedRectangle(cornerRadius: 200).stroke(Color.black,lineWidth:3))
    .clipShape(RoundedRectangle(cornerRadius: 200))
    .shadow(color: .black, radius:1)
    }
}
struct CalculatorButton: View {
    var y = 0
    var x = 0
    
    var body: some View {
        VStack{
            if (y==2){
                Text("\(x+3)")
                     .fontWeight(.bold)
                .modifier(ButtonLook())
        }
        else if (y==3){
                Text("\(x+6)")
                     .fontWeight(.bold)
                .modifier(ButtonLook())
            }
        else{
                Text("\(x)")
                     .fontWeight(.bold)
                .modifier(ButtonLook())
        }
       
        }
        
    }
}


struct ContentView: View {
    @State private var i = 1
    @State private var answer = ""
    @State private var points = 0
    @State private var oneNum = Int.random(in: 1...10)
    @State private var twoNum = Int.random(in: 1...10)
    func CorrectAswer() -> String {
        return String(self.oneNum*self.twoNum)
    
    }
    var body: some View {
        NavigationView{
            return ZStack{
                AngularGradient(gradient: Gradient(colors: [ .white,.white]), center: .topTrailing).edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    Text("Правильных ответов: \(points)")
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .font(.system(size: 26))
                    .shadow(color: .black, radius:0.2)
                    Text("\(oneNum)х\(twoNum)")
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .font(.system(size: 80))
                    .shadow(color: .black, radius:0.5)
                    Spacer()
                    Text("\(self.answer)")
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                    .font(.system(size: 80))
                        .shadow(color: .black, radius:0.5)
                    Spacer()
                    VStack{
                     
                     ForEach(1..<4){y in
                     HStack{
                         ForEach(1..<4){x in
                             
                             Button(action:{
                                self.Calculate(y:y,x:x)
                             })
                             {
                                 CalculatorButton(y:y,x:x)
                             }
                             .padding(3)
                             
                         }
                         
                         
                         }
                    
                     }
                    
                     }
                    HStack{
                    Button(action:{
                       self.Calculate(y:0,x:0)
                    })
                    {
                        CalculatorButton(y:0,x:0)
                    }.padding(2)
                    Button(action:{
                        self.answer=String(self.answer.dropLast())
                    })
                    {
                        Text("Стереть")
                        .fontWeight(.bold)
                        .modifier(Delete())
                    }.padding(2)
                    
                    }
                    HStack{
                        Button(action:{
                            self.CheckAnswer(self.answer,self.CorrectAswer())
                            self.answer=""
                            self.oneNum = Int.random(in: 1...10)
                            self.twoNum = Int.random(in: 1...10)

                            
                        })
                        {
                            Text("Принять")
                            .fontWeight(.bold)
                            .modifier(BigButton())
                        }.padding(.vertical, 10.0)
                    }
                
                }
            }
        }
    }
    func Calculate(y:Int,x:Int){
        if (y==2){
            number=x+3
            self.answer+="\(number)"
        }
        else if (y==3){
            number=x+6
            self.answer+="\(number)"
            }
        else{
            number=x
            self.answer+="\(number)"
        }
    }
    func CheckAnswer(_ answer: String, _ correct: String){
        if (answer==correct){
            points+=1
        } else { points+=0 }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
}
