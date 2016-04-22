angular.module('Api', ['ngResource'])
  .factory('apiUrl', ['$window', function($window) {
    return 'https://grtnow-manelpb.c9users.io/api';
  }])
  .factory('VehicleRealtimes', ['apiUrl', '$resource', function(apiUrl, $resource){
    return $resource(apiUrl + '/vehicle_realtimes', {}, {
      list: {method:'GET', params:{}}
    });
  }])
  .factory('VehicleStops', ['apiUrl', '$resource', function(apiUrl, $resource){
    return $resource(apiUrl + '/vehicle_stops', {}, {
      list: {method:'GET', params:{}}
    });
  }])
  .factory('VehicleStopTimes', ['apiUrl', '$resource', function(apiUrl, $resource){
    return $resource(apiUrl + '/vehicle_stop_times/?vehicle_trip_id=:trip&vehicle_stop_id=:stop', {'trip': '@trip_id', 'stop': '@stop_id'}, {
      list: { method:'GET' }
    });
  }])
  .factory('User', ['apiUrl', '$resource', '$auth', function(apiUrl, $resource, $auth){
    return $resource(apiUrl + '/user', {}, {
      list: {
        method:'GET',
        headers: {
          'Authorization': $auth.getToken() || null
        }
      }
    });
  }])
  .factory('UserFavorites', ['apiUrl', '$resource', '$auth', function(apiUrl, $resource, $auth){
    return $resource(apiUrl + '/user/favorite_routes', {}, {
      list: {
        method:'POST',
        headers: {
          'Authorization': $auth.getToken() || null
        }
      }
    });
  }])
