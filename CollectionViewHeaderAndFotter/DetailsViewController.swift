//
//  DetailsViewController.swift
//  CollectionViewHeaderAndFotter
//
//  Created by Md Maruf Prodhan on 17/9/23.
//

import UIKit

class DetailsViewController: UIViewController {
    static var identifier : String{
        return String(describing: self)
    }
    static var nib : UINib{
        return UINib(nibName: identifier, bundle:.main)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        super.awakeFromNib()

        // Do any additional setup after loading the view.
    }

    @IBAction func dismissButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
