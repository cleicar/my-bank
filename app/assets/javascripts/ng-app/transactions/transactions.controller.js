(function() {
  'use strict';

  angular
    .module('MyBank')
    .controller('TransactionsCtrl', TransactionsCtrl);

  TransactionsCtrl.$inject = ['$timeout', '$state', 'transactionsService'];

  function TransactionsCtrl($timeout, $state, transactionsService) {
    var vm = this;   

    vm.saveTransaction      = saveTransaction;
    vm.getAccountUsername   = getAccountUsername;
    vm.cancelTransaction    = cancelTransaction;
    vm.getLastTransactions  = getLastTransactions;

    vm.$onInit = initialize;

    function saveTransaction() {
      vm.message = null;
      
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
      vm.message = null;

      transactionsService.getUsername(vm.ts.source_account)
      .then(function(response) {
        if(response.user_name){
          vm.ts.source_name = response.user_name;
          vm.blockFields = false;
        }else{
          vm.message = 'Conta não encontrada.'
        }
      })
      .catch(error);
    }

    function cancelTransaction() {
      $state.go('portal.home');
    }    

    function getLastTransactions() {
      transactionsService.getTransactions(vm.ts)
      .then(function(response) {
        if(response.success)
          $state.go('portal.home');
        else
          vm.message = response.message;
      })
      .catch(error);
    }

    function error(response) {
      vm.message = "Houve um erro inesperado ao carregar os dados.";
    }

    function initialize() {
      vm.message     = null;
      vm.blockFields = true;

      vm.ts = {
        date: new Date(Date.now()).toLocaleString()
      }
    }
  }
})();
