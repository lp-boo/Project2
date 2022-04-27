//
//  TaskTableViewCell.swift
//  download press
//
//  Created by Moby on 7.03.22.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    let taskName = UILabel(text: "Programm", font: .avenirNextDemiBold30())
    let taskDescription = UILabel(text: "Try learning Ios Extension", font: .avenirNextDemiBold30())
    
    let readyButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "chevron.down.circle"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    weak var cellTaskDelegate: PressReaadyTaskButtonProtocol?
    var index: IndexPath?


override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.selectionStyle = .none
    
    setConstraints()
    readyButton.addTarget(self, action: #selector(readyButtonTapped), for: .touchUpInside)

}

required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}
    @objc func readyButtonTapped() {
        guard let index = index else { return }
        cellTaskDelegate?.readyButtonTapped(indexPath: index)
    }

func setConstraints() {
    
    self.contentView.addSubview(readyButton)
    NSLayoutConstraint.activate([
        readyButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        readyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:  -20),
        readyButton.heightAnchor.constraint(equalToConstant: 40),
        readyButton.widthAnchor.constraint(equalToConstant: 40)
    ])
    self.addSubview(taskName)
    NSLayoutConstraint.activate([
        taskName.topAnchor.constraint(equalTo: self.topAnchor, constant:  10),
        taskName.trailingAnchor.constraint(equalTo: readyButton.leadingAnchor, constant:  -5),
        taskName.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  5),
        taskName.heightAnchor.constraint(equalToConstant: 25)
    ])
    self.addSubview(taskDescription)
    NSLayoutConstraint.activate([
        taskDescription.topAnchor.constraint(equalTo: self.topAnchor, constant:  10),
        taskDescription.trailingAnchor.constraint(equalTo: readyButton.leadingAnchor, constant:  -5),
        taskDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  5),
        taskDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
    ])
    
  
    }
}
