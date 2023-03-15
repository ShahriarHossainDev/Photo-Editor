//
//  HomeViewController.swift
//  Photo Editor
//
//  Created by Shishir_Mac on 15/3/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var getNewPhotoButton: UIButton!
    @IBOutlet weak var editPhotoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBAction
    @IBAction func getNewPhotoButtonAction(_ sender: UIButton) {
        print("Get New Photo")
    }
    
    @IBAction func editPhotoButtonAction(_ sender: UIButton) {
        print("Edit Photo")
    }
}
