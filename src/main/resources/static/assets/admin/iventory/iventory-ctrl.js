app.controller("iventory-ctrl",function($scope,$http){
   $scope.items = [];
   $scope.initialize= function(){
       //load products
       $http.get("/rest/iventory").then(resp =>{
           $scope.items = resp.data;
       });
   }
   //khởi đầu
   $scope.initialize();
});
