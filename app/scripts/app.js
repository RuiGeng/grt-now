'use strict';

/**
 * @ngdoc overview
 * @name grtNowApp
 * @description
 * # grtNowApp
 *
 * Main module of the application.
 */
angular
  .module('grtNowApp', [
    'ngAnimate', 'ui.router', 'uiGmapgoogle-maps', 'Api', 'angular.filter',  'satellizer'//'ng-token-auth''satellizer'
  ]).config(function($urlRouterProvider, $stateProvider, uiGmapGoogleMapApiProvider, $authProvider) {

      $authProvider.baseUrl = 'https://grtnow-manelpb.c9users.io/';

      $authProvider.google({
        url: 'api/auth/authenticate?provider=google',
        clientId: '674449033922-u0k8no0grpkclntu0garorb3fvgfqk33.apps.googleusercontent.com'
      });

      $stateProvider
        .state('main', {
          url: '/',
          controller: "MainCtrl",
          templateUrl: "views/main.html"
        })
        .state('trips', {
          url: '/trips/:trip_id',
          templateUrl: "views/trip_info.html",
          controller: "TripsCtrl"
        })
        .state('stops', {
          url: '/stops/:stop_id',
          templateUrl: "views/stop_info.html",
          controller: "StopsCtrl"
        });

      $urlRouterProvider.otherwise('/');

      uiGmapGoogleMapApiProvider.configure({
         key: 'AIzaSyA0RIGbN4IvCTcypNo1Vk0WbF-WGCmFZuk',
        v: '3.20'
      });

  })
  .factory('Sidebar', ['$rootScope', function ($rootScope) {

    return {
      active : true,
      stops: [],

      search: function() {
        $rootScope.$broadcast('Sidebar');
      }
    };
  }])
  .factory('Spinner', ['$rootScope', function ($rootScope) {

    return {
      active : true,

      show: function() {
        this.active = true;
      },

      hide: function() {
        this.active = false;
      }
    };
  }]);
