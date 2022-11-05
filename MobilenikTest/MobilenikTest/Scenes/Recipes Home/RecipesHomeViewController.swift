//
//  RecipesHomeViewController.swift
//  MobilenikTest
//
//  Created by Angelber Castro on 5/11/22.
//

import UIKit

protocol RecipesHomeDisplayLogic: AnyObject {
    func displayRecipes(viewModel: RecipesHomeModel.Recipes.ViewModel, on queu: DispatchQueue)
    func displayError(viewModel: RecipesHomeModel.Error.ViewModel, on queu: DispatchQueue)
}

class RecipesHomeViewController: BaseViewController {
    
    @IBOutlet weak var recipesDataCollectionView: UICollectionView!
    
    
    var recipes : [RecipesHomeModel.Recipes.Response]? = []
    
    lazy var refresher: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .red
        refreshControl.addTarget(self, action: #selector(loadInitialData), for: .valueChanged)
        return refreshControl
    }()
    
    //MARK: - Collection View
    let cellRecipesDataCollectionNibName = "RecipesDataCollectionViewCell"
    
    var interactor: RecipesHomeBusinessLogic?
    var router: (NSObjectProtocol & RecipesHomeRoutingLogic & RecipesHomeDataPassing)?

    // MARK: - Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        let viewController = self
        let interactor = RecipesHomeInteractor()
        let presenter = RecipesHomePresenter()
        let router = RecipesHomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        settingsCollectionView()
        loadInitialData()
    }
    
    // MARK: - Methods
    @objc func loadInitialData() {
        showLoading()
        refresher.endRefreshing()
        let request = RecipesHomeModel.Recipes.Request()
        interactor?.getRecipes(request: request)
    }
    
    func settingsCollectionView(){
        recipesDataCollectionView.register(UINib(nibName: cellRecipesDataCollectionNibName, bundle: nil),
                                forCellWithReuseIdentifier: RecipesDataCollectionViewCell.reuseIdentifier)
        recipesDataCollectionView.refreshControl = refresher
    }

}

// MARK: - RecipesHomeDisplayLogic
extension RecipesHomeViewController: RecipesHomeDisplayLogic {
    func displayRecipes(viewModel: RecipesHomeModel.Recipes.ViewModel, on queu: DispatchQueue = .main) {
        hideLoading()
        
        if viewModel.data.count > 0 {
            recipes = viewModel.data
        }
        
        recipesDataCollectionView.reloadData()
    }
    
    func displayError(viewModel: RecipesHomeModel.Error.ViewModel, on queu: DispatchQueue = .main) {
        hideLoading()
        displaySimpleAlert(with: "Error", message: viewModel.error.description)
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension RecipesHomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = recipesDataCollectionView.dequeueReusableCell(withReuseIdentifier: RecipesDataCollectionViewCell.reuseIdentifier, for: indexPath) as? RecipesDataCollectionViewCell else {
            fatalError()
        }
        
        if let recipesData = recipes?[indexPath.row]{
            cell.configUI(recipes: recipesData)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = RecipesDetailsViewController()
        vc.recipesData = recipes?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 168, height: RecipesDataCollectionViewCell.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
    }

}
