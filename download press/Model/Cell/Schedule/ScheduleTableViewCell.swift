//
//  ScheduleTableViewCell.swift
//  download press
//
//  Created by Moby on 22.02.22.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    //    let lessonName: UILabel = {
    //        let label = UILabel()
    //        label.text = "Information"
    //        label.textColor = .black
    //        label.font = UIFont(name: "Avenir Next Demi Bold", size: 20)
    //        label.textAlignment = .left
    //        label.adjustsFontSizeToFitWidth = true
    //        label.translatesAutoresizingMaskIntoConstraints = false
    //        label.backgroundColor = .red
    //
    //        return label
    //    }()
    
    //   let teacherName: UILabel = {
    //        let label = UILabel()
    //        label.text = "Alex Alexov"
    //        label.textColor = .black
    //        label.font = UIFont(name: "Avenir Next", size: 20)
    //        label.textAlignment = .right
    //        label.adjustsFontSizeToFitWidth = true
    //        label.translatesAutoresizingMaskIntoConstraints = false
    //        label.backgroundColor = .red
    //
    //        return label
    //    }()
    //    let lessonTime: UILabel = {
    //        let label = UILabel()
    //        label.text = "08:00"
    //        label.textColor = .black
    //        label.font = UIFont(name: "Avenir Next", size: 20)
    //        label.textAlignment = .left
    //        label.adjustsFontSizeToFitWidth = true
    //        label.translatesAutoresizingMaskIntoConstraints = false
    //        label.backgroundColor = .red
    //
    //        return label
    //    }()
    //    let typeLabel: UILabel = {
    //        let label = UILabel()
    //        label.text = "Type"
    //        label.textColor = .black
    //        label.font = UIFont(name: "Avenir Next", size: 14)
    //        label.textAlignment = .center
    //        label.adjustsFontSizeToFitWidth = true
    //        label.translatesAutoresizingMaskIntoConstraints = false
    //        label.backgroundColor = .red
    //
    //        return label
    //    }()
//    let lessonType: UILabel = {
//        let label = UILabel()
//        label.text = "Lexion"
//        label.textColor = .black
//        label.font = UIFont(name: "Avenir Next Dimi Bolt", size: 20)
//        label.textAlignment = .left
//        label.adjustsFontSizeToFitWidth = true
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .red
//
//        return label
//    }()
//    let buildingLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Korpus"
//        label.textColor = .black
//        label.font = UIFont(name: "Avenir Next", size: 20)
//        label.textAlignment = .left
//        label.adjustsFontSizeToFitWidth = true
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .red
//
//        return label
//    }()
//    let lessonBuilding: UILabel = {
//        let label = UILabel()
//        label.text = "1"
//        label.textColor = .black
//        label.font = UIFont(name: "Avenir Next Demi Bold", size: 20)
//        label.textAlignment = .left
//        label.adjustsFontSizeToFitWidth = true
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .red
//
//        return label
//    }()
//
//    let audLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Auditoriya"
//        label.textColor = .black
//        label.font = UIFont(name: "Avenir Next", size: 20)
//        label.textAlignment = .left
//        label.adjustsFontSizeToFitWidth = true
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .red
//
//        return label
//    }()
//    let lessonAud: UILabel = {
//        let label = UILabel()
//        label.text = "101"
//        label.textColor = .black
//        label.font = UIFont(name: "Avenir Next", size: 20)
//        label.textAlignment = .left
//        label.adjustsFontSizeToFitWidth = true
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .red
//
//        return label
//    }()
    
    let lessonName = UILabel(text: "", font: .avenirNextDemiBold30())
    let teacherName = UILabel(text: "", font: .avenirNext30(), aligment: .right)
    let lessonTime = UILabel(text: "", font: .avenirNextDemiBold30())
    let typeLabel = UILabel(text: "Approach", font: .avenirNext20(), aligment: .right)
    let lessonType = UILabel(text: "", font: .avenirNextDemiBold30())
    let buildingLabel = UILabel(text: "Repet", font: .avenirNext30(), aligment: .right)
    let lessonBuilding = UILabel(text: "", font: .avenirNextDemiBold30())
    let audLabel = UILabel(text: "Weight", font: .avenirNext30(), aligment: .right)
    let lessonAud = UILabel(text: "", font: .avenirNextDemiBold30(), aligment: .left)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        setConstraints()
        self.selectionStyle = .none
        }
        
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: SchedulModel) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        lessonName.text = model.scheduleName
        guard let time = model.scheduleTime else {return}
        lessonTime.text = dateFormatter.string(from: time)
        lessonType.text = model.scheduleType
        lessonBuilding.text = model.scheduleBuilding
        lessonAud.text = model.scheduleAudience
        backgroundColor = UIColor().colorFromHex("\(model.scheduleColor)")
    }
    
    func setConstraints() {
        
        let topStackView = UIStackView(arrangedSubviews: [lessonName, teacherName], axis: .horizontal, spacing: 10, distribution: .fillEqually)
        //        stackView.addArrangedSubview(exerciseName)
        //        stackView.addArrangedSubview(repeatTimes)
        //        stackView.axis = .horizontal
        //        stackView.spacing = 10
        //        stackView.distribution = .fillEqually
        //        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(lessonTime)
        NSLayoutConstraint.activate([
            lessonTime.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            lessonTime.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            lessonTime.widthAnchor.constraint(equalToConstant: 100),
            lessonTime.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        self.addSubview(topStackView)
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            topStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            topStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            topStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        let bottomStackView = UIStackView(arrangedSubviews: [typeLabel, lessonType, buildingLabel, lessonBuilding, audLabel, lessonAud], axis: .horizontal, spacing: 10, distribution: .fillProportionally)
        
        self.addSubview(bottomStackView)
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            bottomStackView.leadingAnchor.constraint(equalTo: lessonTime.trailingAnchor, constant: 5),
            bottomStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            bottomStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        //        self.addSubview(exerciseName)
        //        NSLayoutConstraint.activate([
        //            exerciseName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
        //            exerciseName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
        //            exerciseName.widthAnchor.constraint(equalToConstant: self.frame.width / 2 - 10),
        //            exerciseName.heightAnchor.constraint(equalToConstant: 25)
        //        ])
        //
        //        self.addSubview(repeatTimes)
        //        NSLayoutConstraint.activate([
        //            repeatTimes.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
        //            repeatTimes.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
        //            repeatTimes.widthAnchor.constraint(equalToConstant: self.frame.width / 2 - 10),
        //            repeatTimes.heightAnchor.constraint(equalToConstant: 25)
        //        ])
    }
}
