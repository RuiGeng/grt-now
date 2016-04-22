/**
 * Created by emmanuel on 2016-04-21.
 */

angular.module('grtNowApp')
  .controller('WindowCtrl', function ($scope, uiGmapGoogleMapApi, uiGmapObjectIterators, Spinner, Sidebar, VehicleStopTimes, VehicleRealtimes, $interval) {
    $scope.onBusStopClick = function(id) {
      Sidebar.active = 1;
      Sidebar.stops = {
        spinner : true,
        entries: []
      };

      VehicleStopTimes.get({trip: id}, function(data) {
        console.log(data.entries);
        Sidebar.stops.spinner = false;
        Sidebar.stops.entries = data.entries;
        Spinner.hide();
      });

    };

    $scope.onAddFavoriteClick = function(id) {
      Sidebar.active = 1;

      console.log(id);
    };

  });
