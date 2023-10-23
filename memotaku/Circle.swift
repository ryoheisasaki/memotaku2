//
//  Circle.swift
//  memotaku
//
//  Created by 佐々木遼平 on 2023/10/02.
//

import UIKit

@IBDesignable

class Circle: UIView {
    
    
    @IBOutlet private weak var CircleView: UIView!
    
    
    @IBAction func didTapButton(_ sender: Any) {
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        configureView()
    }
    
    private func configureView() {
        loadNib()
    }
    
    private func loadNib() {
        guard let fooView = UINib(nibName: "circle", bundle: nil)
            .instantiate(withOwner: self, options: nil).first as? UIView
        else {
            fatalError()
        }
        
        fooView.frame = self.bounds
        
        addSubview(fooView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        CircleView.layer.cornerRadius = min(bounds.width,bounds.height) / 2
    }
    
}
