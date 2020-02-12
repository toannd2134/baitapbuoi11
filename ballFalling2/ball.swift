//
//  ball.swift
//  ballFalling2
//
//  Created by Toan on 2/12/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit

class ball: UIViewController {
    var time : Timer!
    var solan : Int = 1
    @IBOutlet weak var ball: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ball.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        time = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(RunXuong), userInfo: nil, repeats: true)
        
    }
    @objc func RunXuong(){
        ball.frame.origin.y += 2
        if ball.frame.origin.y+ball.frame.height > view.frame.maxY/4 && ball.frame.origin.x==view.frame.minX{
            time.invalidate()
            solan += 1
           
            time = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(RunPhai), userInfo: nil, repeats: true)
            
            
        }
        if ball.frame.origin.y+ball.frame.height > view.frame.maxY/4 * CGFloat(solan) && ball.frame.origin.x==view.frame.maxX{
        time.invalidate()
        
        time = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(RunTrai), userInfo: nil, repeats: true)
               }
        
    }
    @objc func RunLen(){
        ball.frame.origin.y -= 2
        
       }
    @objc func RunTrai(){
        
        ball.frame.origin.x -= 2
    }
    @objc func RunPhai(){
        ball.frame.origin.x += 2
        
        if ball.frame.origin.x > view.frame.maxX-ball.frame.height{
            
        time.invalidate()
        time = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(RunXuong), userInfo: nil, repeats: true)
            
        }
        
    }
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
