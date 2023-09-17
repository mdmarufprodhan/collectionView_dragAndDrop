//
//  FooterCollectionReusableView.swift
//  CollectionViewHeaderAndFotter
//
//  Created by Joy on 13/9/23.
//

import UIKit

class FooterCollectionReusableView: UICollectionReusableView {
    static var identifier : String {
        return String(describing: self)
    }
    static var nib : UINib{
        return UINib(nibName: identifier, bundle:.main)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
