//
//  SchedulModel.swift
//  download press
//
//  Created by Moby on 8.03.22.
//

import RealmSwift
import Foundation

class SchedulModel: Object {
    @Persisted var scheduleDate: Date? = nil
    @Persisted var scheduleTime: Date? = nil
    @Persisted var scheduleName: String = ""
    @Persisted var scheduleType: String = ""
    @Persisted var scheduleBuilding: String = ""
    @Persisted var scheduleAudience: String = ""
    @Persisted var scheduleTeacher: String = ""
    @Persisted var scheduleColor: String = "1A4766"
    @Persisted var scheduleRepeat: Bool = true
    @Persisted var scheduleWeekday: Int = 1
}
