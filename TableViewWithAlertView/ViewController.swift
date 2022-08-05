//
//  ViewController.swift
//  TableViewWithAlertView
//
//  Created by SST Mac Mini on 01/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var userArray = [DataModel]()
    
    @IBOutlet weak var showAlertButton: UIButton!
    @IBOutlet weak var userTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        self.userTableView.delegate = self
        //        self.userTableView.dataSource = self
        self.registerTableViewCells()
        print("Hello World!")
    }
    
    
    
    @IBAction func showAlertBtnPressed(_ sender: UIButton) {
        //        let alertDialog = Alert.showAlert
        //        present(alertDialog, animated: true)
        
        showAlert()
    }
    
    
    private func registerTableViewCells() {
        let customCell = UINib(nibName: "CostomTableViewCell", bundle: nil)
        self.userTableView.register(customCell, forCellReuseIdentifier: "CostomTableViewCell")
    }
    
    
}




extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CostomTableViewCell") as? CostomTableViewCell {
            
            print(userArray)
            
            cell.firstNameLable.text = userArray[indexPath.row].firstName
            cell.lastNameLable.text = userArray[indexPath.row].lastName
            cell.emailLable.text = userArray[indexPath.row].email
            cell.passwordLable.text = userArray[indexPath.row].passWord
            return cell
        }
        
        return UITableViewCell()
    }
}

extension ViewController
{
    func showAlert()  {
        
        let alert = UIAlertController(
            title: "Add User",
            message: "",
            preferredStyle: .alert
        )
        
        // add textfields
        alert.addTextField{field in
            field.placeholder = "First name"
            field.returnKeyType = .next
        }
        
        alert.addTextField{field in
            field.placeholder = "Last name"
            field.returnKeyType = .next
        }
        
        alert.addTextField{field in
            field.placeholder = "Email"
            field.returnKeyType = .next
            field.keyboardType = .emailAddress
        }
        
        alert.addTextField{field in
            field.placeholder = "Password"
            field.returnKeyType = .continue
            field.isSecureTextEntry = true
        }
        
        //add Buttons
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:  nil))
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: {_ in
           
            //read textfield value
            guard let fields = alert.textFields, fields.count == 4 else {
                return
            }
            
            let fNameField = fields[0]
            let lNameField = fields[1]
            let emailField = fields[2]
            let passwordField = fields[3]
            
            guard let fname = fNameField.text, !fname.isEmpty,
                  let lname = lNameField.text, !lname.isEmpty,
                  let email = emailField.text, !email.isEmpty,
                  let password = passwordField.text, !password.isEmpty else {
                print("All fields are mandatary")
                return
            }
            
            let data = DataModel(firstName: fname, lastName: lname, email: email, passWord: password)
         
            
            self.userArray.append(data)
            print(self.userArray[0].lastName)
            self.userTableView.reloadData()
            
        }))
        present(alert, animated: true)
    }
}

