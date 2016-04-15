//
//  MapViewTableViewCell.swift
//  journayDemo
//
//  Created by Wang Weihan on 4/6/16.
//  Copyright © 2016 Wang Weihan. All rights reserved.
//

import UIKit
import MapKit

class MapViewTableViewCell: UITableViewCell, MKMapViewDelegate {
    
    @IBOutlet weak var photosCollectionView: UICollectionView!
    @IBOutlet weak var MapViewInPro: MKMapView!

    override func awakeFromNib() {
        super.awakeFromNib()
        zoomToRegion()
        
        let annotations = getMapAnnotations()
        
        // Add mappoints to Map
        MapViewInPro.addAnnotations(annotations)
        
        MapViewInPro.delegate = self
        
        // Connect all the mappoints using Poly line.
        
        var points: [CLLocationCoordinate2D] = [CLLocationCoordinate2D]()
        
        for annotation in annotations {
            points.append(annotation.coordinate)
        }
        
        
        let polyline = MKPolyline(coordinates: &points, count: points.count)
        
        MapViewInPro.addOverlay(polyline)
        
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func zoomToRegion() {
        
        let location = CLLocationCoordinate2D(latitude: 44.134933, longitude: 9.684851)
        
        let region = MKCoordinateRegionMakeWithDistance(location, 5000.0, 7000.0)
        
       MapViewInPro.setRegion(region, animated: true)
    }
    
    //MARK:- Annotations
    
    func getMapAnnotations() -> [Station] {
        var annotations:Array = [Station]()
        
        //load plist file
        
        var stations: NSArray?
        if let path = NSBundle.mainBundle().pathForResource("stations", ofType: "plist") {
            stations = NSArray(contentsOfFile: path)
        }
        if let items = stations {
            for item in items {
                let lat = item.valueForKey("lat") as! Double
                let long = item.valueForKey("long")as! Double
                let annotation = Station(latitude: lat, longitude: long)
                annotation.title = item.valueForKey("title") as? String
                annotations.append(annotation)
            }
        }
        
        return annotations
    }
    
    //MARK:- MapViewDelegate methods
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let polylineRenderer = MKPolylineRenderer(overlay: overlay)
        
        if overlay is MKPolyline {
            polylineRenderer.strokeColor = UIColor.redColor()
            polylineRenderer.lineWidth = 2
            
        }
        return polylineRenderer
    }

}
