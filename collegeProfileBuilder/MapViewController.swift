//
//  MapViewController.swift
//  collegeProfileBuilder
//
//  Created by omenconi on 3/7/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UISearchBarDelegate
{
    @IBOutlet weak var myMapView: MKMapView!
    
    var searchController: UISearchController! //manages presentation of search bar
    var annotation: MKAnnotation! //creates an annotation
    var localSearchRequest: MKLocalSearchRequest! //requests search for POI address
    var localSearch: MKLocalSearch! //initates the search
    var localSearchResponse: MKLocalSearchResponse! //stores search result
    var pointAnnotation: MKPointAnnotation! //puts pins on screen
    var pinAnnotationView: MKPinAnnotationView! //allows you to view pin on screen

    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    @IBAction func showSearchBar(_ sender: Any)
    {
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        //step 1: once keyboard search button is clicked, app will dismiss search controller and then the map will look for any previous annotation pins and remove them
        searchBar.resignFirstResponder() //takes away keyboard
        dismiss(animated: true, completion: nil)
        if myMapView.annotations.count != 0
        {
            annotation = myMapView.annotations[0]
            myMapView.removeAnnotation(annotation) //clears out any previous pin annotations
        }
        
        //step 2: search process will be initiated, turning search bar text into natural language quiery that will figure out points of interest for you
        
        localSearchRequest = MKLocalSearchRequest()
        localSearchRequest.naturalLanguageQuery = searchBar.text
        localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.start                              //error checks so that app doesn't crash when searching
            {
                (localSearchResponse, error) in
                if localSearchResponse == nil
                {
                    let alertController = UIAlertController(title: "place not found", message: "nil", preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "dismiss", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                    return
                }
                
                
                //step 3: if search returns a valid coordinate then the app will put it on the map
                self.pointAnnotation = MKPointAnnotation()
                self.pointAnnotation.title = searchBar.text
                self.pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude: localSearchResponse!.boundingRegion.center.longitude)
                
                self.pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation, reuseIdentifier: nil)
                self.myMapView.centerCoordinate = self.pointAnnotation.coordinate
                self.myMapView.addAnnotation(self.pinAnnotationView.annotation!)
                
               }
          }
    
    func centerMap(location: CLLocationCoordinate2D)
    {
        let mySpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let myRegion = MKCoordinateRegion(center: location, span: mySpan)
        myMapView.setRegion(myRegion, animated: true)
    }
}
