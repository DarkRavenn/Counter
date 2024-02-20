//
//  ViewController.swift
//  Counter
//
//  Created by Aleksandr Dugaev on 19.02.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var outputOfCounterValue: UILabel!
    @IBOutlet weak var buttonForChangingCounterValue: UIButton!
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outputOfCounterValue.text = "Значение счетчика: \(counter)"
        buttonForChangingCounterValue.setTitle("+", for: .normal)
    }

    @IBAction func increasingCounterValue(_ sender: Any) {
            counter += 1
            outputOfCounterValue.text = "Значение счетчика: \(counter)"
        
    }
    
}

