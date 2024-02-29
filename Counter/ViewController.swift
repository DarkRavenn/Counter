//
//  ViewController.swift
//  Counter
//
//  Created by Aleksandr Dugaev on 19.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var increasingCounterValueButton: UIButton!
    @IBOutlet private weak var resettingCounterValueButton: UIButton!
    @IBOutlet private weak var reducingCounterValueButton: UIButton!
    @IBOutlet private weak var valueOfCounterLabel: UILabel!
    @IBOutlet private weak var historyOfCounterChangesTextView: UITextView!
    private var counter: Int = 0
    private var changeHistoryArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueOfCounterLabel.text = "0"
        updateCounterChangeHistory()
    }
    
    private func updateCounterChangeHistory() {
        var outputStringInTextView = "История изменений: \n"
        for change in changeHistoryArray {
            outputStringInTextView += change + "\n"
        }
        historyOfCounterChangesTextView.text = "\(outputStringInTextView)"

    }
    
    private func formattedDateTimeMoment() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "[dd.MM.yy HH:mm:ss]"
        return dateFormatter.string(from: Date())
    }
    
    @IBAction private func increasingCounterValueTouchUpInside(_ sender: Any) {
        counter += 1
        valueOfCounterLabel.text = "Значение счётчика: \(counter)"
        changeHistoryArray.insert("\(formattedDateTimeMoment()): значение изменено на +1", at: 0)
        updateCounterChangeHistory()
        
    }
    
    @IBAction private func resettingCounterValueTouchUpInside(_ sender: Any) {
        counter = 0
        valueOfCounterLabel.text = "Значение счётчика: \(counter)"
        changeHistoryArray.insert("\(formattedDateTimeMoment()): значение сброшено", at: 0)
        updateCounterChangeHistory()
    }
    
    @IBAction private func reducingCounterValueTouchUpInside(_ sender: Any) {
        if counter == 0 {
            changeHistoryArray.insert("[\(formattedDateTimeMoment())]: попытка уменьшить значение счетчика ниже 0", at: 0)
            updateCounterChangeHistory()
        } else {
            counter -= 1
            valueOfCounterLabel.text = "Значение счётчика: \(counter)"
            changeHistoryArray.insert("\(formattedDateTimeMoment()): значение изменено на -1", at: 0)
            updateCounterChangeHistory()
        }
    }
}

