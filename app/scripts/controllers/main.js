'use strict';

/**
 * @ngdoc function
 * @name grtNowApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the grtNowApp
 */


angular.module('grtNowApp')
  .controller('MainCtrl', function ($scope, $stateParams, uiGmapGoogleMapApi, uiGmapObjectIterators, VehicleRoutes, VehicleStops, VehicleRealtimes, Sidebar, $interval, $rootScope) {
    var vehicles = [];
    var stops = [];

    $scope.markers = {};
    $scope.busRoutes = [];
    $scope.routeSearched = $stateParams.route_id || null;

    $scope.sidebar = Sidebar;
    $scope.sidebar.active = 0;

    $scope.updateMarkersBusStops = function() {

      /*VehicleStops.list(function(data) {
        var i = 0;

        data.entries.map(function (entry) {
          stops.push({
            'id': entry.id,
            'latitude': entry.lat,
            'longitude': entry.long,
            'icon': {
              path: google.maps.SymbolPath.CIRCLE,
              scale: 1
            },
          });

          i++;
        });
      });*/

    };

    $scope.loadRoutes = function() {
      VehicleRoutes.list(function(data) {
        $scope.busRoutes = data.entries;
      });
    };

    $scope.updateMarkersRealtime = function(route) {

      VehicleRealtimes.list(function(data) {
        var i = 0;

        if(route) {
          $scope.markers = [];
          vehicles = [];
        }

        data.entries.map(function(entry) {

          if(!vehicles[i] || vehicles[i].latitude != entry.lat || vehicles[i].longitude != entry.long) {

            if(route) {
              if(route.title == entry.vehicle_route_id) {
                vehicles[i] = {
                  'id': entry.id,
                  'latitude': entry.lat,
                  'longitude': entry.long,
                  'route': entry.vehicle_route_id + ' ' + entry.vehicle_route.long_name,
                  'route_id': entry.vehicle_route_id,
                  'trip_id': entry.vehicle_trip_id,
                  'icon': 'images/bus.png',
                  'title': entry.vehicle_trip.name,
                  'lastUpdate': entry.updated_at
                };
              }
            } else {
              vehicles[i] = {
                'id': entry.id,
                'latitude': entry.lat,
                'longitude': entry.long,
                'route': entry.vehicle_route_id + ' ' + entry.vehicle_route.long_name,
                'route_id': entry.vehicle_route_id,
                'trip_id': entry.vehicle_trip_id,
                'icon': 'images/bus.png',
                'title': entry.vehicle_trip.name,
                'lastUpdate': entry.updated_at
              };
            }
          }

          i++;
        });

        $scope.markers = vehicles;

        // remove old elements
        if(data.entries.length < vehicles.length) {
          vehicles = vehicles.slice(0, data.entries.length);
        }
      });
    };

    $scope.map = { center: { latitude: 43.453669, longitude: -80.507135 }, zoom: 12, options: { mapTypeControl: false } };

    uiGmapGoogleMapApi.then(function(maps) {
      $scope.updateMarkersRealtime(null);
      $scope.updateMarkersBusStops();
      $scope.loadRoutes();

      $interval(function() {
        $scope.updateMarkersRealtime();
      }, 5000);
    });

    $scope.onMarkerClick = function(marker, eventName, model) {
      model.show = !marker.model.show;
      $scope.$apply();
    };

    $scope.onSearchClick = function() {
      if($scope.routeSearched)
        $scope.updateMarkersRealtime($scope.routeSearched);
    };

    $scope.localSearch = function(str) {
      var matches = [];

      $scope.busRoutes.forEach(function(route) {
        if ((route.long_name.toLowerCase().indexOf(str.toString().toLowerCase()) >= 0) || (route.id.toString().indexOf(str.toString()) >= 0) ) {
          matches.push(route);
        }
      });
      return matches;
    };

    $scope.selectedRoute = function(selected) {
      $scope.routeSearched = selected;
      $scope.updateMarkersRealtime(selected);
    };

  });


