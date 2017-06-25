(function() {
  'use strict';

  angular
    .module('MyBank')
    .controller('BalanceCtrl', BalanceCtrl);

  BalanceCtrl.$inject = ['$timeout', '$state', 'transactionsService'];

  function BalanceCtrl($timeout, $state, transactionsService) {
    var vm = this;

    vm.getBalance  = getBalance;

    vm.$onInit = initialize;

    function getBalance() {
      transactionsService.getBalance(vm.account)
      .then(function(response) {
        vm.showBalance = true;

        if(response.account){
          vm.message = undefined;
          vm.account.balance = response.account.balance;
          vm.account.clientName = response.client_name;
        }else{  
          vm.message = "Conta não encontrada";
        }
      })
      .catch(error);
    }

    function error(response) {
      vm.message = "Houve um erro inesperado ao carregar os dados.";
    }

    function initialize() {
      vm.account = {}
    }
  }
})();
