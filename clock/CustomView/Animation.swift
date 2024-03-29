//
//  Animation.swift
//  clock
//
//  Created by Konstantin Kozhevnikov on 09.02.2022.

import Foundation
import UIKit

class AnalogClockView: UIView {

    struct Clock {
        private init() {}
        struct HandAngle {
            private init() {}
            static let hour = (CGFloat(Date().hour * (360/12)) + (CGFloat(Date().minute) * (1.0/60) * (360/12)))
            static let minute = CGFloat(Date().minute * (360/60))
            static let second = CGFloat(Date().second * (360/60))
        }
        struct HandWidth {
            private init() {}
            static let hour: CGFloat = 5
            static let minute: CGFloat = 3
            static let second: CGFloat = 2
        }
        struct AnimationKey {
            private init() {}
            static let path = "transform.rotation.z"
            static let second = "SecondAnimationKey"
            static let minute = "MinuteAnimationKey"
            static let hour = "HourAnimationKey"
        }
    }
    
    typealias Angle = Clock.HandAngle
    typealias HandWidth = Clock.HandWidth
    typealias AnimationKey = Clock.AnimationKey
    
    var hourLayer:CALayer!
    var dotLayer: CALayer!
    var minuteLayer:CALayer!
    var secondLayer:CALayer!
    var imageLayer:CALayer!
    
    var clockLayer: CALayer {
        let layer = CALayer()
        layer.frame = self.frame
        return layer
    }
    var layerXPosition: CGFloat {
        return self.frame.width/2
    }
    var layerYPosition: CGFloat {
        return self.frame.height/2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpAnalogClock()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpAnalogClock()
    }
}

extension AnalogClockView {
    
    func setUpAnalogClock() {
        self.layer.addSublayer(clockLayer)
        setUpLayer()
        setUpAniation()
    }
    func setUpLayer() {
        addImageLayer()
        addHourLayer()
        addMinuteLayer()
        addSecondsLayer()
        addDot()
    }
    func setUpAniation() {
        secondLayerAnimation()
        minuteLayerAnimation()
        hourLayerAnimation()
    }
}

extension AnalogClockView {
    func setUpLayer(backgroundColor: UIColor, anchorPointX: CGFloat, anchorPointY: CGFloat, xPosition: CGFloat, yPosition: CGFloat, frame: CGRect, contents: Any?) -> CALayer {
        let layer = CALayer()
        layer.backgroundColor = backgroundColor.cgColor
        layer.anchorPoint = CGPoint(x: anchorPointX, y: anchorPointY)
        layer.position = CGPoint(x: xPosition, y: yPosition)
        layer.bounds = frame
        layer.contents = contents
        layer.cornerRadius = 3
        return layer
        
    }
    func setUpLayerAnimation(keyPath: String = AnimationKey.path, repeatCount: Float = .infinity, duration: CFTimeInterval, isRemovedOnCompletion: Bool, timingFunction: CAMediaTimingFunction?, fromValue: Any?, byValue: Any?) -> CABasicAnimation {
        let animation = CABasicAnimation()
        animation.keyPath = keyPath
        animation.repeatCount = repeatCount
        animation.duration = duration
        animation.isRemovedOnCompletion = isRemovedOnCompletion
        animation.timingFunction = timingFunction
        animation.fromValue = fromValue
        animation.byValue = byValue
        return animation
    }
}

extension AnalogClockView {
    func addImageLayer() {
        let width = ((self.frame.width/2)-20)*2
        imageLayer = setUpLayer(backgroundColor: .clear, anchorPointX: 0.5, anchorPointY: 0.5, xPosition: layerXPosition, yPosition: layerYPosition, frame: CGRect(x: 0, y: 0, width: width, height: width), contents: UIImage(named: "Big")?.cgImage)
        layer.addSublayer(imageLayer)
    }
    
    func addDot() {
        dotLayer = setUpLayer(backgroundColor: .clear, anchorPointX: 0.5, anchorPointY: 0.5, xPosition: layerXPosition, yPosition: layerYPosition, frame: CGRect(x: 0, y: 0, width: 39, height: 39), contents: UIImage(named: "dot")?.cgImage)
        layer.addSublayer(dotLayer)
    }
    
    func addHourLayer() {
        hourLayer = setUpLayer(backgroundColor: UIColor(red: 0.37, green: 0.52, blue: 0.67, alpha: 0.8), anchorPointX: 0.5, anchorPointY: 0, xPosition: layerXPosition, yPosition: layerYPosition, frame: CGRect(x: 0, y: 0, width: HandWidth.hour, height: (self.frame.width/2)-(self.frame.width * 0.7)), contents: nil)
        hourLayer.transform = CATransform3DMakeRotation(Angle.hour/CGFloat(180*Double.pi), 0, 0, 1)
        layer.addSublayer(hourLayer)
        
    }
    func addMinuteLayer() {
        minuteLayer = setUpLayer(backgroundColor: UIColor(red: 0.37, green: 0.52, blue: 0.67, alpha: 0.8), anchorPointX: 0.5, anchorPointY: 0, xPosition: layerXPosition, yPosition: layerYPosition, frame: CGRect(x: 0, y: 0, width: HandWidth.minute * 1.2, height: (self.frame.width/2)-(self.frame.width * 0.8)), contents: nil)
        minuteLayer.transform = CATransform3DMakeRotation(Angle.minute/CGFloat(180*Double.pi), 0, 0, 1)
        layer.addSublayer(minuteLayer)
    }
    func addSecondsLayer() {
        secondLayer = setUpLayer(backgroundColor: UIColor(red: 0.97, green: 0.27, blue: 0.36, alpha: 1), anchorPointX: 0.5, anchorPointY: 0, xPosition: layerXPosition, yPosition: layerYPosition, frame: CGRect(x: 0, y: 0, width: HandWidth.second * 1.9, height: (self.frame.width/2)-(self.frame.width * 0.18)), contents: nil)
        secondLayer.transform = CATransform3DMakeRotation(Angle.second/CGFloat(180*Double.pi), 0, 0, 1)
        layer.addSublayer(secondLayer)
    }
}

extension AnalogClockView {
    func secondLayerAnimation() {
        let secondAnimation = setUpLayerAnimation(duration: 60, isRemovedOnCompletion: false, timingFunction: CAMediaTimingFunction(name: .linear), fromValue: (Angle.second+180) * CGFloat(Double.pi / 180), byValue: (2 * Double.pi))
        secondLayer.add(secondAnimation, forKey: AnimationKey.second)
    }
    func minuteLayerAnimation() {
        let minuteAnimation = setUpLayerAnimation(duration: 60*60, isRemovedOnCompletion: false, timingFunction: CAMediaTimingFunction(name: .linear), fromValue: ((Angle.minute+180) * .pi / 180), byValue: 2 * Double.pi)
        minuteLayer.add(minuteAnimation, forKey: AnimationKey.minute)
    }
    func hourLayerAnimation() {
        let hourAnimation = setUpLayerAnimation(duration: 60*60*12, isRemovedOnCompletion: false, timingFunction: CAMediaTimingFunction(name: .linear), fromValue: ((Angle.hour+180)  * .pi / 180), byValue: 2 * Double.pi)
        hourLayer.add(hourAnimation, forKey: AnimationKey.hour)
    }
}
