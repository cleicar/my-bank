(function() {
  'use strict';

  angular
  .module('MyBank')
  .config(['$stateProvider', '$urlRouterProvider', '$locationProvider',
    function($stateProvider, $urlRouterProvider, $locationProvider) {

      $urlRouterProvider.otherwise('portal/home');

      $locationProvider.html5Mode({
        enabled: true,
        requireBase: false
      });

      $stateProvider
      .state('portal', {
        url: '/portal',
        controller: 'BalanceCtrl',
        templateUrl: '/assets/ng-app/core/main.html'
      })
      .state('portal.home', {
        url: '/home',
        controllerAs: 'vm',
        controller: 'BalanceCtrl',
        templateUrl: '/assets/ng-app/balance/balance.html'
      })
      .state('portal.transactions', {
        url: '/transactions',
        controller: 'TransactionsCtrl',
        controllerAs: 'vm',
        templateUrl: '/assets/ng-app/transactions/transactions.html'
      });
    }])
})();
