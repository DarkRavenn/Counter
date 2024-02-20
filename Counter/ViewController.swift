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
    // Самый простой способ — использовать UserDefaults.standard, без всяких оберток:
    let defaults = UserDefaults.standard
    var counter: Int = 0
    var changeHistoryArray: [String] = []
    var tempString = ""
    
    //var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Достаем значение changeHistoryArray из UserDefaults
        changeHistoryArray = defaults.stringArray(forKey: "changeHistory") ?? ["История изменений"]
        updateCounterChangeHistory()
    }
    
    func updateCounterChangeHistory() {
        tempString = ""
        for text in changeHistoryArray {
            tempString += text + "\n"
        }
        historyOfCounterChangesTextView.text = "\(tempString)"
        // Сохраняем значение changeHistoryArray в UserDefaults
        defaults.set(changeHistoryArray, forKey: "changeHistory")
    }
    
    func formatedDateTimeMoment() -> String {
        let dateNow = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "[dd.MM.yy HH:mm:ss]"

        // let weekday = dateFormatter.string(from: dateNow)
        return dateFormatter.string(from: dateNow)
    }
    
    @IBAction func increasingCounterValueTouchUpInside(_ sender: Any) {
        counter += 1
        valueOfCounterLabel.text = "Значение счётчика: \(counter)"
        //changeHistoryArray.append("Значение счётчика увеличено")
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
    
    @IBAction func deletingHistoryOfCounterTouchUpInside(_ sender: Any) {
        changeHistoryArray = ["История изменений"]
        updateCounterChangeHistory()
        //
        UserDefaults.standard.removeObject(forKey: "changeHistory")
        UserDefaults.standard.synchronize()
    }
    
    // удаление
    // UserDefaults.standard.removeObject(forKey: "userAge")
    // синхронизация
    // UserDefaults.standard.synchronize()
    
}

