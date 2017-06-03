//
//  SettingViewController.swift
//  MyTimer
//
//  Created by 米田 央 on 2017/06/03.
//  Copyright © 2017年 Swift-Yoneda. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
  
  let settingArray : [Int] = [10,20,30,40,50,60]
  
  let settingKey = "timer_value"
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    
    timerSettingPicker.delegate = self
    timerSettingPicker.dataSource = self
    
    let settings = UserDefaults.standard
    let timerValue = settings.integer(forKey: settingKey)
    
    for row in 0..<settingArray.count{
      if settingArray[row] == timerValue{
        timerSettingPicker.selectRow(row, inComponent: 0, animated: true)
      }
    }
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
  @IBOutlet weak var timerSettingPicker: UIPickerView!
  
  @IBAction func decisionButtonAction(_ sender: Any) {
    _ = navigationController?.popViewController(animated: true)
  }
  
  
  // ここから下は、pickerViewの作法的なところ！
  
  // 行数？
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  // 何個？
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return settingArray.count
  }
  
  // 何を表示する？
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return String(settingArray[row])
  }
  
  // 設定値を保持する
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    let settings = UserDefaults.standard
    settings.setValue(settingArray[row], forKey: settingKey)
    // メモリからストレージへ同期
    settings.synchronize()
  }
  
  
  
}
