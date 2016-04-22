angular.module('grtNowApp')
  .controller('StopsCtrl', function ($scope, $stateParams, VehicleStopTimes, Sidebar) {
    Sidebar.active = true;

    $scope.stops = {
      spinner : true,
      entries: []
    };

    VehicleStopTimes.get({stop: $stateParams.stop_id}, function(data) {
      $scope.stops.spinner = false;
      $scope.stops.entries = data.entries;
    });

  });
