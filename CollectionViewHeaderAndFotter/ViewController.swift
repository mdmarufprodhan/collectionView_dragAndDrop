//
//  ViewController.swift
//  CollectionViewHeaderAndFotter
//
//  Created by Joy on 13/9/23.
//

import UIKit

class ViewController: UIViewController {
    private var collectionView: UICollectionView!
    let width = (UIScreen.main.bounds.width - 20) / 1
    var images:[String] = [
        "image1",
        "image2",
        "image3",
        "image4",
        "image5",
        "image6",
        "image1",
        "image2",
        "image3",
        "image4",
        "image5",
        "image6",
        "image1",
        "image2",
        "image3",
        "image4",
        "image5",
        "image6",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout:UICollectionViewFlowLayout())
        collectionView.register(MyCollectionViewCell.nib, forCellWithReuseIdentifier: MyCollectionViewCell
            .identifier)
        
        collectionView.register(HeaderCollectionReusableView.nib, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader,withReuseIdentifier:HeaderCollectionReusableView.identifier)
        collectionView.register(FooterCollectionReusableView.nib, forSupplementaryViewOfKind:UICollectionView.elementKindSectionFooter
                                ,withReuseIdentifier:FooterCollectionReusableView.identifier)
        collectionView.delegate = self
        collectionView.dataSource =  self
        
        view.addSubview(collectionView)
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(_ :)))
        // Do any additional setup after loading the view.
        collectionView.addGestureRecognizer(gesture)
        // Do any additional setup after loading the view.
    }
    
    @objc func handleLongPressGesture(_ gesture: UILongPressGestureRecognizer) {
        guard let collectionView = collectionView else {
            return
        }
        switch gesture.state {
        case .began:
            guard let  targetIndexPath = collectionView.indexPathForItem(at: gesture.location(in: collectionView))  else {
                return
            }
            collectionView.beginInteractiveMovementForItem(at:targetIndexPath)
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: collectionView))
        case .ended:
            collectionView.endInteractiveMovement()
                default:
            collectionView.cancelInteractiveMovement()
                }
           
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}
// CollectionView Protocol
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let obj = UIImage(named:images[indexPath.row])
        guard let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as? MyCollectionViewCell else {
            fatalError()
        }
        cell.bind(imag:obj, titleLabel:"text \(indexPath.row)",subtitleLabel: "sub title\(indexPath.row)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top:1, left: 1, bottom: 1, right: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: width, height: width/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            return collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HeaderCollectionReusableView.identifier,
                for: indexPath)
        }
        // Footer
        return collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: FooterCollectionReusableView
                .identifier,
            for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:
                        view.frame.size.width, height:
                        view.frame.size.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width:
                        view.frame.size.width,height:
                        view.frame.size.height/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = images.remove(at: sourceIndexPath.row)
        images.insert(item, at: destinationIndexPath.row)
    }
    
}

