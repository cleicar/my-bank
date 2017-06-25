(function() {
  'use strict';

  angular
    .module('MyBank')
    .controller('TransactionsCtrl', TransactionsCtrl);

  TransactionsCtrl.$inject = ['$timeout', '$state', 'transactionsService'];

  function TransactionsCtrl($timeout, $state, transactionsService) {
    var vm = this;   

    vm.saveTransaction    = saveTransaction;
    vm.getAccountUsername = getAccountUsername;

    vm.$onInit = initialize;

    function saveTransaction() {
      transactionsService.transferMoney(vm.ts)
      .then(function(response) {
        if(response.success)
          $state.go('portal.home');
        else
          vm.message = response.message;
      })
      .catch(error);
    }

    function getAccountUsername() {
      transactionsService.getUsername(vm.ts.source_account)
      .then(function(response) {
        vm.ts.source_name = response.user_name;
      })
      .catch(error);
    }

    function error(response) {
      vm.message = "Houve um erro inesperado ao carregar os dados.";
    }

    function initialize() {
      vm.ts = {
        date: new Date(Date.now()).toLocaleString()
      }
    }
  }
})();
