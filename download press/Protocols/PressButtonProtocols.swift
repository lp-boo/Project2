//
//  PressButtonProtocols.swift
//  download press
//
//  Created by Moby on 7.03.22.
//

import Foundation

protocol PressReaadyTaskButtonProtocol: class {
    func readyButtonTapped(indexPath: IndexPath)
}
protocol SwitchRepeatProtocol: class {
    func switchRepeat(value: Bool)
}
