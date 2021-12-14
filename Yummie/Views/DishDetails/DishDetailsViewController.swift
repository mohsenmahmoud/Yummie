//
//  DishDetailsViewController.swift
//  Yummie
//
//  Created by mohsen on 02/12/2021.
//

import UIKit
import ProgressHUD

class DishDetailsViewController: UIViewController {

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var caloriesLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish : Dish!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
       
    }
    
    private func populateView(){
        dishImageView.kf.setImage(with:dish.image?.asUrl)
        titleLable.text = dish.name
        descriptionLable.text = dish.description
        caloriesLable.text = dish.formattedCalories
    }
    

    @IBAction func placeOrderBTNClicked(_ sender: UIButton) {
        
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces),
              !name.isEmpty else{
                  ProgressHUD.showError("please enter your name")
                  return
              }
        ProgressHUD.show("placing Order...")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) { (result) in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Your order has been received")
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    

}
