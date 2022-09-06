//
//  ContentView.swift
//  SideScroll
//
//  Created by cmStudent on 2022/09/06.
//

import SwiftUI

struct ContentView: View {
    // Tab を選ぶときの識別番号
    @State private var number = 0
    
    var body: some View {
        
        HStack {
            Image(systemName: "chevron.left")
                .font(.largeTitle)
                .padding()
//                .rotationEffect(Angle.degrees(270))  // 回転角度の指定
                .onTapGesture {
                    if number != 0 {
                        number -= 1
                    }
                }
            
            VStack {
                TabView(selection: $number) {
                    Text("View 01").background(Color.red)
                        .tag(0)
                    Text("View 02").background(Color.blue)
                        .tag(1)
                    Text("View 03").background(Color.orange)
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .transition(.slide)
                .animation(.easeInOut)
                
                // PageTabViewにすると切り替え用のバーが消えるためボタンを使う
                HStack {
                    Button {
                        number = 0
                    } label: {
                        Text("赤のViewへ")
                    }
                    .padding()
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .background(Color.red)
                    .foregroundColor(.black)
                    
                    Button {
                        number = 1
                    } label: {
                        Text("青のViewへ")
                    }
                    .padding()
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .background(Color.blue)
                    .foregroundColor(.black)
                    
                    Button {
                        number = 2
                    } label: {
                        Text("黄のViewへ")
                    }
                    .padding()
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .background(Color.orange)
                    .foregroundColor(.black)
                }
            }
            
            Image(systemName: "chevron.right")
                .font(.largeTitle)
                .padding()
//                .rotationEffect(Angle.degrees(90)) // 回転角度の指定
                .onTapGesture {
                    if number != 2 {
                        number += 1
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
