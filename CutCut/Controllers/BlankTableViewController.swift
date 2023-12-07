//
//  BlankTableViewController.swift
//  CutCut
//
//  Created by Egor Rybin on 24.10.2023.
//

import UIKit
import Alamofire

struct BlankTable {
    var lenField: Int
    //var widthField: Double
    var ctnField: Int
    
    init(lenField: Int, ctnField: Int) {
        self.lenField = lenField
        //self.widthField = widthField
        self.ctnField = ctnField
    }
    
}


class BlankTableViewController: UIViewController {
    
    //var array: [BlankTable] = [BlankTable(lenField: 0, ctnField: 0)]
    var array2: [BlankTable] = [BlankTable(lenField: 0, ctnField: 0)]
    
//    @IBAction func AddNewBlank(_ sender: Any) {
//        //print("add")
//        array.append(BlankTable(lenField: 0, ctnField: 0))
//        tableView1.reloadData()
//    }
    
    @IBOutlet weak var bladeSource: UITextField!
    @IBOutlet weak var lenSource: UITextField!
    @IBAction func AddNewCut(_ sender: Any) {
        //print("add2")
        array2.append(BlankTable(lenField: 0, ctnField: 0))
        tableView2.reloadData()
    }
    
    //@IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    
    override func viewDidLoad() {
   
        super.viewDidLoad()
        //tableView1.register(CustomTableViewCell.self, forCellReuseIdentifier: "firstCell")
//        tableView1.delegate = self
//        tableView1.dataSource = self
        //tableView2.register(CustomTableViewCell.self, forCellReuseIdentifier: "secondCell")
        tableView2.delegate = self
        tableView2.dataSource = self
        tableView2.allowsSelection = false

    }
    
    
    @IBAction func PostReqBlank(_ sender: Any) {
//        print(array)
//        print(array2)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ShowResultViewController") as! ShowResultViewController

        var resultStr: String = ""
        for tab in array2 {
            for _ in stride(from: 0, through: tab.ctnField-1, by: 1)//0...tab.ctnField-1
            {
                resultStr = resultStr + String(tab.lenField) + ","
            }
        }
        resultStr = String(resultStr.dropLast())
        //print(resultStr)
        //vc.resStr = 
        
        APIFetchHandler.sharedInstance.fetchAPIData(blade: bladeSource.text ?? "1", max: lenSource.text ?? "6000", data: resultStr) {result in
//            print(result)
            vc.resStr = result
            vc.max = Int(self.lenSource.text ?? "0")
            vc.blade = Int(self.bladeSource.text ?? "0")
//            //print(vc.resStr)
            self.present(vc, animated: true, completion: nil)
        }
        
        
    }
    
}


extension BlankTableViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if tableView == tableView1 {
//            return array.count
//        } else if tableView == tableView2 {
//            return array2.count
//        }
//        
//        return 0
        return array2.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if tableView == tableView1 {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as? CustomTableViewCell else {
//                return UITableViewCell()
//            }
//            
//            cell.TFLength?.text = String(array[indexPath.row].lenField)
//            cell.TFCtn?.text = String(array[indexPath.row].ctnField)
////            cell.TFLength.textAlignment = .center
////            cell.TFCtn.textAlignment = .center
////            cell.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
////            cell.layer.borderWidth = 1.0
////
//            cell.TFLength.tag = indexPath.row
//            cell.TFCtn.tag = indexPath.row
//            cell.TFLength.delegate = self
//            cell.TFCtn.delegate = self
//            
//            return cell
//        } else if tableView == tableView2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as? CustomTableViewCell else {
                return UITableViewCell()
            }
            
            cell.TFLength?.text = String(array2[indexPath.row].lenField)
            cell.TFCtn?.text = String(array2[indexPath.row].ctnField)
            //cell.TFWidth?.text = String(array2[indexPath.row].widthField)
//            cell.TFLength.textAlignment = .center
//            cell.TFCtn.textAlignment = .center
//            cell.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//            cell.layer.borderWidth = 1.0
//
            cell.TFLength.tag = indexPath.row
            cell.TFCtn.tag = indexPath.row
            //cell.TFWidth.tag = indexPath.row
            cell.TFLength.delegate = self
            cell.TFCtn.delegate = self
            //cell.TFWidth.delegate = self
            
            return cell
//        }
//        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
//        let vc = ChatViewController()
//        vc.chatID = "firstChatId"
//        vc.otherId = "uhzLE6DZppZIlKb8UBpqZvzHPbj2"
//        navigationController?.pushViewController(vc, animated: true)
        //array[]
        //= cell.textLabel!.text
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
//        
//        print(indexPath.row)
//        print(array[indexPath.row].lenField)
//        print(array[indexPath.row].ctnField)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
//        if tableView == tableView1 {
//            let delete = UIContextualAction(style: .destructive, title: "Удалить") { (action, sourceView, completion)  in
//                self.array.remove(at: indexPath.row)
//                tableView.deleteRows(at: [indexPath], with: .fade)
//                //print("delete")
//                completion(true)
//            }
//            
//            let edit = UIContextualAction(style: .normal, title: "Изменить") { (action, sourceView, completion)  in
//                //print("edit")
//                completion(true)
//            }
//            edit.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
//            
//            let swipeActions = UISwipeActionsConfiguration(actions: [delete,edit])
//
//            return swipeActions
//        } else if tableView == tableView2 {
            let delete = UIContextualAction(style: .destructive, title: "Удалить") { (action, sourceView, completion)  in
                self.array2.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                //print("delete")
                completion(true)
            }
            
            let edit = UIContextualAction(style: .normal, title: "Изменить") { (action, sourceView, completion)  in
                //print("edit")
                completion(true)
            }
            edit.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
            
            let swipeActions = UISwipeActionsConfiguration(actions: [delete,edit])

            return swipeActions
//        }
//        
//        return UISwipeActionsConfiguration()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let index = NSIndexPath(row: textField.tag, section: 0)
        var cell = CustomTableViewCell()
        
//        if (tableView1.cellForRow(at: index as IndexPath) != nil) {
//            cell = tableView1.cellForRow(at: index as IndexPath)! as! CustomTableViewCell
//                if textField == cell.TFLength {
//                    array[textField.tag].lenField = Double(textField.text!) ?? 0.0
//                    } else if textField == cell.TFCtn {
//                        array[textField.tag].ctnField = Int(textField.text!) ?? 0
//                    }
//        }
        
        if (tableView2.cellForRow(at: index as IndexPath) != nil) {
            cell = tableView2.cellForRow(at: index as IndexPath)! as! CustomTableViewCell
            if textField == cell.TFLength {
                array2[textField.tag].lenField = Int(textField.text!) ?? 0
            } else if textField == cell.TFCtn {
                array2[textField.tag].ctnField = Int(textField.text!) ?? 0
            } 
//            else if textField == cell.TFWidth {
//                array2[textField.tag].widthField = Double(textField.text!) ?? 0
//            }
        }
        
        //print(array)
        //print(array2)
    }

}



