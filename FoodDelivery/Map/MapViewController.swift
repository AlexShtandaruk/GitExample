import UIKit
import MapKit

class MapViewController: UIViewController {
    
    private lazy var mapView = MKMapView()
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupConstraint()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationEnabled()
    }
    
    func setupView() {
        
        view.addSubview(mapView)
        
    }
    
    func setupConstraint() {
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mapView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    func createLocationManager(locationMan: CLLocationManager) {
        locationMan.delegate = self
        locationMan.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            
            createLocationManager(locationMan: locationManager)
            
        } else {
            
            let alert = UIAlertController(title: "Fail",
                                          message: "Turn on the location service",
                                          preferredStyle: .alert)
            
            let settingAction = UIAlertAction(title: "Setting", style: .default) { (alert) in
                if let url = URL(string: "App-Prefs:root=LOCATION_SERVICES") {
                    UIApplication.shared.open(url)
                }
            }
            
            let cancelAction = UIAlertAction(title: "Back", style: .cancel)
            
            alert.addAction(settingAction)
            alert.addAction(cancelAction)
            
            present(alert, animated: true)
        }
    }
}
extension MapViewController: CLLocationManagerDelegate {
    
    
}
