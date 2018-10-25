//
//  ViewController.swift
//  JYWeexPro
//
//  Created by Baird-weng on 2018/10/22.
//  Copyright © 2018 JY. All rights reserved.
//

import UIKit
import SnapKit
class ViewController:
    JYWeexBaseViewController,
    MAMapViewDelegate,
    AMapLocationManagerDelegate,
AMapSearchDelegate{
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var gobtn: UIButton!
    var locationManager:AMapLocationManager!
    var search:AMapSearchAPI!
    var currentLocation:CLLocation?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let mapView = MAMapView()
        mapView.delegate = self
        self.view.addSubview(mapView);
        mapView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        
        
        /// 搜索呀。
        search = AMapSearchAPI()
        search.delegate = self
        
        
        self.view.addSubview(textField)
        self.view.addSubview(gobtn)
        
        self.locationMap()
        
    }
    func onPOISearchDone(_ request: AMapPOISearchBaseRequest!, response: AMapPOISearchResponse!) {
        
        for item in response.pois{
            print(item.address)
        }
    }
    
    @IBAction func clickOntheGo(_ sender: Any) {
        
        let request = AMapPOIKeywordsSearchRequest()
        request.keywords = self.textField.text
        request.requireExtension = true
        let lat = self.currentLocation?.coordinate.latitude
        let long = self.currentLocation?.coordinate.longitude
        
        if(lat != nil&&long != nil){
            request.location = AMapGeoPoint.location(withLatitude: CGFloat(lat!), longitude: CGFloat(long!))
        }
        request.cityLimit = true
        request.requireSubPOIs = true
        search.aMapPOIKeywordsSearch(request)
        
    }
    func locationMap(){
        locationManager = AMapLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.locationTimeout = 2
        locationManager.reGeocodeTimeout = 2
        locationManager.requestLocation(withReGeocode: false) { [weak self] (location, geocode, error) in
            self?.currentLocation = location
            print("location=================================",location!)
        }
    }
}

