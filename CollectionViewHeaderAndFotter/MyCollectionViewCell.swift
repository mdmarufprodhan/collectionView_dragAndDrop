//
//  MyCollectionViewCell.swift
//  CollectionViewHeaderAndFotter
//
//  Created by Joy on 13/9/23.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var songSubTitleLabel: UILabel!
    @IBOutlet weak var buttonView: UIButton!
    
    static var identifier : String{
        return String(describing: self)
    }
    static var nib : UINib{
        return UINib(nibName: identifier, bundle:.main)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewSet()
        labelSet()
        
        // Initialization code
    }
    override func prepareForReuse() {
        super.prepareForReuse()
       //  imageView.image = nil
    }
    
    func bind(imag: UIImage?,titleLabel: String?,subtitleLabel: String?) {
        imageView.image = imag
        songTitleLabel?.text = titleLabel
        songSubTitleLabel?.text = subtitleLabel
    }
    
    func imageViewSet() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = CGFloat(10)
    }
    
    func labelSet() {
        songSubTitleLabel?.textColor = .gray
        songSubTitleLabel.font = songSubTitleLabel.font.withSize(10.0)
    }
    
}
