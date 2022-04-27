//
//  AlertData.swift
//  download press
//
//  Created by Moby on 7.03.22.
//

import UIKit

extension UIViewController {
    
    func alertDate(label: UILabel, completionHandler: @escaping (Int, Date) -> Void) {
        
        let alert = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        let datePicer = UIDatePicker()
        datePicer.datePickerMode = .date
        datePicer.preferredDatePickerStyle = .wheels
        
        alert.view.addSubview(datePicer)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            let dateString = dateFormatter.string(from: datePicer.date)
            
            let calendar = Calendar.current
            let component = calendar.dateComponents([.weekday], from: datePicer.date)
            guard let weekday = component.weekday else { return }
            let numberWeekday = weekday
            let date = datePicer.date as NSDate
            completionHandler(numberWeekday, date as Date)
            
            label.text = dateString
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        alert.view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        datePicer.translatesAutoresizingMaskIntoConstraints = true
        datePicer.widthAnchor.constraint(equalTo: alert.view.widthAnchor).isActive = true
        datePicer.heightAnchor.constraint(equalToConstant: 160).isActive = true
        datePicer.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20).isActive = true
        
        
        present(alert, animated: true, completion: nil)
    }
}
