//
//  RecipesDetailsViewController.swift
//  MobilenikTest
//
//  Created by Angelber Castro on 5/11/22.
//

import UIKit

class RecipesDetailsViewController: BaseViewController {
    
    @IBOutlet weak var pictureImageView: MBImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var difficultLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var carbosLabel: UILabel!
    @IBOutlet weak var proteinsLabel: UILabel!
    @IBOutlet weak var fatsLabel: UILabel!
    @IBOutlet weak var descriptionsTextView: UITextView!
    
    var recipesData: RecipesHomeModel.Recipes.Response?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitialData(recipes: recipesData)
        setupBackButton()
    }
    
    // MARK: - Methods
    func loadInitialData(recipes: RecipesHomeModel.Recipes.Response?) {
        
        pictureImageView.setImage(urlString: recipesData?.image, imageView: pictureImageView)
        nameLabel.text = "\(recipes?.name ?? "")"
        difficultLabel.text = "\(recipes?.difficulty ?? 0)"
        caloriesLabel.text = "\(recipes?.calories ?? "")"
        carbosLabel.text = "\(recipes?.carbos ?? "")"
        proteinsLabel.text = "\(recipes?.proteins ?? "")"
        fatsLabel.text = "\(recipes?.fats ?? "")"
        descriptionsTextView.text = "\(recipes?.description ?? "")"
    }

}
