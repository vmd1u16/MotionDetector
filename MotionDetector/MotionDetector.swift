//
//  MotionDetector.swift
//  RunningStairs
//
//  Created by Vlad on 07/05/2018.
//  Copyright © 2018 Vlad. All rights reserved.
//

import Foundation
import CoreMotion


// protocol for running stairs activity
public protocol RunningStairsProtocol {
    func updateActivityType(activityType : String)
    func updatePace(pace : Double)
    func updateAveragePace(pace : Double)
    func updateAltitude(altitude : Double)
    func updateFloors(floors : Int)
}


// protocol for bicep curl counter activity
public protocol BicepCurlProtocol {
    
}

// protocol for star jumps counter activity
public protocol StarJumpsProtocol {
    
}

// protocol for inside-outside pocket activity
public protocol InsideOutsidePocketProtocol {
    
}

public class MotionDetector {
   
    private let activityManager = CMMotionActivityManager()
    private let altimeter = CMAltimeter()
    private let pedometer = CMPedometer()

    
   public var runningStairsDelegate : RunningStairsProtocol!
   public var bicepCurlDelegate : BicepCurlProtocol!
   public var starJumpsDelegate : StarJumpsProtocol!
   public var insideOutsidePocketDelegate : InsideOutsidePocketProtocol!
    
    
   public init() {
        
    }
    
    // start and stop methods for running stairs activity
    
    public func startRunningStairsActivity() {
        if CMMotionActivityManager.isActivityAvailable() {
            startTrackingActivityType()
        }
        
        if CMPedometer.isStepCountingAvailable() {
            startCountingSteps()
        }
        
        if CMAltimeter.isRelativeAltitudeAvailable() {
            startTrackingAltitude()
        }
        
    }
    
    public func stopRunningStairsActivity() {
        activityManager.stopActivityUpdates()
        pedometer.stopEventUpdates()
        pedometer.stopUpdates()
        altimeter.stopRelativeAltitudeUpdates()
        
    }
    
     // start and stop methods for bicep curl counter activity
    
    public func startBicepCurlActivity() {
        
    }
    
    public func stopBicepCurlActivity() {
        
    }
    
    // start and stop methods for star jumps activity
    
    public func startStarJumpsActivity() {
        
    }
    
    public func stopStarJumpsActivity() {
        
    }
   
    // start and stop methods for inside outside pocket activity
    
    public func startInsideOutsidePocketActivity() {
        
    }
    
    public func stopInsideOutsidePocketActivity() {
        
    }
    

    
    private func startTrackingActivityType() {
        activityManager.startActivityUpdates(to: OperationQueue.main) {
            [weak self] (activity: CMMotionActivity?) in
            
            guard let activity = activity else { return }
            DispatchQueue.main.async {
                if activity.walking {
                    self?.runningStairsDelegate.updateActivityType(activityType: "Walking")
                } else if activity.stationary {
                     self?.runningStairsDelegate.updateActivityType(activityType: "Stationary")
                } else if activity.running {
                     self?.runningStairsDelegate.updateActivityType(activityType: "Running")
                } else if activity.automotive {
                    self?.runningStairsDelegate.updateActivityType(activityType: "Automotive")
                }
            }
        }
    }
    
    private func startCountingSteps() {
        pedometer.startUpdates(from: Date()) {
            [weak self] pedometerData, error in
            guard let pedometerData = pedometerData, error == nil else { return }
            
            DispatchQueue.main.async {
            
                if let pace = pedometerData.currentPace as? Double{
                     self?.runningStairsDelegate.updatePace(pace: pace)
                }
               
                if let avgPace = pedometerData.averageActivePace as? Double {
                    self?.runningStairsDelegate.updateAveragePace(pace: avgPace)
                }
                
                var floors = 0 
                
                if let floorsUp = pedometerData.floorsAscended as? Int{
                    floors = floorsUp
                }
                
                if let floorsDown = pedometerData.floorsDescended as? Int{
                    floors = floors + floorsDown
                }
                
                self?.runningStairsDelegate.updateFloors(floors: floors)
            }
        }
    }
    
    private func startTrackingAltitude() {
            altimeter.startRelativeAltitudeUpdates(to: OperationQueue.main, withHandler: {
                [weak self] altitudeData, error in
                guard let altitudeData = altitudeData, error == nil else { return }
                
                guard let altitude = altitudeData.relativeAltitude as? Double else { return }
                
            
                self?.runningStairsDelegate.updateAltitude(altitude: (altitude))
            } )
    }
    
}


