FSInteractiveMap
================

This fork is used by [WordPress iOS](https://github.com/wordpress-mobile/WordPress-iOS). It required some bugfixes and unfortunately the original project doesn’t appear to be maintained.

---

A charting library to visualize data on a map. It's like <a href="https://developers.google.com/chart/interactive/docs/gallery/geochart">geochart</a> but for iOS!

The idea behind this library is to load a SVG file of a map and display it simply in a view. On top of that you can know when a specific area is clicked.

Please note that the SVG loading is quite simple and doesn't support all the features of the SVG file format. It's just good enough to display most of the maps I found in SVG!

Screenshots
---
<img src="Screenshots/screen00.png" width="320px" />&nbsp;<img src="Screenshots/screen01.png" width="320px" />&nbsp;<img src="Screenshots/screen02.png" width="320px" />

Installing FSInteractiveMap
---

Swift Package Manager:
    
Add the URL of this repo to your project and target the "master" branch

        e.g.: project> project> swift packages> "+" 
        then add https:// .. ${THIS_REPO}.git
        select "master" branch instead of any particular release.

Cocoapods:

Add the contents of the FSInteractiveMap project to your directory or simply add the following line to your Podfile:

    pod "FSInteractiveMap"


How to use
---
FSInteractiveMap is a subclass of UIView so it can be added as regular view. It's basically loading a map from a SVG file. I bundled a few svg maps in the example but you can add any SVG to your project and load it.

```objc
NSDictionary* data = @{	@"asia" : @12,
                        @"australia" : @2,
                        @"north_america" : @5,
                        @"south_america" : @14,
                        @"africa" : @5,
                        @"europe" : @20
                      };
    
FSInteractiveMapView* map = [[FSInteractiveMapView alloc] initWithFrame:self.view.frame];

[map loadMap:@"world-continents-low" withData:data colorAxis:@[[UIColor lightGrayColor], [UIColor darkGrayColor]]];

[map setClickHandler:^(NSString* identifier, CAShapeLayer* layer) {
    self.detailDescriptionLabel.text = [NSString stringWithFormat:@"Continent clicked: %@", identifier];
}];
```

An example of a "clickable" map:

```objc
FSInteractiveMapView* map = [[FSInteractiveMapView alloc] initWithFrame:CGRectMake(16, 96, self.view.frame.size.width - 32, 500)];
[map loadMap:@"usa-low" withColors:nil];

[map setClickHandler:^(NSString* identifier, CAShapeLayer* layer) {
    if(_oldClickedLayer) {
        _oldClickedLayer.zPosition = 0;
        _oldClickedLayer.shadowOpacity = 0;
    }
    
    _oldClickedLayer = layer;
    
    // We set a simple effect on the layer clicked to highlight it
    layer.zPosition = 10;
    layer.shadowOpacity = 0.5;
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowRadius = 5;
    layer.shadowOffset = CGSizeMake(0, 0);
}];
```

There is a demo of both Swift and Obj-C projects included. 

In order to use the Swift Package Example, open the .xcworkspace file in the root of the project and select scheme "FSInteractiveMapSwift"

How to find SVG maps
---
There are a few places where you can find svg files that are suitable for FSInteractiveMap. Here is a short list:
- http://www.amcharts.com/svg-maps/
- http://www.highcharts.com/maps/demo#custom/world-continents
- Wikipedia

Contact & Issues
---
If you have any issues please let me know in the issue part of this project.
For any other things you can reach me on <a href="https://twitter.com/birslip">twitter</a> or by <a href="mailto:birslip@gmail.com">email</a>.
