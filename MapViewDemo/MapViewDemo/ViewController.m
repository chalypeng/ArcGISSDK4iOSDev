//
//  ViewController.m
//  MapViewDemo
//

#import "ViewController.h"
#import <ArcGIS/ArcGIS.h>

@interface ViewController ()<AGSMapViewLayerDelegate>

@property (weak, nonatomic) IBOutlet AGSMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // set the delegate for the map view
    self.mapView.layerDelegate = self;
    
    //create an instance of a tiled map service layer
    AGSTiledMapServiceLayer *tiledLayer = [[AGSTiledMapServiceLayer alloc] initWithURL:[NSURL URLWithString:@"http://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer"]];
    
    //Add it to the map view
    [self.mapView addMapLayer:tiledLayer withName:@"Tiled Layer"];

}

#pragma mark AGSMapViewLayerDelegate methods

-(void) mapViewDidLoad:(AGSMapView*)mapView {
    
    // Enable location display on the map
    [self.mapView.locationDisplay startDataSource];
    self.mapView.locationDisplay.autoPanMode = AGSLocationDisplayAutoPanModeDefault;
    
   
}


@end
