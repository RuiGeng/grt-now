/**
 * Created by emmanuel on 2016-04-21.
 */

angular.module('grtNowApp')
  .controller('NavbarCtrl', function ($scope, Sidebar, $interval, $auth, User, toastr) {

    $scope.user = {};

    $scope.authenticate = function(provider) {
      $auth.authenticate(provider).then(function(response) {
          $auth.setToken(response);
          $scope.user.name = response.data.name;
        })
        .catch(function(response) {
          toastr.error("Could not login you.", "Oh no!");
          console.log('error: ', response);
        });

    };

    $scope.logout = function() {
      $auth.logout();
    };

    $scope.isAuthenticated = function() {
      return $auth.isAuthenticated();
    };

    if($scope.isAuthenticated()) {
      User.list(function(data) {
        $scope.user = data;
      });
    }
  });
