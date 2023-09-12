//
//  BaseViewController.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func showPopUp(character: Home.ResultResponse) {
        view.showPopUp(character: character)
    }
    
    func removePopUp() {
        view.removePopUp()
    }
}
