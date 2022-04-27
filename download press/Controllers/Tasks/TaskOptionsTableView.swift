//
//  TaskOptionTableView.swift
//  download press
//
//  Created by Moby on 7.03.22.

import UIKit

class TaskOptionsTableView: UITableViewController {
    
    let idOptionsTaskCell = "idOptionsTaskCell"
    let idOptionsTasksHeader = "idOptionsTasksHeader"
    
    let headerNameArray = ["DATA", "Lesson", "Task", "Color"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemGray6
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.register(OptionTasksTableViewCell.self, forCellReuseIdentifier: String(describing: idOptionsTaskCell.self))
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: String(describing: idOptionsTasksHeader.self))
        
        
        title = "Option Tasks"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1

    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsTaskCell.self, for: indexPath) as! OptionTasksTableViewCell
        cell.cellConfigure(indexPath: indexPath)
        return cell
    
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsTasksHeader) as! HeaderOptionsTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! OptionTasksTableViewCell
        
        switch indexPath.section {
        case 0: alertDate(label: cell.nameCellLabel) { numberWeekday, date in
            print(numberWeekday, date)
        }
        case 1: alertForCellName(label: cell.nameCellLabel, name: "Name Lesson", placeholder: "Enter name lesson") { text in
            print(text)
        }
        case 2: alertForCellName(label: cell.nameCellLabel, name: "Name Task", placeholder: "Enter name task"){ text in
            print(text)
        }
        case 3: pushController(vc: TaskColorTableViewController())
        default:
            print("EROR")
        }
        
        func pushController(vc: UIViewController) {
            let viewController = vc
            navigationController?.navigationBar.topItem?.title = "Options"
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    
}

