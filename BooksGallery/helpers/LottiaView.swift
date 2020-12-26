//
//  LottiaView.swift
//  BooksGallery
//
//  Created by Retaj Al-Otaibi on 12/16/20.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    @State var name: String
    typealias UIViewType = UIView
    let animationView = AnimationView()
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        let animation = Animation.named(name)
        animationView.animation = animation
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        animationView.play()
    }
    

    
}
