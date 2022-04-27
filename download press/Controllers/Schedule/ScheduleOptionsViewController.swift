//
//  OptionsScheduleVC.swift
//  download press
//
//  Created by Moby on 7.03.22.
//

import UIKit

class ScheduleOptionsViewController: UITableViewController {
    
    let idOptionsScheduleCell = "idOptionsScheduleCell"
    let idOptionsScheduleHeader = "idOptionsScheduleHeader"
    let headerNameArray = ["DATA end TIME", "Lesson", "Teacher", "Color", "Period"]
//    let headerNameArray = ["DATA end TIME", "Lesson", "", "Color", "Period"]
    
   private var scheduleModel = SchedulModel()
    
    var hexColorCell = "1A4766"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemGray6
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.register(ScheduleOptionsTableViewCell.self, forCellReuseIdentifier: String(describing: idOptionsScheduleCell.self))
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: String(describing: idOptionsScheduleHeader.self))
        
        
        title = "Option Schedule"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
    }
    @objc private func saveButtonTapped() {
        
        if scheduleModel.scheduleDate == nil || scheduleModel.scheduleTime == nil || scheduleModel.scheduleName == "" {
            alertOK(title: "Error", message: "Requered fields: DATE, TIME, NAME")
        } else {
            scheduleModel.scheduleColor = hexColorCell
            RealmManager.shared.saveScheduleModel(model: scheduleModel)
            scheduleModel = SchedulModel()
            alertOK(title: "Success", message: nil)
            tableView.reloadRows(at: [[0,0],[0,1],[1,0],[1,1],[1,2],[1,3]], with: .fade)
//            tableView.reloadData()
        
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return 4
        case 2: return 1
        case 3: return 1
        default:
            return 1
            
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsScheduleCell.self, for: indexPath) as! ScheduleOptionsTableViewCell
        cell.cellConfigure(indexPath: indexPath)
        let color = UIColor().colorFromHex(hexColorCell)
        cell.backgroundViewCell.backgroundColor = (indexPath.section == 3 ? color : .white)
        cell.switchRepeatDelegate = self
       
        return cell
    
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsScheduleHeader) as! HeaderOptionsTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! ScheduleOptionsTableViewCell
        
        switch indexPath {
        case [0,0]:
            alertDate(label: cell.nameCellLabel) { numberWeekday, date in
            self.scheduleModel.scheduleDate = date
            self.scheduleModel.scheduleWeekday = numberWeekday
        }
        case [0,1]:
            alertTime(label: cell.nameCellLabel) { time in
            self.scheduleModel.scheduleTime = time
        }
        case [1,0]:
            alertForCellName(label: cell.nameCellLabel, name: "Name of the exercise", placeholder: "Enter name of the exercise"){ text in
            self.scheduleModel.scheduleName = text
        }
        case [1,1]:
            alertForCellName(label: cell.nameCellLabel, name: "Number of approaches", placeholder: "Enter number of approaches"){ text in
                self.scheduleModel.scheduleType = text
        }
        case [1,2]:
            alertForCellName(label: cell.nameCellLabel, name: "Number of repetitions", placeholder: "Enter number of repetitions"){ text in
                self.scheduleModel.scheduleBuilding = text
        }
        case [1,3]:
            alertForCellName(label: cell.nameCellLabel, name: "Weight Limit", placeholder: "Enter weight limit"){ text in
                self.scheduleModel.scheduleAudience = text
        }
            
        case [3,0]:
            let colors = ScheduleColorViewController()
            navigationController?.navigationBar.topItem?.title = "Options"
            navigationController?.pushViewController(colors, animated: true)

        default:
            print("EROR")
        }
    }
}
extension ScheduleOptionsViewController: SwitchRepeatProtocol {
    func switchRepeat(value: Bool) {
        scheduleModel.scheduleRepeat = value
    }
    
    
}
