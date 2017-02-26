//
//  PingPongController.swift
//  excore
//
//  Created by Dranes on 2/23/17.
//  Copyright © 2017 Nexogy. All rights reserved.
//

import WatchKit
import Foundation


class PingPongController: WKInterfaceController {

    var scoreTeam1: Int = 0;
    var scoreTeam2: Int = 0;
    var serviceTeam: Int = 1;
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func checkService() {
        if(((self.scoreTeam1 + self.scoreTeam2) % 5) == 0) {
            //vibra cuando cambia de servicio
            if(self.serviceTeam == 1) {
                NSLog("Service Team 2");
                self.serviceTeam = 2;
                self.serviceTeam2.setAlpha(1.0);
                self.serviceTeam1.setAlpha(0.0);
            } else {
                NSLog("Service Team 1");
                self.serviceTeam = 1;
                self.serviceTeam1.setAlpha(1.0);
                self.serviceTeam2.setAlpha(0.0);
            }
            
        }
    }
    
    @IBOutlet var scoreTeam1Button: WKInterfaceButton!

    @IBOutlet var scoreTeam2Button: WKInterfaceButton!
    
    @IBAction func incrementScoreTeam1() {
        self.scoreTeam1 += 1;
        self.scoreTeam1Button.setTitle(String(self.scoreTeam1));
        self.checkService();
    }
    
    @IBAction func incrementScoreTeam2() {
        self.scoreTeam2 += 1;
        self.scoreTeam2Button.setTitle(String(self.scoreTeam2));
        self.checkService();
    }
    @IBAction func fixScoreTeam1() {
        self.scoreTeam1 -= 1;
        self.scoreTeam1Button.setTitle(String(self.scoreTeam1));
        self.checkService();
        
    }
    @IBAction func fixScoreTeam2() {
        self.scoreTeam2 -= 1;
        self.scoreTeam2Button.setTitle(String(self.scoreTeam2));
        self.checkService();
    }
    @IBOutlet var serviceTeam1: WKInterfaceGroup!
    @IBOutlet var serviceTeam2: WKInterfaceGroup!
}
