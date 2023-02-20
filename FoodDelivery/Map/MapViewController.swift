import UIKit
import MapKit

class MapViewController: UIViewController {
    
    private lazy var mapView = MKMapView()
    
    private var buttonBack = UIButton()
    
    private let imageBack = UIImage(systemName: "chevron.backward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25))
    
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        createButtonImage(button: buttonBack,
                          image: imageBack!,
                          tintColor: .black)
        buttonBack.addTarget(self, action: #selector(pressedButtonBack), for: .touchUpInside)
        setupView()
        setupConstraint()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationEnabled()
    }
    
    func setupView() {
        
        view.addSubview(mapView)
        mapView.addSubview(buttonBack)
        
    }
    
    func createButtonImage(button: UIButton,
                           image: UIImage,
                           tintColor: UIColor) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.tintColor = tintColor
    }
    
    func setupConstraint() {
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mapView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        buttonBack.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        buttonBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        buttonBack.widthAnchor.constraint(equalToConstant: 25).isActive = true
        buttonBack.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    func createLocationManager(locationMan: CLLocationManager) {
        locationMan.delegate = self
        locationMan.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkAutorization() {
        
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            break
        case .denied:
            showAlertLocation(title: "Fail",
                              message: "Allow access to your location",
                              preferredStyle: .alert,
                              customUrl: URL(string: UIApplication.openSettingsURLString))
            break
        case .restricted:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        @unknown default:
            fatalError()
        }
        
    }
    
    func showAlertLocation(title: String,
                           message: String?,
                           preferredStyle: UIAlertController.Style,
                           customUrl: URL?) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: preferredStyle)
        let settingAction = UIAlertAction(title: "Setting",
                                          style: .default) { (alert) in
            if let url = customUrl {
                UIApplication.shared.open(url)
            }
        }
        let cancelAction = UIAlertAction(title: "Back",
                                         style: .cancel)
        alert.addAction(settingAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    func checkLocationEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            
            createLocationManager(locationMan: locationManager)
            checkAutorization()
        } else {
            showAlertLocation(title: "Fail",
                              message: "Turn on the location service",
                              preferredStyle: .alert,
                              customUrl: URL(string: "App-Prefs:root=LOCATION_SERVICES"))
        }
    }
    
    func dismissView() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .fade
        transition.subtype = .fromBottom
        self.view.window?.layer.add(transition, forKey: kCATransition)
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc func pressedButtonBack() {
        
        tabBarController?.tabBar.isHidden = false
        dismissView()
        
    }
}
extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate {
            let region = MKCoordinateRegion(center: location,
                                            latitudinalMeters: 5000,
                                            longitudinalMeters: 5000)
            mapView.setRegion(region, animated: true)
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkAutorization()
    }
    
}
