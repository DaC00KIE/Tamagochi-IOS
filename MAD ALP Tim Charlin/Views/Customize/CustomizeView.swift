//
//  CustomizeView.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 04/06/24.
//

import SwiftUI

struct CustomizeView: View {
    @StateObject var tamagochi: Tamagochi
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        if horizontalSizeClass == .compact {
            iPhoneCustomizationView(tamagochi: tamagochi)
        } else {
            iPadCustomizationView(tamagochi: tamagochi)
        }
    }
}

struct iPhoneCustomizationView: View {
    @ObservedObject var tamagochi: Tamagochi
    
    let frameSize: CGFloat = 256 * 3
    
    var body: some View {
        VStack {
            ZStack {
                
                Image("pillar-hd")
                    .resizable()
                    .frame(width: frameSize, height: frameSize)
//                .padding(.top, -280)
                
                TamagochiDisplay(tamagochi: tamagochi, frame: 440)
                    .frame(width: UIScreen.main.bounds.width, height: 440)
                    .padding(.top, -60)
                    .cornerRadius(20) // Add corner radius to the frame
//                    .padding(.vertical, 40)
            }
            .padding(.top, 75)
            .frame(height: UIScreen.main.bounds.height / 10 * 6)
            .background(Color.green)
            .padding(.bottom, -25)
//            .padding(.top, 70)
            
            VStack {
                
                VStack(spacing: 20) {
                    
                    ColorPicker("Pick a Colour: ", selection: $tamagochi.skinColor)
//                        .padding(.horizontal, 200)  Add horizontal padding for the color picker
                    
                    ScrollableSelectionView(items: tamagochi.purchasedFaces, selectedItem: $tamagochi.selectedFace)
                    ScrollableSelectionView(items: tamagochi.purchasedHats, selectedItem: $tamagochi.selectedHat)
                }
//                .padding(.top, 60)
                .padding(.horizontal, 20) // Add horizontal padding for the inner VStack
                
                Spacer()
            }
            .padding(.top, 60)
            .padding(.bottom, 60)
            .background(Color(red: 0.8, green: 0.8, blue: 0.8))
            .cornerRadius(20)
        }
        .frame(width: .infinity, height: .infinity)
    }
}

struct iPadCustomizationView: View {
    @ObservedObject var tamagochi: Tamagochi
    
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        let upperHalf = screenHeight / 10 * 6
        
        VStack {
            ZStack {
                Image("pillar-hd")
                    .resizable()
                    .frame(width: upperHalf * 1.3, height: upperHalf * 1.3)
                TamagochiDisplay(tamagochi: tamagochi, frame: 700)
                    .frame(width: 550, height: 550)
                    .padding(.top, -107)
            }
            .frame(height: upperHalf)
            .padding(.bottom, -75)
            
            HStack(spacing: 20) {
                VStack {
                    SelectableOptionView(title: "Select a Face:", options: tamagochi.purchasedFaces, selectedOption: $tamagochi.selectedFace)
                    
                    HStack {
                        Spacer()
                        Image("\(tamagochi.selectedFace)_icon")
                            .resizable()
                        .frame(width: 250, height: 250)
                        Spacer()
                    }
                }
                VStack {
                    SelectableOptionView(title: "Select a Hat:", options: tamagochi.purchasedHats, selectedOption: $tamagochi.selectedHat)
                    
                    HStack {
                        Spacer()
                        Image("\(tamagochi.selectedHat)_icon")
                            .resizable()
                        .frame(width: 250, height: 250)
                        Spacer()
                    }
                }
            }
            .padding(.horizontal, 20) // Add horizontal padding for the inner VStack
            
            Spacer()
        }
        .padding(20)
        .background(Color.blue.opacity(0.4)) // Add background color for iPad
//        .cornerRadius(100) // Add corner radius for iPad
    }
}

struct SelectableOptionView: View {
    let title: String
    let options: [String]
    @Binding var selectedOption: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            
            Picker("", selection: $selectedOption) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                }
            }
            .pickerStyle(.wheel)
        }
    }
}

struct CustomizeView_Previews: PreviewProvider {
    static var previews: some View {
        let tamagochi = Tamagochi()
        return Group {
        
            CustomizeView(tamagochi: tamagochi)
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
                .previewDisplayName("iPad Pro (12.9-inch) (5th generation)")
        }
    }
}
