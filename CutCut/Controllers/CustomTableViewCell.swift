//
//  CustomTableViewCell.swift
//  CutCut
//
//  Created by Egor Rybin on 28.10.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
  
    //@IBOutlet weak var TFWidth: UITextField!
    @IBOutlet weak var TFCtn: UITextField!
    @IBOutlet weak var TFLength: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func SaveLen(_ sender: UITextField) {
        self.TFLength.text = sender.text
        //print(self.TFLength.text!)
    }
    
    @IBAction func SaveCtn(_ sender: UITextField) {
        self.TFCtn.text = sender.text
        //print(self.TFCtn.text!)
    }
//    @IBAction func saveWidth(_ sender: UITextField) {
//        self.TFWidth.text = sender.text
//    }
    
}
