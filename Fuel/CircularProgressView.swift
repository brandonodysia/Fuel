//
//  CircularProgressView.swift
//  Fuel
//
//  Created by Brandon Colverd on 2/5/2023.
//

import UIKit

@IBDesignable
class CircularProgressView: UIView {

    @IBInspectable var progress: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var lineWidth: CGFloat = 10
    @IBInspectable var progressColor: UIColor = UIColor.blue

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect.insetBy(dx: lineWidth / 2, dy: lineWidth / 2))
        UIColor.lightGray.setStroke()
        path.lineWidth = lineWidth
        path.stroke()
        
        let startAngle = -CGFloat.pi / 2
        let endAngle = startAngle + 2 * CGFloat.pi * progress
        
        let progressPath = UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: (bounds.width - lineWidth) / 2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        progressColor.setStroke()
        progressPath.lineWidth = lineWidth
        progressPath.lineCapStyle = .round
        progressPath.stroke()
    }
}
class ViewController: UIViewController {
    @IBOutlet weak var circularProgressView: CircularProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Update progress to 50%
        circularProgressView.progress = 0.5
    }
}
