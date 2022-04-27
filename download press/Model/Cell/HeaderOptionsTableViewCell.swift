//
//  HeaderOptionScheduleTableView.swift
//  download press
//
//  Created by Moby on 7.03.22.
//

import UIKit

class HeaderOptionsTableViewCell: UITableViewHeaderFooterView {
    
    let headerLabel = UILabel(text: "Header", font: .avenirNext20())
    
   

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .systemGray6
    
        setConstraints()
       
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func headerConfigure(nameArray: [String], section: Int) {
        headerLabel.text = nameArray[section]
    }
    
    func setConstraints() {
        
        self.addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            headerLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        

    }
}


