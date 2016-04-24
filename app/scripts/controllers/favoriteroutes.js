angular.module('grtNowApp')
  .controller('FavoriteRoutesCtrl', function ($scope, UserFavorites, $interval, Sidebar, $auth) {
    Sidebar.active = true;

    Sidebar.routes = {
      spinner: true
    }

    $scope.$on('favorite-routes-update', function(event, args) {
      $scope.updateUserFavorites();
    });

    $scope.onRouteClick = function() {
      $rootScope.$broadcast('favorite-routes-update');
    };

    $scope.updateUserFavorites = function() {
      Sidebar.routes.spinner = true;

      UserFavorites.query(function(data) {
        $scope.routes = data;
        Sidebar.routes.spinner = false;
      });
    };

    $scope.updateUserFavorites();

  });
