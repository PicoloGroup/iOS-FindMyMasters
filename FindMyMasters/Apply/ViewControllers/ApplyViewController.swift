//
//  ApplyViewController.swift
//  FindMyMasters
//
//  Created by HASAN CAN on 25/5/21.
//

import PKHUD

class ApplyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.configureNavigationBar()
        navigationItem.title = "Apply"
        title = "Apply"
//
//        form +++ Section("Student")
//            <<< TextRow { row in
//                row.title = "Name"
//                row.placeholder = "Enter name here"
//            }
//            <<< TextRow { row in
//                row.title = "Gender"
//                row.placeholder = "Enter gender here"
//            }
//            <<< DateRow {
//                $0.title = "Birthday"
//                $0.value = Date(timeIntervalSinceReferenceDate: 0)
//            }
//            <<< IntRow {
//                $0.title = "Social security number"
//                $0.placeholder = "Enter SSN here"
//            }
//            +++ Section("Program")
//            <<< TextRow { row in
//                row.title = "University"
//                row.placeholder = "Enter university here"
//            }
//            <<< TextRow { row in
//                row.title = "Program"
//                row.placeholder = "Enter program here"
//            }
//            +++ Section()
//            <<< ButtonRow { row in
//                row.title = "Submit"
//            }.onCellSelection { _, _ in
//                PKHUD.sharedHUD.contentView = PKHUDSuccessView()
//                PKHUD.sharedHUD.show()
//                PKHUD.sharedHUD.hide(afterDelay: 1.0) { _ in
//                    // Completion Handler
//                }
//            }.cellSetup { cell, _ in
//                cell.backgroundColor = Asset.Colors.primaryColor.color
//            }
    }
}
