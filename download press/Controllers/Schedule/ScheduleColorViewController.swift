//
//  ScheduleColorViewController.swift
//  download press
//
//  Created by Moby on 7.03.22.
//

import UIKit

class ScheduleColorViewController: UITableViewController {
    
    let idOptionsColorCell = "idOptionsColorCell"
    let idOptionsScheduleHeader = "idOptionsScheduleHeader"
    let headerNameArray = ["RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "DEEP BLUE", "PURPLE"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemGray6
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.register(ColorTableViewCell.self, forCellReuseIdentifier: String(describing: idOptionsColorCell.self))
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: String(describing: idOptionsScheduleHeader.self))
        
        
        title = "Color"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsColorCell.self, for: indexPath) as! ColorTableViewCell
        cell.cellConfigure(indexPath: indexPath)
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
        return 25
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0: setColor(color: "BE2813")
        case 1: setColor(color: "F07F5A")
        case 2: setColor(color: "F3AF22")
        case 3: setColor(color: "467C24")
        case 4: setColor(color: "2D7FC1")
        case 5: setColor(color: "1A4766")
        case 6: setColor(color: "2D038F")
            
        default:
            setColor(color: "FFFFFF")
            
        }
    }
    private func setColor(color: String) {
        let scheduleOptions = self.navigationController?.viewControllers[1] as? ScheduleOptionsViewController
        scheduleOptions?.hexColorCell = color
        scheduleOptions?.tableView.reloadRows(at: [[3,0]], with: .none)
        self.navigationController?.popViewController(animated: true)
    }
}



