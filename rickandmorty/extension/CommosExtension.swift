//
//  CommosExtension.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

import UIKit

extension Encodable {
    
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    
    var prettyPrintedString: String {
        guard let data = try? JSONEncoder().encode(self),
              let object = try? JSONSerialization.jsonObject(with: data, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return String() }
        return prettyPrintedString as String
    }
}

extension UIView {
    func showPopUp(character: Home.ResultResponse) {
        let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        let popUp = PopUpView(character: character)
        window?.fillViewWith(popUp)
    }
    
    func removePopUp() {
        let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        if let popUp = window?.subviews.first(where: { $0 is PopUpView }) {
            popUp.removeFromSuperview()
        }
    }

    func fillViewWith(_ view: UIView, top: CGFloat = 0, bottom: CGFloat = 0, leading: CGFloat = 0, trailing: CGFloat = 0, zindex: Int? = nil) {
        view.translatesAutoresizingMaskIntoConstraints = false
        if let zindex = zindex {
            insertSubview(view, at: zindex)
        } else {
            addSubview(view)
        }

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor, constant: top),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottom),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leading),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: trailing)
        ])
    }

    class var viewId: String {
        return "\(self)"
    }

    func addBlurEffect(effect: UIBlurEffect.Style = .dark) {
        let blurEffect = UIBlurEffect(style: effect)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }

    func addRoundCorner(point: CGFloat = 8.0) {
        layer.cornerRadius = point
        clipsToBounds = true
    }
}

extension UIFont {
    public enum nameOf: String {
    case Georgia_BoldItalic = "Georgia-BoldItalic"
    case Georgia_Italic = "Georgia-Italic"
    case Georgia = "Georgia"
    case Georgia_Bold = "Georgia-Bold"
    }
}

extension String {
    func getDateInString(outputFormat: String = "dd/MMMM/YYYY") -> String? {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormat.timeZone = TimeZone(abbreviation: "GMT")
        
        if let date = dateFormat.date(from: self) {
            dateFormat.dateFormat = outputFormat
            return dateFormat.string(from: date)
        }
        
        return nil
    }
}
