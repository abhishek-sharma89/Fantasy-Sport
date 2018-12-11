//
//  LandingVc.swift
//  PLAYING11
//
//  Created by Uttam on 11/12/18.
//  Copyright © 2018 mac307. All rights reserved.
//

import UIKit

class LandingVc: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func letsPlayBtnTapped(_ sender: Any) {
      
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVc") as! LoginVc
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
