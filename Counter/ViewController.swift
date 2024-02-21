//
//  ViewController.swift
//  Counter
//
//  Created by Aleksandr Dugaev on 19.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var increasingCounterValueButton: UIButton!
    @IBOutlet weak var resettingCounterValueButton: UIButton!
    @IBOutlet weak var reducingCounterValueButton: UIButton!
    @IBOutlet weak var valueOfCounterLabel: UILabel!
    @IBOutlet weak var historyOfCounterChangesTextView: UITextView!
    var counter: Int = 0
    var changeHistoryArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueOfCounterLabel.text = "0"
        updateCounterChangeHistory()
    }
    
    func updateCounterChangeHistory() {
        var outputStringInTextViev = "История изменений: \n"
        for change in changeHistoryArray {
            outputStringInTextViev += change + "\n"
        }
        historyOfCounterChangesTextView.text = "\(outputStringInTextViev)"

    }
    
    func formatedDateTimeMoment() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "[dd.MM.yy HH:mm:ss]"
        return dateFormatter.string(from: Date())
    }
    
    @IBAction func increasingCounterValueTouchUpInside(_ sender: Any) {
        counter += 1
        valueOfCounterLabel.text = "Значение счётчика: \(counter)"
        changeHistoryArray.insert("\(formatedDateTimeMoment()): значение изменено на +1", at: 0)
        updateCounterChangeHistory()
        
    }
    
    @IBAction func resettingCounterValueTouchUpInside(_ sender: Any) {
        counter = 0
        valueOfCounterLabel.text = "Значение счётчика: \(counter)"
        changeHistoryArray.insert("\(formatedDateTimeMoment()): значение сброшено", at: 0)
        updateCounterChangeHistory()
    }
    
    @IBAction func reducingCounterValueTouchUpInside(_ sender: Any) {
        if counter == 0 {
            changeHistoryArray.insert("[\(formatedDateTimeMoment())]: попытка уменьшить значение счетчика ниже 0", at: 0)
            updateCounterChangeHistory()
        } else {
            counter -= 1
            valueOfCounterLabel.text = "Значение счётчика: \(counter)"
            changeHistoryArray.insert("\(formatedDateTimeMoment()): значение изменено на -1", at: 0)
            updateCounterChangeHistory()
        }
    }
}

