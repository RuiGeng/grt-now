/**
 * Created by emmanuel on 2016-04-21.
 */

angular.module('grtNowApp')
  .controller('WindowCtrl', function ($scope, $rootScope, uiGmapGoogleMapApi, uiGmapObjectIterators, Spinner, Sidebar, VehicleStopTimes, VehicleRealtimes, UserFavorites, $interval, $auth, $window, toastr) {

    $scope.isAuthenticated = function() {
      return $auth.isAuthenticated();
    };

    $scope.onBusStopClick = function(id) {
      Sidebar.active = 1;
      Sidebar.stops = {
        spinner : true,
        entries: []
      };

      VehicleStopTimes.get({trip: id}, function(data) {
        Sidebar.stops.spinner = false;
        Sidebar.stops.entries = data.entries;
        Spinner.hide();
      });

    };

    $scope.onAddFavoriteClick = function(id) {
      Sidebar.active = 1;

      var favorite = new UserFavorites();
      favorite.vehicle_route_id = id;
      favorite.$save();

      $window.location.href = "#/favorite-routes";
      $rootScope.$broadcast('favorite-routes-update');

      toastr.success("Route favorited");
    };

    $scope.onAddFavoriteGuestClick = function() {
      toastr.warning("You should login first");
    };

  });
