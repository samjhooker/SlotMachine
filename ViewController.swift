//
//  ViewController.swift
//  SlotMachine
//
//  Created by Samuel Hooker on 17/11/14.
//  Copyright (c) 2014 Jocus Interactive. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var forthContainer: UIView!
    
    var titleLabel:UILabel!
    
    let kMarginForView:CGFloat = 10.0 //cgfloats are doubles or floats (for 32 and 64 bit systems) // k is for constant
    let kMarginForSlot:CGFloat = 2.0
    let kSixth:CGFloat = 1.0/6.0      // literally one sixth
    
    let kNumberOfContainers = 3
    let kNumberOfSlots = 3       //these will be used for creating a 3x3 grid
    let kThird:CGFloat = 1.0/3.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.SetUpContainerViews()
        setUpFirstContainer(firstContainer)
        setUpSecondImageView(secondContainer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func SetUpContainerViews(){
        self.firstContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: self.view.bounds.origin.y, width: self.view.bounds.width - (kMarginForView*2), height: self.view.bounds.height * kSixth))
        // creates a view with a frame. finds x and y origin and then sets up a height and width of the frame. height only come down a sixth of the screen
        self.firstContainer.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.firstContainer) //draws this 1/6 red box ontop of the default view
        
        
        self.secondContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: firstContainer.frame.height, width: self.view.bounds.width - (kMarginForView*2), height: self.view.bounds.height * (3*kSixth)))
        // seconds subview; x has margin of 10, y starts when the firstContainer finishes, width is screenwidth negative the margins and height is 3/6 of the screen
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.secondContainer)
        
        self.thirdContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: (firstContainer.frame.height + secondContainer.frame.height), width: self.view.bounds.width - kMarginForView*2, height: self.view.bounds.height * kSixth))
        // another subview, it starts under the two previous views therefore y = height of the two other views
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(thirdContainer)
        
        self.forthContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: (firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height), width: self.view.bounds.width - (kMarginForView*2), height: self.view.bounds.height * kSixth))
        self.forthContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(forthContainer)
    }
    
    
    func setUpFirstContainer(containerView: UIView){
        self.titleLabel = UILabel()
        self.titleLabel.text = "Problem Gambling"
        self.titleLabel.textColor = UIColor.yellowColor()
        self.titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        self.titleLabel.sizeToFit() //automatically stretches width and height to fit font
        self.titleLabel.center = containerView.center //centered bsed upon superviews center
        containerView.addSubview(self.titleLabel)
    }
    
    func setUpSecondImageView(containerView: UIView){
        for var containerNumber = 0; containerNumber < kNumberOfContainers; containerNumber++ { //for each column
            for var slotNumber = 0; slotNumber < kNumberOfSlots; slotNumber++ {                //for each row
                
                var slotImageView = UIImageView()
                slotImageView.backgroundColor = UIColor.yellowColor()
                
                slotImageView.frame = CGRect(x: containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * kThird), y: containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * kThird), width: containerView.bounds.width * kThird - kMarginForSlot, height: containerView.bounds.height * kThird - kMarginForSlot)
                
                containerView.addSubview(slotImageView)
                
            }
        }
    }


}

