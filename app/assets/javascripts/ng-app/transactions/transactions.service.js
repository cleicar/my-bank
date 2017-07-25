(function() {
  'use strict';

  angular
    .module('MyBank')
    .service('transactionsService', transactionsService);

  transactionsService.$inject = ['$http'];

  function transactionsService($http) {
    return {
      getBalance: getBalance,
      getUsername: getUsername,
      transferMoney: transferMoney,
      getTransactions: getTransactions
    };

    function getBalance(params) {
      return $http.get('/account/get_balance', {params: params})
      .then(done)
      .catch(failed);
    }

    function getUsername(account) {
      return $http.get('/account/get_username', {params: {account_code: account}})
      .then(done)
      .catch(failed);
    }
    
    function getTransactions(account) {
      return $http.get('/transaction/', {params: {account: account}})
      .then(done)
      .catch(failed);
    }

    //create
    function transferMoney(params) {
      return $http.post('/transaction/', params)
      .then(done)
      .catch(failed);
    }

    function done(response) {
      return response.data;
    }

    function failed(error) {
      return error;
    }
  }
})();