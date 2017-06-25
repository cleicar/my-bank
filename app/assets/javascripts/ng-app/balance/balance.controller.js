(function() {
  'use strict';

  angular
    .module('MyBank')
    .controller('BalanceCtrl', BalanceCtrl);

  BalanceCtrl.$inject = ['$scope', '$timeout', '$state', 'transactionsService'];

  function BalanceCtrl($scope, $timeout, $state, transactionsService) {
    $scope.getBalance  = getBalance;

    function getBalance() {
      transactionsService.getBalance($scope.account)
      .then(function(response) {
        $scope.showBalance = true;

        if(response.account){
          $scope.message = undefined;
          $scope.account = response.account;
          $scope.account.clientName = response.client_name;
        }else{  
          $scope.message = "Conta não encontrada";
        }
      })
      .catch(error);
    }

    function error(response) {
      $scope.message = "Houve um erro inesperado ao carregar os dados.";
    }

    function initialize() {
      $scope.account = {}
    }

    initialize();
  }
})();
