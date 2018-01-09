//
//  DetailViewController.swift
//  CoreDataProject
//
//  Created by HoangLuyen on 11/17/17.
//  Copyright © 2017 HoangLuyen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var detailDescriptionTextField: UITextField!
    var masterVC: MasterViewController? = nil


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionTextField {
                label.text = detail.name!.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        detailDescriptionTextField.delegate = self
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: Navigation
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        detailDescriptionTextField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        updatePerson()
    }
    var detailItem: Person? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    //update data
    func updatePerson() {
        if let person = detailItem {
            person.name = detailDescriptionTextField.text ?? ""
            AppDelegate.shared.saveContext()
        }
        if let split = splitViewController {
            let controllers = split.viewControllers
            masterVC = (controllers.first as! UINavigationController).topViewController as? MasterViewController
        }
        navigationController?.popViewController(animated: true)
    }
}


