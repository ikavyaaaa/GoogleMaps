//
//  UIView+Extension.swift
//  E-Price
//
//  Created by Kavya Krishna K. on 01/02/2024.
//

import UIKit


//@IBDesignable
extension UIView {
    
    
    
    @IBInspectable
    /// Should the corner be as circle
    public var circleCorner: Bool {
        get {
            return min(bounds.size.height, bounds.size.width) / 2 == cornerRadius
        }
        set {
            cornerRadius = newValue ? min(bounds.size.height, bounds.size.width) / 2 : cornerRadius
        }
    }
    
    
    @IBInspectable
    /// Should the corner be as circle
    public var topCorenerCorner: Bool {
        get {
            return min(bounds.size.height, bounds.size.width) / 2 == cornerRadius
        }
        set {
            cornerRadius = newValue ? min(bounds.size.height, bounds.size.width) / 2 : cornerRadius
        }
    }
    
    
    @IBInspectable
    /// Should the corner be as circle
    public var topRightCorner: Bool {
        get {
            return min(bounds.size.height, bounds.size.width) / 2 == cornerRadius
        }
        set {
            let maskPath1 = UIBezierPath(roundedRect: bounds,byRoundingCorners: [.bottomLeft , .topRight],cornerRadii: CGSize(width: 10, height: 10))
            let maskLayer1 = CAShapeLayer()
            maskLayer1.frame = bounds
            maskLayer1.path = maskPath1.cgPath
            layer.mask = maskLayer1
            return
        }
    }
    
    @IBInspectable
    /// Should the corner be as circle
    public var buttomLeftCorner: Bool {
        get {
            return min(bounds.size.height, bounds.size.width) / 2 == cornerRadius
        }
        set {
            let maskPath1 = UIBezierPath(roundedRect: bounds,byRoundingCorners: [.bottomLeft],cornerRadii: CGSize(width: 10, height: 10))
            let maskLayer1 = CAShapeLayer()
            maskLayer1.frame = bounds
            maskLayer1.path = maskPath1.cgPath
            layer.mask = maskLayer1
            return
        }
    }
    
    
    
    @IBInspectable
    /// Should the corner be as circle
    public var topRightLeftCorner: Bool {
        get {
            return min(bounds.size.height, bounds.size.width) / 2 == cornerRadius
        }
        set {
            let maskPath1 = UIBezierPath(roundedRect: bounds,byRoundingCorners: [.topLeft , .topRight],cornerRadii: CGSize(width: 10, height: self.height))
            let maskLayer1 = CAShapeLayer()
            maskLayer1.frame = bounds
            maskLayer1.path = maskPath1.cgPath
            layer.mask = maskLayer1
            return
        }
    }
    
    
    
    
    @IBInspectable
    /// Corner radius of view; also inspectable from Storyboard.
    public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = circleCorner ? min(bounds.size.height, bounds.size.width) / 2 : newValue
            //abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
    
    
    
    @IBInspectable
    /// Border color of view; also inspectable from Storyboard.
    public var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            guard let color = newValue else {
                layer.borderColor = nil
                return
            }
            layer.borderColor = color.cgColor
        }
    }
    
    @IBInspectable
    /// Border width of view; also inspectable from Storyboard.
    public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    /// Shadow color of view; also inspectable from Storyboard.
    public var shadowColor: UIColor? {
        get {
            guard let color = layer.shadowColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    /// Shadow offset of view; also inspectable from Storyboard.
    public var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    /// Shadow opacity of view; also inspectable from Storyboard.
    public var shadowOpacity: Double {
        get {
            return Double(layer.shadowOpacity)
        }
        set {
            layer.shadowOpacity = Float(newValue)
        }
    }
    
    @IBInspectable
    /// Shadow radius of view; also inspectable from Storyboard.
    public var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    /// Shadow path of view; also inspectable from Storyboard.
    public var shadowPath: CGPath? {
        get {
            return layer.shadowPath
        }
        set {
            layer.shadowPath = newValue
        }
    }
    
    @IBInspectable
    /// Should shadow rasterize of view; also inspectable from Storyboard.
    /// cache the rendered shadow so that it doesn't need to be redrawn
    public var shadowShouldRasterize: Bool {
        get {
            return layer.shouldRasterize
        }
        set {
            layer.shouldRasterize = newValue
        }
    }
    
    @IBInspectable
    /// Should shadow rasterize of view; also inspectable from Storyboard.
    /// cache the rendered shadow so that it doesn't need to be redrawn
    public var shadowRasterizationScale: CGFloat {
        get {
            return layer.rasterizationScale
        }
        set {
            layer.rasterizationScale = newValue
        }
    }
    
    @IBInspectable
    /// Corner radius of view; also inspectable from Storyboard.
    public var maskToBounds: Bool {
        get {
            return layer.masksToBounds
        }
        set {
            layer.masksToBounds = newValue
        }
    }
    
    @IBInspectable
    /// Corner radius of view; also inspectable from Storyboard.
    public var dashedBorder: Bool {
        //  if self.dashedBorder == true {
        let dashBorder = CAShapeLayer()
        dashBorder.lineWidth = 1
        dashBorder.strokeColor = UIColor.red.cgColor
        dashBorder.lineDashPattern = [6, 6] as [NSNumber]
        dashBorder.frame = bounds
        dashBorder.fillColor = nil
        if cornerRadius > 0 {
            dashBorder.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        } else {
            dashBorder.path = UIBezierPath(rect: bounds).cgPath
        }
        dashBorder.lineJoin = CAShapeLayerLineJoin.round
        dashBorder.name = "kShapeDashed"
        layer.addSublayer(dashBorder)
        return true
        //        }else { return false }
    }
    func addDashedBorder() {
        let color = #colorLiteral(red: 0.2669999897, green: 0.5609999895, blue: 1, alpha: 1)
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [4,6]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath
        self.layer.addSublayer(shapeLayer)
    }
    
    func animate() {
        UIView.animate(withDuration: 0.2, animations: { self.transform = CGAffineTransform(scaleX: 0.978, y: 0.98)},completion: { finish in
            UIView.animate(withDuration: 0.2, animations: { self.transform = CGAffineTransform.identity})
        })
    }
    
    
    func animateFromRight() {
        UIView.animate(withDuration: 0.35, animations: {
            let moveLeft = CGAffineTransform(translationX: self.bounds.width, y: 0.0)
            self.transform = moveLeft

        })
    }
    
    
    @IBInspectable var isGradient: Bool{
        get{
            return self.isGradient
        }
        set (hasDone) {
            if hasDone{
                setGradient()
            }
        }
    }
    
    func setGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.Theme.ePriceGreen.cgColor, UIColor.Theme.ePriceBGBlue.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: -0.8)
        gradientLayer.endPoint = CGPoint(x: 0.8, y: 0.9)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
        self.layoutIfNeeded()
    }
    
   
}

// MARK: - Properties
public extension UIView {
    
    /// Size of view.
    var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.width = newValue.width
            self.height = newValue.height
        }
    }
    
    /// Width of view.
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    /// Height of view.
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
}

extension UIView {
    
    func superview<T>(of type: T.Type) -> T? {
        return superview as? T ?? superview.flatMap { $0.superview(of: T.self) }
    }
    
    func bottom(_ tableView : UITableView , viewOnBottom height : CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leftAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.rightAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.widthAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}

// MARK: - Methods
public extension UIView {
    
    typealias Configuration = (UIView) -> Swift.Void
    
    func config(configurate: Configuration?) {
        configurate?(self)
    }
    
    /// Set some or all corners radiuses of view.
    ///
    /// - Parameters:
    ///   - corners: array of corners to change (example: [.bottomLeft, .topRight]).
    ///   - radius: radius for selected corners.
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
    
    func topRounded(_ radius: CGFloat = 20.0){
        let maskPath1 = UIBezierPath(roundedRect: bounds,byRoundingCorners: [.topLeft , .topRight],cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    func roundedCorners(top: Bool){
           let corners:UIRectCorner = (top ? [.topLeft , .topRight] : [.bottomRight , .bottomLeft])
           let maskPAth1 = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii:CGSize(width:20.0, height:20.0))
           let maskLayer1 = CAShapeLayer()
           maskLayer1.frame = self.bounds
           maskLayer1.path = maskPAth1.cgPath
           self.layer.mask = maskLayer1
       }
}


extension UIView {
    
    func transform(withCoeff coeff: CGFloat, andMoveCenterToPoint center: CGPoint) {
        let transform = CGAffineTransform(scaleX: coeff, y: coeff)
        self.transform = transform
        self.center = center
    }
    
    
    func animShow(){
        self.alpha = 0.0
        UIView.animate(withDuration: 0.3, delay: 0.2, options: [.curveLinear],
                       animations: {
            self.alpha = 0.5
            self.center.y -= self.center.y + 10
            self.layoutIfNeeded()
        }, completion: nil)
        self.isHidden = false
        self.alpha = 1.0
    }
    
    func animShowHidden() {
        UIView.animate(withDuration: 0.5, delay: 0.4, options: [.curveLinear],
                       animations: {
            self.center.y -= self.center.y + 5
            self.layoutIfNeeded()
        }, completion: nil)
        self.isHidden = false
    }
        
    func animHide(){
        UIView.animate(withDuration: 2, delay: 0, options: [.curveLinear],
                       animations: {
            self.center.y += self.bounds.height
            self.layoutIfNeeded()
            
        },  completion: {(_ completed: Bool) -> Void in
            self.isHidden = true
        })
    }
        
    func pulse(_ completion: ((Bool) -> Void)? = nil) {
        let targetSize = CGSize(width: self.bounds.width, height: self.bounds.height)
        let scale = targetSize.width / self.bounds.width
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: .beginFromCurrentState) {
            self.transform = CGAffineTransform(scaleX: scale, y: scale)
            self.layoutIfNeeded()
        } completion: { success in
            UIView.animate(withDuration: 0.3) {
                self.transform =  .identity
                self.layoutIfNeeded()
                completion?(success)
            }
           
        }
    }
    
    func pulsates() {
      
        let pulse1 = CASpringAnimation(keyPath: "transform.scale")
        pulse1.duration = 0.6
        pulse1.fromValue = 0.9
        pulse1.toValue = 1.0
        pulse1.autoreverses = true
        pulse1.repeatCount = 1
        pulse1.initialVelocity = 0.9
        pulse1.damping = 1.0
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 2.5
        animationGroup.repeatCount = 10000
        animationGroup.animations = [pulse1]
        
        layer.add(animationGroup, forKey: "pulse")
    }
    
    func pulsate() {
         let pulse = CASpringAnimation(keyPath: "transform.scale")
         pulse.duration = 0.6
         pulse.fromValue = 0.8
         pulse.toValue = 1.0
         pulse.autoreverses = false
         pulse.repeatCount = 0
         pulse.initialVelocity = 0.5
         pulse.damping = 1.0
         layer.add(pulse, forKey: "pulse")
     }
     
     func flash() {
         let flash = CABasicAnimation(keyPath: "opacity")
         flash.duration = 0.2
         flash.fromValue = 1
         flash.toValue = 0.1
         flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
         flash.autoreverses = true
         flash.repeatCount = 1
         layer.add(flash, forKey: nil)
     }
     
     
     func shake() {
         let shake = CABasicAnimation(keyPath: "position")
         shake.duration = 0.1
         shake.repeatCount = 2
         shake.autoreverses = true
         let fromPoint = CGPoint(x: center.x - 5, y: center.y)
         let fromValue = NSValue(cgPoint: fromPoint)
         let toPoint = CGPoint(x: center.x + 5, y: center.y)
         let toValue = NSValue(cgPoint: toPoint)
         shake.fromValue = fromValue
         shake.toValue = toValue
         layer.add(shake, forKey: "position")
     }
    
    
    func rotateUpAntiClock() {
        let transform = CGAffineTransform.identity
        UIView.animate(withDuration: 0.5) {
            self.transform = transform.rotated(by: 180 * CGFloat(Double.pi))
            self.transform = transform.rotated(by: -1 * CGFloat(Double.pi))
        }
    }
    
    
    func rotateDownAntiClock() {
        UIView.animate(withDuration: 0.5) {
            self.transform = CGAffineTransform(rotationAngle: -360 * CGFloat(Double.pi))
        }
    }
    
    
    func popup() {
        self.transform =
        CGAffineTransform.identity.scaledBy(x: 0.001, y: 0.001)
        UIView.animate(withDuration: 0.3 / 1.5, animations: {
            self.transform =
            CGAffineTransform.identity.scaledBy(x: 1.1, y: 1.1)
        }) { finished in
            UIView.animate(withDuration: 0.3 / 2, animations: {
                self.transform = .identity.scaledBy(x: 0.9, y: 0.9)
            }) { finished in
                UIView.animate(withDuration: 0.3 / 2, animations: {
                    self.transform = CGAffineTransform.identity
                })
            }
        }
    }

    
}

extension UIView {
    func addSubviewsUsingAutoLayout(_ views: UIView ...) {
        subviews.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

@objc extension NSLayoutAnchor {
    @discardableResult
    func constrain(_ relation: NSLayoutConstraint.Relation = .equal,
                   to anchor: NSLayoutAnchor,
                   with constant: CGFloat = 0.0,
                   prioritizeAs priority: UILayoutPriority = .required,
                   isActive: Bool = true) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint
        switch relation {
            case .equal:
                constraint = self.constraint(equalTo: anchor, constant: constant)
            case .greaterThanOrEqual:
                constraint = self.constraint(greaterThanOrEqualTo: anchor, constant: constant)
            case .lessThanOrEqual:
                constraint = self.constraint(lessThanOrEqualTo: anchor, constant: constant)
            @unknown default:
                fatalError()
        }
        constraint.set(priority: priority, isActive: isActive)
        return constraint
    }
}


extension NSLayoutDimension {
    
    @discardableResult
    func constrain(_ relation: NSLayoutConstraint.Relation = .equal,
                   to anchor: NSLayoutDimension,
                   with constant: CGFloat = 0.0,
                   multiplyBy multiplier: CGFloat = 1.0,
                   prioritizeAs priority: UILayoutPriority = .required,
                   isActive: Bool = true) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint
        switch relation {
            case .equal:
                constraint = self.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
            case .greaterThanOrEqual:
                constraint = self.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
            case .lessThanOrEqual:
                constraint = self.constraint(lessThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
            @unknown default:
                fatalError()
        }
        constraint.set(priority: priority, isActive: isActive)
        return constraint
    }
    
    @discardableResult
    func constrain(_ relation: NSLayoutConstraint.Relation = .equal,
                   to constant: CGFloat = 0.0,
                   prioritizeAs priority: UILayoutPriority = .required,
                   isActive: Bool = true) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint
        switch relation {
            case .equal:
                constraint = self.constraint(equalToConstant: constant)
            case .greaterThanOrEqual:
                constraint = self.constraint(greaterThanOrEqualToConstant: constant)
            case .lessThanOrEqual:
                constraint = self.constraint(lessThanOrEqualToConstant: constant)
            @unknown default:
                fatalError()
        }
        constraint.set(priority: priority, isActive: isActive)
        return constraint
    }
}
extension UILayoutPriority {
    static func +(lhs: UILayoutPriority, rhs: Float) -> UILayoutPriority {
        return UILayoutPriority(lhs.rawValue + rhs)
    }
    static func -(lhs: UILayoutPriority, rhs: Float) -> UILayoutPriority {
        return UILayoutPriority(lhs.rawValue - rhs)
    }
}
extension NSLayoutConstraint {
    func set(priority: UILayoutPriority, isActive: Bool) {
        self.priority = priority
        self.isActive = isActive
    }
}



extension UIView {

    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }


    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
    
    func addShadow() {
        layer.cornerRadius = 10
        layer.borderColor = UIColor.Theme.ePriceDarkGray.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 3
        layer.shadowColor  = UIColor.Theme.ePriceDarkGray.cgColor
    }
    
    func applyRoundedCorners() {
        maskToBounds = true
        clipsToBounds = true
        layer.cornerRadius = 30
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    

    
}


extension UIButton {
    func applyGradient(colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}


extension UIView {

    enum axis {
        case vertical, horizontal, custom(angle: CGFloat)
    }

    func setGradientBackgroundColor(colors: [UIColor], axis: axis, cornerRadius: CGFloat? = nil, apply: ((UIView) -> ())? = nil) {
        layer.sublayers?.filter { $0.name == "gradientLayer" }.forEach { $0.removeFromSuperlayer() }
        self.layoutIfNeeded()

        let cgColors = colors.map { $0.cgColor }

        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = cgColors
        gradient.name = "gradientLayer"
        gradient.locations = [0.0, 1.0]

        switch axis {
            case .horizontal:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
            case .custom(let angle):
                calculatePoints(for: angle, gradient: gradient)
            default:
                break
        }

        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)

        guard let cornerRadius = cornerRadius else { return }

        let circularPath = CGMutablePath()

        circularPath.move(to: CGPoint.init(x: cornerRadius, y: 0))
        circularPath.addLine(to: CGPoint.init(x: self.bounds.width - cornerRadius, y: 0))
        circularPath.addQuadCurve(to: CGPoint.init(x: self.bounds.width, y: cornerRadius), control: CGPoint.init(x: self.bounds.width, y: 0))
        circularPath.addLine(to: CGPoint.init(x: self.bounds.width, y: self.bounds.height - cornerRadius))
        circularPath.addQuadCurve(to: CGPoint.init(x: self.bounds.width - cornerRadius, y: self.bounds.height), control: CGPoint.init(x: self.bounds.width, y: self.bounds.height))
        circularPath.addLine(to: CGPoint.init(x: cornerRadius, y: self.bounds.height))
        circularPath.addQuadCurve(to: CGPoint.init(x: 0, y: self.bounds.height - cornerRadius), control: CGPoint.init(x: 0, y: self.bounds.height))
        circularPath.addLine(to: CGPoint.init(x: 0, y: cornerRadius))
        circularPath.addQuadCurve(to: CGPoint.init(x: cornerRadius, y: 0), control: CGPoint.init(x: 0, y: 0))


        let maskLayer = CAShapeLayer()
        maskLayer.path = circularPath
        maskLayer.fillRule = CAShapeLayerFillRule.evenOdd
        maskLayer.fillColor = UIColor.red.cgColor
        self.layer.mask = maskLayer

        apply?(self)
    }

    func calculatePoints(for angle: CGFloat, gradient: CAGradientLayer) {

        var ang = (-angle).truncatingRemainder(dividingBy: 360)
        if ang < 0 { ang = 360 + ang }
        let n: CGFloat = 0.5

        switch ang {
            case 0...45, 315...360:
                let a = CGPoint(x: 0, y: n * tanx(ang) + n)
                let b = CGPoint(x: 1, y: n * tanx(-ang) + n)
                gradient.startPoint = a
                gradient.endPoint = b
            case 45...135:
                let a = CGPoint(x: n * tanx(ang - 90) + n, y: 1)
                let b = CGPoint(x: n * tanx(-ang - 90) + n, y: 0)
                gradient.startPoint = a
                gradient.endPoint = b
            case 135...225:
                let a = CGPoint(x: 1, y: n * tanx(-ang) + n)
                let b = CGPoint(x: 0, y: n * tanx(ang) + n)
                gradient.startPoint = a
                gradient.endPoint = b
            case 225...315:
                let a = CGPoint(x: n * tanx(-ang - 90) + n, y: 0)
                let b = CGPoint(x: n * tanx(ang - 90) + n, y: 1)
                gradient.startPoint = a
                gradient.endPoint = b
            default:
                let a = CGPoint(x: 0, y: n)
                let b = CGPoint(x: 1, y: n)
                gradient.startPoint = a
                gradient.endPoint = b

        }
    }

    private func tanx(_ 𝜽: CGFloat) -> CGFloat {
        return tan(𝜽 * CGFloat.pi / 180)
    }

}


extension UITableView {

    func reloadWithAnimation() {
        self.reloadData()
        let tableViewHeight = self.bounds.size.height
        let cells = self.visibleCells
        var delayCounter = 0
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        for cell in cells {
            UIView.animate(withDuration: 1.6, delay: 0.08 * Double(delayCounter),usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
}


import UIKit

extension UIView {
    /// Animates a UIView with the given transform and duration
    /// - Parameters:
    ///   - transform: The initial transform to apply to the view
    ///   - duration: The animation duration (default is 0.35 seconds)
    func animateView(transform: CGAffineTransform, duration: TimeInterval = 0.35) {
        self.transform = transform
        UIView.animate(withDuration: duration, animations: {
            self.transform = .identity
            self.layoutIfNeeded()
        })
    }
}
