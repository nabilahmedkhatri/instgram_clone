//
//  LoginViewController.swift
//  instagram_clone
//
//  Created by Nabil on 10/24/18.
//  Copyright © 2018 Nabil. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogin(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: username.text!, password: password.text!, block: { (user: PFUser?, error) in
            if user != nil {
                print("You're logged in")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        })
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        
        newUser.username = username.text
        newUser.password = password.text
        
        newUser.signUpInBackground { (sucess: Bool, error) -> Void in
            if sucess {
                print("Yay, created user!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)

            }
            else {
                print(error?.localizedDescription)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
