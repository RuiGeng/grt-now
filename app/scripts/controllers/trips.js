angular.module('grtNowApp')
  .controller('TripsCtrl', function ($scope, $stateParams, VehicleStopTimes, Sidebar) {
    Sidebar.active = true;

    $scope.title = $stateParams.title;

    $scope.stops = {
      spinner : true,
      entries: []
    };

    VehicleStopTimes.get({trip: $stateParams.trip_id}, function(data) {
      $scope.stops.spinner = false;
      $scope.stops.entries = data.entries;
    });

  });
