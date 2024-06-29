//
//  ViewController.swift
//  UserDefaultTests
//
//  Created by ZEUS on 28/6/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private(set) var counterLabel: UILabel!
    @IBOutlet private(set) var incrementButton: UIButton!
    
    private var count: Int = 0{
        didSet {
            self.counterLabel.text = "\(count)"
            UserDefaults.standard.setValue(count, forKey: "count")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        count = UserDefaults.standard.integer(forKey: "count")
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func incrementButtonTapped(_ sender: UIButton){
        count += 1
    }


}

