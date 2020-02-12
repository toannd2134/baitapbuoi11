//
//  ViewController.swift
//  ballFalling2
//
//  Created by Toan on 2/12/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var time :Timer!
    var x  : Int = Int.random(in: 10...30)
    var y :Int = Int.random(in: 10...30)
    @IBOutlet weak var ball: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    setup()
        x = Int.random(in: 10...30)
               y = Int.random(in: 5...15)
         
        time = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(RunXuong), userInfo: nil, repeats: true)
        
    }
    func setup(){
        ball.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        ball.contentMode = .scaleAspectFit
    
    }
    @objc func RunXuong(){
        ball.frame.origin.y += CGFloat(x)
        ball.frame.origin.x += CGFloat(y)
        ball.transform = ball.transform.rotated(by: CGFloat(Float.pi/2))
        if ball.frame.origin.x > view.frame.maxX-ball.frame.height{
            time.invalidate()
            time = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(RunPhai), userInfo: nil, repeats: true)
        }
        if ball.frame.origin.y > view.frame.maxY-ball.frame.height{
            time.invalidate()
            time = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(Runtrai), userInfo: nil, repeats: true)
        }
        
}
    @objc func RunPhai(){
        ball.frame.origin.x -= CGFloat(x)
        ball.frame.origin.y += CGFloat(y)
         ball.transform = ball.transform.rotated(by: CGFloat(Float.pi/2))
        
        if ball.frame.origin.y >  view.frame.maxY-ball.frame.height{
            time.invalidate()
            time = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(Runlen), userInfo: nil, repeats: true)
        }
        if ball.frame.origin.x < view.frame.minX{
            time.invalidate()
            time = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(RunXuong), userInfo: nil, repeats: true)
        }
    }
    @objc func Runlen(){
        ball.frame.origin.x -= CGFloat(x)
        ball.frame.origin.y -= CGFloat(y)
         ball.transform = ball.transform.rotated(by: CGFloat(Float.pi/2))
        if ball.frame.origin.x < view.frame.minX{
            time.invalidate()
            time = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(Runtrai), userInfo: nil, repeats: true)
            
        }
        if  ball.frame.origin.y < view.frame.minY{
            time.invalidate()
            time = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(RunPhai), userInfo: nil, repeats: true)
        }
        
    }
    @objc func Runtrai(){
        ball.frame.origin.x += CGFloat(x)
        ball.frame.origin.y -= CGFloat(y)
         ball.transform = ball.transform.rotated(by: CGFloat(Float.pi/2))
        if ball.frame.origin.x  + ball.frame.width  >  view.frame.maxX {
            time.invalidate()
            time = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(Runlen), userInfo: nil, repeats: true)
       }
        if ball.frame.origin.y < view.frame.minY{
            time.invalidate()
            time = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(RunXuong), userInfo: nil, repeats: true)
        }
    }
    
}


