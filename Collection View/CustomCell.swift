//
//  CustomCell.swift
//  Collection View
//
//  Created by kishore-pt5557 on 24/08/22.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    static let identifier = "CustomCell"
    
    var model: Model? {
        didSet{
            guard let model = model else { return }
            imgView.image = model.img
        }
    }
    
    lazy var imgView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imgView)
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
//        imgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        imgView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        
//        imgView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
