//
//  ViewController.swift
//  Assignement_8
//
//  Created by Ievgen Petrovskiy on 01.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var counterLabel: UILabel!
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterLabel.text = "Catch a box!"
        
        boxView.frame.size.height = 100
        boxView.frame.size.width = 100
        view.backgroundColor = .systemGray
        
        let margins = view.layoutMarginsGuide
         NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            view.topAnchor.constraint(equalTo: margins.topAnchor),
            view.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
         ])
    }
   
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        print(sender.state.rawValue)
        boxView.backgroundColor = .random
        getCounter()
        print(counter)
        boxView.center = getPosition()
    }
    
    func getPosition() -> CGPoint {
        let viewWidth = Int(self.view.frame.size.width)
        let viewHeight = Int(self.view.frame.size.height)
        
        let boxHeight = Int((boxView.frame.size.height) / 2)
        let boxWidth = Int((boxView.frame.size.width) / 2)
        
        let position = CGPoint(x: Int.random(in: boxWidth...(viewWidth - boxWidth)), y: Int.random(in: boxHeight...(viewHeight - boxHeight)))
        print(position)
        
        return position
    }
    
    func getCounter() {
        counter += 1
        counterLabel.text = "Nope, sorry! \(counter) taps made"
    }
}



extension CGFloat {
    static var random: CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random, green: .random, blue: .random, alpha: 1.0)
    }
}
