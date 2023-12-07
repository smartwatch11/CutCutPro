//
//  ShowResultViewController.swift
//  CutCut
//
//  Created by Egor Rybin on 07.12.2023.
//

import UIKit
// new new
class ShowResultViewController: UIViewController {
    
    var resStr: String?
    var max: Int?
    var blade: Int?
    var resArr: [String] = []
    
    @IBOutlet weak var showView: UIView!
    @IBOutlet weak var ctnOfSourceLen: UILabel!
    @IBOutlet weak var effectiveSqr: UILabel!
    @IBOutlet weak var restLabel: UILabel!
    
    override func viewDidLoad() {

        resArr = (resStr?.dropFirst(2).dropLast(2).components(separatedBy: "],["))!
        
        var sumOfRetain = 0
        var arrSub = [UIScrollView]()
        
        for i in stride(from: 0, through: resArr.count-1, by: 1) {
            let rowArr = resArr[i].components(separatedBy: ",")
            
            var subArr: [UIView] = []
            
            if i == 0 {
                arrSub.append(createScroll(conView: restLabel))
            } else {
                arrSub.append(createScroll(conView: arrSub[i-1]))
            }
            
            var sum = 0
            var retain = 0
            for num in rowArr {
                subArr.append(createCutBlock(CGColor(red: 0, green: 255, blue: 0, alpha: 1), text: num))
                sum += Int(num)!
            }
            retain = max! - sum - blade! * rowArr.count
            sumOfRetain += retain
            subArr.append(createCutBlock(CGColor(red: 255, green: 0, blue: 0, alpha: 1), text: String(retain)))
            createStackView(arrView: subArr, scrollView: arrSub[i])
        }
        
        ctnOfSourceLen.text = "Количество заготовок: \(max!) (x\(resArr.count))"
        let dblSqr: Double = (Double(max! * resArr.count - sumOfRetain) / Double(max! * resArr.count)) * 100
        effectiveSqr.text = "Полезная площадь: \(abs(round(100 * dblSqr) / 100))%"
        restLabel.text = "Остаток: \(round(Double((100 * sumOfRetain) / 100)))"
    }
    
    func createCutBlock(_ color: CGColor, text: String) -> UIView{
        let numView = UIView()
        numView.layer.borderColor = color
        numView.layer.borderWidth = 2
        numView.layer.cornerRadius = 10
        numView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = text
        label.textColor = UIColor(cgColor: color)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.shadowColor = #colorLiteral(red: 0.03174399957, green: 0.1400282681, blue: 0.2298499942, alpha: 0.5)
        label.shadowOffset = CGSize(width: -1, height: -1)
        
        numView.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: numView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: numView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            //numView.topAnchor.constraint(equalTo: self.restLabel.bottomAnchor, constant: 30),
            //numView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            //numView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            //numView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 40),
            numView.heightAnchor.constraint(equalToConstant: 40),
            numView.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        return numView
    }
    
    func createStackView(arrView: [UIView], scrollView: UIView) {
        let stack = UIStackView(arrangedSubviews: arrView)
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1),
            stack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 35),
            stack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -35),
            stack.heightAnchor.constraint(equalToConstant: 40),
            //stack.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func createScroll(conView: UIView) -> UIScrollView{
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scroll)
        
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: conView.bottomAnchor, constant: 30),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            scroll.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        return scroll
    }
    
    @IBAction func closePresentedView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
