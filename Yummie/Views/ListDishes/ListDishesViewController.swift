//
//  ListDishesViewController.swift
//  Yummie
//
//  Created by mohsen on 02/12/2021.
//

import UIKit
import ProgressHUD

class ListDishesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var categore :DishCategory!
    var dishes : [Dish] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        title = categore.title
        registerCell()
        ProgressHUD.show()
        NetworkService.shared.fetchCategoryDishes(categoryId: categore.id ?? "") { [weak self] (result) in
            switch result{
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.dishes = dishes
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    private func registerCell(){
        
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    

 

}


extension ListDishesViewController : UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailsViewController.instance()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
