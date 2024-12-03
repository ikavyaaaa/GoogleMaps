//
//  UITextField+Extension.swift
//  E-Price
//
//  Created by Vishnu's Playstation on 07/02/24.
//

import UIKit

extension UITextField {
    
    @IBInspectable var placeHolderColor: UIColor? {
            get {
                return self.placeHolderColor
            }
            set {
                let attributedString = NSMutableAttributedString(string: self.placeholder != nil ? self.placeholder! : "")
                self.attributedPlaceholder = attributedString.setColorForText(self.placeholder != nil ? self.placeholder! : "", withColor: newValue ?? .red)
            }
        }
    
    func addBottomBorder() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 2)
        bottomLine.backgroundColor = UIColor.black.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}


extension UITextField {
    
    public typealias TextFieldConfig = (UITextField) -> Swift.Void
    
    public func config(textField configurate: TextFieldConfig?) {
        configurate?(self)
    }
    
    func left(image: UIImage?, color: UIColor = .black) {
        if let image = image {
            leftViewMode = UITextField.ViewMode.always
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: self.frame.size.height))
            let imageView = UIImageView(frame: paddingView.bounds)
            imageView.contentMode = .center
            imageView.image = image
            imageView.image = imageView.image
           // imageView.tintColor = color
            paddingView.addSubview(imageView)
            leftView = paddingView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
    }
    
    func right(image: UIImage?, color: UIColor = .black) {
        if let image = image {
            rightViewMode = UITextField.ViewMode.always
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: self.frame.size.height))
            let imageView = UIImageView(frame: paddingView.bounds)
            imageView.contentMode = .center
            imageView.image = image
            imageView.image = imageView.image
           // imageView.tintColor = color
            paddingView.addSubview(imageView)
            rightView = paddingView
            paddingView.isUserInteractionEnabled = false
            imageView.isUserInteractionEnabled = false
        } else {
            rightViewMode = UITextField.ViewMode.never
            rightView = nil
        }
    }
    
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    @IBInspectable var leftPadding: Bool {
        get{
            return self.leftPadding
        }
        set (hasDone) {
            if hasDone{
                setLeftPaddingPoints(16)
            }
        }
    }
    
    @IBInspectable var rightPadding: Bool {
        get{
            return self.rightPadding
        }
        set (hasDone) {
            if hasDone{
                setRightPaddingPoints(48)
            }
        }
    }
    
    @IBInspectable var bottomBorder : Bool {
        get{
            return self.bottomBorder
        }
        set (hasDone) {
            //addBottomBorder()
        }
    }
    
    @IBInspectable var topRounded: Bool {
        get{
            return self.topRounded
        }
        set (hasDone) {
            if hasDone{
                roundCorners([.topRight, .topLeft], radius: 5)
            }
        }
    }
    
    @IBInspectable var rightImage: UIImage {
        get{
            return UIImage()
        }
        set (newImage) {
            self.right(image: newImage)
        }
    }
    
    @IBInspectable var leftImage: UIImage {
        get{
            return UIImage()
        }
        set (newImage) {
            self.left(image: newImage)
        }
    }
    
    func setUnderline() {
        for sub in self.subviews {
            sub.removeFromSuperview()
        }
        if underlineStyle == true {
            var bottomBorder = UIView()
            bottomBorder = UIView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            bottomBorder.backgroundColor = borderColor  //YOUR UNDERLINE COLOR HERE
            bottomBorder.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(bottomBorder)
            
            bottomBorder.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            bottomBorder.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            bottomBorder.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            bottomBorder.heightAnchor.constraint(equalToConstant: underlineHeight).isActive = true
            layoutIfNeeded()
        }
    }
    
    @IBInspectable var underlineStyle: Bool {
        get {
            return true
        }
        set {
            setUnderline()
        }
    }
    
    @IBInspectable var underlineHeight: CGFloat {
        get {
            return 1
        }
        set {
            setUnderline()
        }
    }
    
    //    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
    //        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    //        let shape = CAShapeLayer()
    //        shape.path = maskPath.cgPath
    //        layer.mask = shape
    //    }
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "done".localized, style: .done, target: self, action: #selector(self.doneButtonAction))
        done.tintColor = #colorLiteral(red: 0.2392156863, green: 0.2862745098, blue: 0.4666666667, alpha: 1)
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
}

// MARK: - Methods

public extension UITextField {
    
    /// Set placeholder text color.
    /// - Parameter color: placeholder text color.
    func setPlaceHolderTextColor(_ color: UIColor) {
        self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
    
    /// Set placeholder text and its color
    func placeholder(text value: String, color: UIColor = .red) {
        self.attributedPlaceholder = NSAttributedString(string: value, attributes: [ NSAttributedString.Key.foregroundColor : color])
    }
    
    func isError(_ shakes: Float = 2, revert: Bool) {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "shadowColor")
        animation.fromValue = UIColor.clear.cgColor
        animation.toValue = UIColor.red.cgColor
        animation.duration = 0.4
        if revert { animation.autoreverses = true } else { animation.autoreverses = false }
        self.layer.add(animation, forKey: "")
        
        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.07
        shake.repeatCount = shakes
        if revert { shake.autoreverses = true } else { shake.autoreverses = false }
        shake.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(shake, forKey: "position")
    }
}


private var rightViews = NSMapTable<UITextField, UIView>(keyOptions: NSPointerFunctions.Options.weakMemory, valueOptions: NSPointerFunctions.Options.strongMemory)
private var errorViews = NSMapTable<UITextField, UIView>(keyOptions: NSPointerFunctions.Options.weakMemory, valueOptions: NSPointerFunctions.Options.strongMemory)

extension UITextField {
    // Add/remove error message
    func setError(_ string: String? = nil, show: Bool = true) {
        if let rightView = rightView, rightView.tag != 999 {
            rightViews.setObject(rightView, forKey: self)
        }

        // Remove message
        guard string != nil else {
            if let rightView = rightViews.object(forKey: self) {
                self.rightView = rightView
                rightViews.removeObject(forKey: self)
            } else {
                self.rightView = nil
            }

            if let errorView = errorViews.object(forKey: self) {
                errorView.isHidden = true
                errorViews.removeObject(forKey: self)
            }
            return
        }

        // Create container
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false

        // Create triangle
        let triagle = TriangleTop()
        triagle.backgroundColor = .clear
        triagle.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(triagle)

        // Create red line
        let line = UIView()
        line.backgroundColor = .red
        line.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(line)

        // Create message
        let label = UILabel()
        label.text = string
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.backgroundColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 250), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(label)

        // Set constraints for triangle
        triagle.heightAnchor.constraint(equalToConstant: 10).isActive = true
        triagle.widthAnchor.constraint(equalToConstant: 15).isActive = true
        triagle.topAnchor.constraint(equalTo: container.topAnchor, constant: -10).isActive = true
        triagle.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -15).isActive = true

        // Set constraints for line
        line.heightAnchor.constraint(equalToConstant: 3).isActive = true
        line.topAnchor.constraint(equalTo: triagle.bottomAnchor, constant: 0).isActive = true
        line.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0).isActive = true
        line.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 0).isActive = true

        // Set constraints for label
        label.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 0).isActive = true
        label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0).isActive = true
        label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 0).isActive = true

        if !show {
            container.isHidden = true
        }
         superview!.superview!.addSubview(container)
        //UIWindow.keyWindow!.addSubview(container)

        // Set constraints for container
        container.widthAnchor.constraint(lessThanOrEqualTo: superview!.widthAnchor, multiplier: 1).isActive = true
        container.trailingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: 0).isActive = true
        container.topAnchor.constraint(equalTo: superview!.bottomAnchor, constant: 0).isActive = true

        // Hide other error messages
        let enumerator = errorViews.objectEnumerator()
        while let view = enumerator!.nextObject() as! UIView? {
            view.isHidden = true
        }

        // Add right button to textField
        let errorButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 44.0, height: 44.0))
        errorButton.tag = 999
        errorButton.setImage(UIImage(named: "ic_error"), for: .normal)
        errorButton.frame = CGRect(x: 0, y: 0, width: frame.size.height, height: frame.size.height)
        errorButton.addTarget(self, action: #selector(errorAction), for: .touchUpInside)
        rightView = errorButton
        rightViewMode = .always

        // Save view with error message
        errorViews.setObject(container, forKey: self)
    }

    // Show error message
    @IBAction
    func errorAction(_ sender: Any) {
        let errorButton = sender as! UIButton
        let textField = errorButton.superview as! UITextField

        let errorView = errorViews.object(forKey: textField)
        if let errorView = errorView {
            errorView.isHidden.toggle()
        }

        let enumerator = errorViews.objectEnumerator()
        while let view = enumerator!.nextObject() as! UIView? {
            if view != errorView {
                view.isHidden = false
            }
        }

        // Don't hide keyboard after click by icon
      //  UIViewController().isCatchTappedAround = false
    }
}

class TriangleTop: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        context.beginPath()
        context.move(to: CGPoint(x: (rect.maxX / 2.0), y: rect.minY))
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        context.addLine(to: CGPoint(x: (rect.minX / 2.0), y: rect.maxY))
        context.closePath()

        context.setFillColor(UIColor.red.cgColor)
        context.fillPath()
    }
}


extension NSMutableAttributedString {

    func setColorForText(_ textForAttribute: String, withColor color: UIColor = #colorLiteral(red: 0.9610000253, green: 0.09399999678, blue: 0.09399999678, alpha: 1)) -> NSMutableAttributedString {
        
        let range = textForAttribute.range(of: "*")!
        let convertedRange = NSRange(range, in: textForAttribute)
        let attributedString = NSMutableAttributedString(string: textForAttribute)
        attributedString.setAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], range: convertedRange)
        return attributedString
    }

}

