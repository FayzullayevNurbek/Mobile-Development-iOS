//
//  ViewController.swift
//  GuessFlag
//
//  Created by Fayzullayev Nurbek on 29/06/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    var countries=[String]()
    var score=0
    var correctAnswer=0
    var answer=0
    override func viewDidLoad() {
        super.viewDidLoad()
        countries+=["Uzb","US","Brasil","Argentina","Canada","Japan","Jamaica","Afghanistan",
        "Belgium", "India","France"]
        button1.layer.borderWidth=0
        button2.layer.borderWidth=0
        button3.layer.borderWidth=0
        
        button1.layer.borderColor=UIColor.lightGray.cgColor
        button2.layer.borderColor=UIColor.lightGray.cgColor
       button3.layer.borderColor=UIColor.lightGray.cgColor
        asqQuestion()
       // self.navigationItem.titleView=setTitle(title: title!, subtitle: "Your score is \(score)")

    }
    
    func setTitle(title:String, subtitle:String) -> UIView {
        let titleLabel = UILabel(frame: CGRect(x:0,y: -2,width: 0,height: 0))

        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.gray
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.text = title
        titleLabel.sizeToFit()

        let subtitleLabel = UILabel(frame: CGRect(x: 0, y: 18, width: 0, height: 0))
        subtitleLabel.backgroundColor = UIColor.clear
        subtitleLabel.textColor = UIColor.black
        subtitleLabel.font = UIFont.systemFont(ofSize: 12)
        subtitleLabel.text = subtitle
        subtitleLabel.sizeToFit()

        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), height: 30))
        titleView.addSubview(titleLabel)
        titleView.addSubview(subtitleLabel)

        let widthDiff = subtitleLabel.frame.size.width - titleLabel.frame.size.width

        if widthDiff < 0 {
            let newX = widthDiff / 2
            subtitleLabel.frame.origin.x = abs(newX)
        } else {
            let newX = widthDiff / 2
            titleLabel.frame.origin.x = newX
        }

        return titleView
    }
    
    func asqQuestion(action:UIAlertAction!=nil)
    {
        countries.shuffle()
        correctAnswer=Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        title=countries[correctAnswer].capitalized
        self.navigationItem.titleView=setTitle(title: title!, subtitle: "Your score is \(score) and \(answer) answered")
        
    }
    
    @IBAction func buttonTap(_ sender: UIButton) {
        var title:String
        if sender.tag==correctAnswer{
            title="Correct"
            score+=1
            answer+=1
        }else{
        title="Wrong"
            let wrongInfo=UIAlertController(title: title, message: "You choose incorrect answer", preferredStyle: .alert)
            wrongInfo.addAction(UIAlertAction(title: "choose other", style: .default, handler: asqQuestion(action:)))
            score-=1
            answer+=1
            present(wrongInfo, animated: true)
        }
        let info=UIAlertController(title: title, message: "your score is \(score)", preferredStyle: .alert)
        info.addAction(UIAlertAction(title: "Continue", style: .default, handler: asqQuestion(action:)))
        
        
        
        
        let finalInfo=UIAlertController(title: "Final Alert", message: "your answer is \(answer)", preferredStyle: .alert)
        finalInfo.addAction(UIAlertAction(title: "Continue", style: .default, handler: asqQuestion(action:)))
        if answer>=10{
            present(finalInfo, animated: true)
            
        }
        present(info, animated: true)
        

    }
}
