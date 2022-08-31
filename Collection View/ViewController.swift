//
//  ViewController.swift
//  Collection View
//
//  Created by kishore-pt5557 on 24/08/22.
//

import UIKit

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        let val = arr[indexPath.row]
        cell.model = val
        return cell
    }
}


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var arr: [Model] = []
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cView = UICollectionView(frame: .zero, collectionViewLayout: layout);
        cView.delegate = self
        cView.dataSource = self
        cView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        cView.translatesAutoresizingMaskIntoConstraints = false
        return cView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let images = [
            UIImage(named: "house"),
            UIImage(named: "stars"),
            UIImage(named: "sunset")
        ]
        
        for _ in 0..<30 {
            let model = Model(img: images.randomElement()!!)
            arr.append(model)
        }
        
        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            self.present(ViewController2(), animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.size.width, height: (view.frame.size.width/3))
    }
    
    func collectionView(_ collectionView:UICollectionView,layout collectionViewLayout:UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section:Int)->CGFloat {
        0
    }
    
    func collectionView(_ collectionView:UICollectionView,layout collectionViewLayout:UICollectionViewLayout,
                                 minimumLineSpacingForSectionAt section:Int)->CGFloat {
        0
    }
    

    
}

class ViewController2: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemBlue
    }
    
}
