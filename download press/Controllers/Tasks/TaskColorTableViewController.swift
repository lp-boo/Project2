//
//  ColorTaskTableViewController.swift
//  download press
//
//  Created by Moby on 7.03.22.
//

import UIKit

class TaskColorTableViewController: UITableViewController {
    
    let idTaskColorCell = "idTaskColorCell"
    let idTaskHeader = "idTaskHeader"
    let headerNameArray = ["RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "DEEP BLUE", "PURPLE"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemGray6
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.register(ColorTableViewCell.self, forCellReuseIdentifier: String(describing: idTaskColorCell.self))
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: String(describing: idTaskHeader.self))
        
        
        title = "Color Tasks"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idTaskColorCell.self, for: indexPath) as! ColorTableViewCell
        cell.cellConfigure(indexPath: indexPath)
        return cell
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idTaskHeader) as! HeaderOptionsTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("TapCell")
        
        }
    }
    
    


