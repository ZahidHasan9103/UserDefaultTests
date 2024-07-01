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
    
    var userDefaults: UserDefaultsProtocol = UserDefaults.standard
    
    private var count: Int = 0{
        didSet {
            self.counterLabel.text = "\(count)"
            userDefaults.setValue(count, forKey: "count")
            incrementButton.isEnabled = true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        count = userDefaults.integer(forKey: "count")
    }
    
    @IBAction private func incrementButtonTapped(_ sender: UIButton){
        incrementButton.isEnabled = false
        count += 1
    }


}

protocol UserDefaultsProtocol{
    func setValue(_ value: Any?, forKey key: String)
    func integer(forKey defaultName: String) -> Int
}

extension UserDefaults: UserDefaultsProtocol{}

