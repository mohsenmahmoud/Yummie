//
//  HomeViewController.swift
//  Yummie
//
//  Created by mohsen on 01/12/2021.
//

import UIKit
import ProgressHUD
 
class HomeViewController: UIViewController {

    
    
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var PopularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    var categorys: [DishCategory] = []
    
    
    
    var populars : [Dish] = []
    
    var specials : [Dish] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        registerCells()
       
        NetworkService.shared.fecthAllcategories { [weak self] (result) in
            switch result{
            case .success(let allDishes):
                print("succeful\(allDishes)")
                ProgressHUD.dismiss()
                self?.categorys = allDishes.categories ?? []
                self?.populars = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                
                self?.categoryCollectionView.reloadData()
                self?.PopularCollectionView.reloadData()
                self?.specialsCollectionView.reloadData()
            case .failure(let error):
                 
                ProgressHUD.showError(error.localizedDescription)
                
            }
        }
       
    }
    private func registerCells(){
        
        categoryCollectionView.register(UINib(nibName: categoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: categoryCollectionViewCell.identifier)
        
        
        PopularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        
        
        specialsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCellCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCellCollectionViewCell.identifier)
    
    }
    

 

}

extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView{
            
        case categoryCollectionView:
            return categorys.count
            
        case PopularCollectionView :
            return populars.count
            
        case specialsCollectionView :
            return specials.count
            
        default : return 0
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch collectionView{
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:categoryCollectionViewCell.identifier , for: indexPath) as! categoryCollectionViewCell
            cell.setup(category: categorys[indexPath.row])
            return cell
        case PopularCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:DishPortraitCollectionViewCell.identifier , for: indexPath) as!DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        case specialsCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:DishLandscapeCollectionViewCellCollectionViewCell.identifier , for: indexPath) as!DishLandscapeCollectionViewCellCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
            
        default : return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView{
            
            let controller = ListDishesViewController.instance()
            controller.categore = categorys[indexPath.row]
            
            navigationController?.pushViewController(controller, animated: true)
            
        }else{
            let controller = DishDetailsViewController.instance()
            
            controller.dish = collectionView == PopularCollectionView ?
            populars[indexPath.row] :
            specials[indexPath.row]
            
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
  
}
