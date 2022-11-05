//
//  RecipesDataCollectionViewCell.swift
//  MobilenikTest
//
//  Created by Angelber Castro on 5/11/22.
//

import UIKit

class RecipesDataCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pictureImageView: MBImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    static let reuseIdentifier = "RecipesDataViellCell"
    static let cellHeight = 270

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configUI(recipes: RecipesHomeModel.Recipes.Response) {
        pictureImageView.setImage(urlString: recipes.image, imageView: pictureImageView)
        titleLabel.text = "\(recipes.name ?? "")"
        descriptionLabel.text = "\(recipes.description ?? "")"
    }

}
