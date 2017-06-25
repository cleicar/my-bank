(function() {
  'use strict';

  angular
    .module('MyBank')
    .service('transactionsService', transactionsService);

  transactionsService.$inject = ['$http'];

  function transactionsService($http) {
    return {
      getBalance: getBalance
    };

    function getBalance(params) {
      return $http.get('/account/get_balance', {params: params})
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