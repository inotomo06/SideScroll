//
//  ContentView.swift
//  SideScroll
//
//  Created by cmStudent on 2022/09/06.
//

import SwiftUI

struct ContentView: View {
    // Tab を選ぶときの識別番号
    @State private var select = 0
    
    var body: some View {
        
        HStack {
            Image(systemName: "control")
                .font(.largeTitle)
                .padding()
                .rotationEffect(Angle.degrees(270))  // 回転角度の指定
                .onTapGesture {
                    if select != 0 {
                        select -= 1
                    }
                }
            
            VStack {
                TabView(selection: $select) {
                    Text("View 01").background(Color.red).tag(0)
                    Text("View 02").background(Color.blue).tag(1)
                    Text("View 03").background(Color.orange).tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .transition(.slide)
                .animation(.easeInOut)
                
                // PageTabViewにすると切り替え用のバーが消えるためボタンで代用
                HStack {
                    Button {
                        select = 0
                    } label: {
                        Text("赤のViewへ")
                    }
                    .padding()
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .background(Color.red)
                    .foregroundColor(.black)
                    
                    Button {
                        select = 1
                    } label: {
                        Text("青のViewへ")
                    }
                    .padding()
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .background(Color.blue)
                    .foregroundColor(.black)
                    
                    Button {
                        select = 2
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
            
            Image(systemName: "control")
                .font(.largeTitle)
                .padding()
                .rotationEffect(Angle.degrees(90)) // 回転角度の指定
                .onTapGesture {
                    if select != 2 {
                        select += 1
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
