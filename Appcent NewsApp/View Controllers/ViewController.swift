//
//  ViewController.swift
//  Appcent NewsApp
//
//  Created by Dilda Ezgi Metincan on 10.08.2021.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    let animation = Animation.named("splashapp")
    let animationView = AnimationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView.frame = CGRect(x: 0, y: 268, width: 400 , height: 400)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
            self.performSegue(withIdentifier: "dashboard", sender: nil)
    }


}

}
