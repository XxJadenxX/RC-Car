//
//  ViewController.swift
//  Phidget_Robot_UpAndDown
//
//  Created by Jaden Luzon on 2018-11-19.
//  Copyright © 2018 Phidgets. All rights reserved.
//

import UIKit
import Phidget22Swift

class ViewController: UIViewController {
   /*--------------------------------------------------------------------------*/
    func VoltageRatioInputChangex_handler(sender: VoltageRatioInput, VoltageRatio:Double){ /* up and down */
        do{
            if(VoltageRatio > 0.5){
                try motorright.setAcceleration(100)
                try motorleft.setAcceleration(100)
                try motorleft.setTargetVelocity(1.0)
                try motorright.setTargetVelocity(1.0)
            }
            else if(VoltageRatio < -0.5){
                try motorright.setAcceleration(100)
                try motorleft.setAcceleration(100)
                try motorleft.setTargetVelocity(-1.0)
                try motorright.setTargetVelocity(-1.0)
            }
            else if(VoltageRatio < 0.5 || VoltageRatio > -0.5){
                try motorleft.setTargetVelocity(0)
                try motorright.setTargetVelocity(0)
            }
            
        } catch let err as PhidgetError {
            print("Phidget Error " + err.description)
        } catch {
        }
    }
    func VoltageRatioInputChangey_Handler(sender: VoltageRatioInput, VoltageRatio1: Double){ /* left and rights */
        do{

            if(VoltageRatio1 > 0.5){
                try motorright.setAcceleration(100)
                try motorleft.setAcceleration(100)
                try motorleft.setTargetVelocity(1.0)
                try motorright.setTargetVelocity(-1.0)
            }
            else if(VoltageRatio1 < -0.5){
                try motorright.setAcceleration(100)
                try motorleft.setAcceleration(100)
                try motorleft.setTargetVelocity(-1.0)
                try motorright.setTargetVelocity(1.0)
            }
            else if(VoltageRatio1 < 0.5 || VoltageRatio1 > -0.5){
                try motorleft.setTargetVelocity(0)
                try motorright.setTargetVelocity(0)
            }
            
        } catch let err as PhidgetError {
            print("Phidget Error " + err.description)
        } catch {
            //catch other errors here
        }
    }
    
    /*--------------------------------------------------------------------------*/
    
    /*--------------------------------------------------------------------------*/
    let motorleft = DCMotor()
    let motorright = DCMotor()
    let Xaxis = VoltageRatioInput()
    let Yaxis = VoltageRatioInput()
    let PushDownInput = DigitalInput()
    let Sonar0 = DistanceSensor()
    
    /*--------------------------------------------------------------------------*/
   
    /*--------------------------------------------------------------------------*/
    
    
    func motorLeft(){
        do{
            
            try motorright.setAcceleration(100)
            try motorleft.setAcceleration(100)
            
            try motorleft.setTargetVelocity(1.0)
            try motorright.setTargetVelocity(-1.0)
            
        } catch let err as PhidgetError {
            print("Phidget Error " + err.description)
        } catch {
            //catch other errors here
        }
    }
    
    func motorRight(){
        do{
            try motorright.setAcceleration(100)
            try motorleft.setAcceleration(100)
            
            try motorleft.setTargetVelocity(1.0)
            try motorright.setTargetVelocity(-1.0)
        } catch let err as PhidgetError {
            print("Phidget Error " + err.description)
        } catch {
            //catch other errors here
        }
    }

    /*--------------------------------------------------------------------------*/
    
    /*--------------------------------------------------------------------------*/
    func motormove(){
        do{
            try motorleft.setTargetVelocity(1.0)
            try motorright.setTargetVelocity(1.0)
            sleep(1)
            
            
        }
        catch let err as PhidgetError {
            print("Phidget Error " + err.description)
        } catch {
            //catch other errors here
        }
    }
    
    func motorstop(){
        do{
            try motorleft.setTargetVelocity(0)
            try motorright.setTargetVelocity(0)
            sleep(1)
        }
        catch let err as PhidgetError {
            print("Phidget Error " + err.description)
        } catch {
            //catch other errors here
        }
    }
    /*--------------------------------------------------------------------------*/
 
    func distanceChange_handler(sender: DistanceSensor, distance:UInt32){
        do{
            print(distance, "\n")
            let senser = sender
            _ = try senser.getDeviceSerialNumber()
            if(distance <= 100){
                
                try Yaxis.close()
                try Xaxis.close()
                try motorright.setAcceleration(100)
                try motorleft.setAcceleration(100)
                try motorright.setTargetVelocity(-1.0)
                try motorleft.setTargetVelocity(-1.0)
                
                //try motorleft.close()
                //try motorright.close()
            }
            else if(distance >= 100) {
                //try motorleft.open()
                //try motorright.open()
                try Yaxis.open()
                try Xaxis.open()
            }
            else if(distance <= 1){
                try motorright.setAcceleration(100)
                try motorleft.setAcceleration(100)
                try motorright.setTargetVelocity(-1.0)
                try motorleft.setTargetVelocity(-1.0)
            }
            else if(distance >= 1){
                try Yaxis.open()
                try Xaxis.open()
                try motorright.setAcceleration(100)
                try motorleft.setAcceleration(100)
                try motorright.setTargetVelocity(-1.0)
                try motorleft.setTargetVelocity(-1.0)
            }

           
        }
        catch let err as PhidgetError {
            print("Phidget Error " + err.description)
        } catch {
        }
    }
    

    func attach_handler2(sender: Phidget){
        do{
            let hubPort2 = try sender.getHubPort()
            
            if(hubPort2 == 0){
                print("chicken")
            }
            
        } catch let err as PhidgetError {
            print("Phidget Error " + err.description)
        } catch {
        }
    }
    
    func attach_handler(sender: Phidget){
        do{
            let hubPort = try sender.getHubPort()
            
            if(hubPort == 5){
                print("motor left Attached")
            }
            else if (hubPort == 0){
                print("motor right Attached")
            }
            else if (hubPort == 1){
                print("Sonar atached")
            }
            else if (hubPort == 3){
                print("Joysticked Attached")
                try Xaxis.setDataInterval(0)
            }

            
        } catch let err as PhidgetError {
            print("Phidget Error " + err.description)
        } catch {
            //catch other errors here
        }
    }
    
    /*--------------------------------------------------------------------------*/
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            try Net.addServer(serverName: "phidgetsbc", address: "192.168.99.1", port: 5661, password: "", flags: 0);
            try Net.enableServerDiscovery(serverType: .deviceRemote)
            
            try motorleft.setDeviceSerialNumber(512834)
            try motorleft.setHubPort(5)
            try motorleft.setIsHubPortDevice(false)
            
            try motorright.setDeviceSerialNumber(512834)
            try motorright.setHubPort(0)
            try motorright.setIsHubPortDevice(false)
        
            try Xaxis.setDeviceSerialNumber(528029)
            try Xaxis.setHubPort(0)
            try Xaxis.setIsHubPortDevice(false)
            try Xaxis.setChannel(0)
            
            try Yaxis.setDeviceSerialNumber(528029)
            try Yaxis.setHubPort(0)
            try Yaxis.setIsHubPortDevice(false)
            try Yaxis.setChannel(1)
            
            try Sonar0.setDeviceSerialNumber(512834)
            try Sonar0.setHubPort(1)
            try Sonar0.setIsHubPortDevice(false)
            
            
            let _ = motorleft.attach.addHandler(attach_handler)
            let _ = motorright.attach.addHandler(attach_handler)
            let _ = PushDownInput.attach.addHandler(attach_handler)
            let _ = Xaxis.attach.addHandler(attach_handler2)
            let _ = Yaxis.attach.addHandler(attach_handler2)
            let _ = Sonar0.attach.addHandler(attach_handler)
            
            let _ = Xaxis.voltageRatioChange.addHandler(VoltageRatioInputChangex_handler)
            let _ = Yaxis.voltageRatioChange.addHandler(VoltageRatioInputChangey_Handler)
            let _ = Sonar0.distanceChange.addHandler(distanceChange_handler)
            

            
            try motorleft.open()
            try motorright.open()
            try Xaxis.open()
            try Yaxis.open()
            try PushDownInput.open()
            try Sonar0.open()

        } catch let err as PhidgetError {
            print("Phidget Error " + err.description)
        } catch {
            //catch other errors here
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    /*--------------------------------------------------------------------------*/
    @IBAction func move(_ sender: Any) {
        motorstop()
    }
    @IBAction func stop(_ sender: Any) {
        motormove()
    }
    /*--------------------------------------------------------------------------*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

