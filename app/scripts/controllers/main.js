'use strict';

/**
 * @ngdoc function
 * @name grtNowApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the grtNowApp
 */


angular.module('grtNowApp')
  .controller('MainCtrl', function ($scope, uiGmapGoogleMapApi, uiGmapObjectIterators, VehicleStops, VehicleRealtimes, Sidebar, $interval, $rootScope) {
    $scope.markers = {};


    $rootScope.$on('auth:login-success', function(ev, user) {
      alert('Welcome ', user.email);
    });


    var vehicles = [];
    var stops = [];

    Sidebar.active = 0;
    $scope.sidebar = Sidebar;

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

    $scope.updateMarkersRealtime = function() {

      VehicleRealtimes.list(function(data) {
        var i = 0;

        data.entries.map(function(entry) {
          if(!vehicles[i] || vehicles[i].latitude != entry.lat || vehicles[i].longitude != entry.long) {
            vehicles[i] = {
              'id': entry.id,
              'latitude': entry.lat,
              'longitude': entry.long,
              'trip_id': entry.vehicle_trip_id,
              'icon': 'images/bus.png',
              'title': entry.vehicle_trip.name,
              'lastUpdate': entry.updated_at
            };
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
      $scope.updateMarkersRealtime();
      $scope.updateMarkersBusStops();

      /*$interval(function() {
        $scope.updateMarkersRealtime();
      }, 5000);*/
    });

    $scope.onSidebarClick = function() {
      console.log(1);
    };

    $scope.onClick = function(marker, eventName, model) {
      model.show = !marker.model.show;
      console.log(model);
      $scope.$apply();
    };

  });


