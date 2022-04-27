//
//  ViewController.swift
//  download press
//
//  Created by Moby on 20.02.22.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()

       
    }
    
    func setupTabBar() {
        let scheduleVC = createNavController(vc: ScheduleViewController(), itemName: "Schedule", itemImage: "calendar.badge.clock")
//        let tasksVC = createNavController(vc: TaskViewController(), itemName: "Tasks", itemImage: "text.badge.checkmark")
        
//        viewControllers = [scheduleVC, tasksVC]
        viewControllers = [scheduleVC]
    }
    
    func createNavController(vc: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage), tag: 0)
       
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        
        return navController
    }


}

