//
//  AlertTime.swift
//  download press
//
//  Created by Moby on 7.03.22.
//

import UIKit

extension UIViewController {
    
    func alertTime(label: UILabel, completionHandler: @escaping (Date) -> Void) {
        
        let alert = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        let datePicer = UIDatePicker()
        datePicer.datePickerMode = .time
        datePicer.preferredDatePickerStyle = .wheels
        datePicer.locale = NSLocale(localeIdentifier: "Ru_ru") as Locale
        
        alert.view.addSubview(datePicer)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            let timeString = dateFormatter.string(from: datePicer.date)
            let timeSchedule = datePicer.date as NSDate
            completionHandler(timeSchedule as Date)
            
            label.text = timeString
           
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

