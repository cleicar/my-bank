(function() {
  'use strict';

  angular.module('MyBank').controller('TransactionsCtrl', TransactionsCtrl);

  TransactionsCtrl.$inject = ['$scope', '$timeout', '$state', 'transactionsService'];

  function TransactionsCtrl($scope, $timeout, $state, transactionsService) {
    var vm = this;

    $scope.saveTransaction  = saveTransaction;

    function saveTransaction() {
      transactionsService.add($scope.ts)
      .then(function(response) {
      })
      .catch(error);
    }

    function error(response) {
      $scope.message = "Houve um erro inesperado ao carregar os dados.";
    }

    function initialize() {
      $scope.secondPanel = false;

      $scope.ts = {
        date: moment().locale("pt-br").format("L")
      }
    }

    initialize();
  }
})();
