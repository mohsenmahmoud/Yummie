//
//  ListOrdresViewController.swift
//  Yummie
//
//  Created by mohsen on 02/12/2021.
//

import UIKit
import ProgressHUD

class ListOrdresViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var orders : [Order] = []
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
registerCells()
        title = "order"
        
        ProgressHUD.show()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fetchOrders {  [weak self] (result) in
            switch result{
            case .success(let order):
                ProgressHUD.dismiss()
                self?.orders = order
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
                
            }
        }
    }
    private func registerCells(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}
 

extension ListOrdresViewController : UITableViewDelegate , UITableViewDataSource{
  
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailsViewController.instance()
        controller.dish = orders[indexPath.row].dish
        
        navigationController?.pushViewController(controller, animated: true)
    }
  
    
 
    
 
    
 
}

 
