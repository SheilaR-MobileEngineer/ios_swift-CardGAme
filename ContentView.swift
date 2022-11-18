//
//  ContentView.swift
//  war-challenge
//
//  Created by Sheila Rodriguez on 11/16/22.
//

import SwiftUI

struct ContentView: View {
   
   @State private var playerCardNumber = 0
   @State private var cpuCardNumber = 0
   
   @State private var playerScore = 0
   @State private var cpuScore = 0

   @State private var showingAlert = false
  
    var body: some View {
       ZStack{
          Image("background").ignoresSafeArea()
          
          VStack{
             Spacer()
             Image("logo")
             Spacer()
             HStack{
                Spacer()
                Image("card\(String(playerCardNumber))")
                Spacer()
                Image("card\(String(cpuCardNumber))")
                Spacer()
             }
             Spacer()
             Button {
                calculateScore()
             } label: {
                Image("dealbutton")
             }
             Spacer()
             HStack{
                Spacer()
                VStack{
                   Text("Player")
                      .font(.headline)
                      .foregroundColor(Color.white)
                      .padding(.bottom, 3.0)
                   Text("\(playerScore)")
                      .font(.largeTitle)
                      .foregroundColor(Color.white)
                }
                Spacer()
                VStack{
                   Text("CPU")
                      .font(.headline)
                      .foregroundColor(Color.white)
                      .padding(.bottom, 3.0)
                   Text("\(cpuScore)")
                      .font(.largeTitle)
                      .foregroundColor(Color.white)
                }
                Spacer()
                
             }
             Button("End Game") {
                showingAlert = true
             }.alert("\(winner()) IS THE WINNER!", isPresented: $showingAlert) {
                Button("OK", role: .cancel){ resetValues()}
             }.foregroundColor(.blue)
                .padding(50)
             Spacer()
          }
       }
       
    }
   
   func calculateScore(){
      playerCardNumber = Int.random(in: 2..<15)
      cpuCardNumber = Int.random(in: 2..<15)
      if(cpuCardNumber < playerCardNumber){
         playerScore+=1
      }else if(playerCardNumber < cpuCardNumber){
         cpuScore+=1
      }
   }
   
   func resetValues(){
      playerScore = 0
      cpuScore = 0
   }
   
   func winner() -> String{
      if(playerScore > cpuScore){
         return "PLAYER"
      }else if(cpuScore > playerScore){
         return "CPU"
      }
      else{
         return "TIE. NO ONE"
      }
         
      
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
