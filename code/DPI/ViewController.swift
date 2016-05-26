//
//  ViewController.swift
//  DPI
//
//  Created by Bas Broek on 5/26/16.
//  Copyright © 2016 Bas Broek. All rights reserved.
//

import UIKit

public var allUsers: [User] = []
private let printer = Printer()

class ViewController: UIViewController {
  
  @IBOutlet weak var notificationPicker: UIPickerView! {
    didSet {
      notificationPicker.selectRow(2, inComponent: 0, animated: true)
    }
  }
  @IBOutlet weak var notificationMessage: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

extension ViewController {
  
  @IBAction func send(sender: AnyObject) {
    guard let message = notificationMessage.text else { return }
    let topic = Topic.cases[notificationPicker.selectedRowInComponent(0)]
    
    printer.send(notification: Notification(topic: topic, message: message))
    notificationMessage.text = ""
  }
}

extension ViewController: UIPickerViewDataSource {
  
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return Topic.cases.count
  }
}

extension ViewController: UIPickerViewDelegate {
  
  func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return Topic.cases[row].rawValue
  }
}
