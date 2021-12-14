//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by mohsen on 01/12/2021.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideDescLable: UILabel!
    @IBOutlet weak var slideTitleLable: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!
    
    func setup(_ slide:OnboardingSlide){
        
        slideImageView.image = slide.image
        slideTitleLable.text = slide.title
        slideDescLable.text = slide.description
    }
    
}
