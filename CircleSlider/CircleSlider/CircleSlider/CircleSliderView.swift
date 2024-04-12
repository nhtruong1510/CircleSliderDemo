//
//  CircleSliderView.swift
//  CircleSlider
//
//  Created by Truong Nguyen Huu on 12/4/24.
//

import Foundation
import UIKit
import HGCircularSlider

class CircleSliderView: UIView {
    @IBOutlet private var contentView: UIView!
    @IBOutlet private var containerView: UIView!
    @IBOutlet private var circleSlider: CircularSlider!
    @IBOutlet private var zoomView: UIView!
    @IBOutlet private var percentLabel: UILabel!
    @IBOutlet private var percentView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.cornerRadius = containerView.frame.height/2
        percentView.cornerRadius = percentView.frame.height/2
        zoomView.cornerRadius = min(zoomView.bounds.width, zoomView.bounds.height)/2
        percentLabel.font = .systemFont(ofSize: contentView.frame.height/15)
    }

    private func setupView() {
        Bundle.main.loadNibNamed("CircleSliderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        circleSlider.addTarget(self, action: #selector(updateTexts), for: .valueChanged)
        circleSlider.endPointValue = 0
        circleSlider.stopThumbAtMinMax = true
        self.zoomView.transform = CGAffineTransform.identity.scaledBy(x: 0, y: 0)
    }
        
    @objc func updateTexts() {
        let endPointValue = circleSlider.endPointValue
        UIView.animate(withDuration: 0.1, delay: 0.0,
                       options: UIView.AnimationOptions.curveEaseIn,
                       animations: {
            self.zoomView.transform = CGAffineTransform.identity.scaledBy(x: endPointValue, y: endPointValue)

        })
        let percent = (circleSlider.endPointValue * 100).rounded()
        percentLabel.text = Float(percent).clean + "%"
    }
}
