app.controller("order-ctrl",function($scope,$http){
   $scope.items = [];
   $scope.form = {};
   $scope.total = [];
   $scope.order = [];
   $scope.initialize= function(){
       //load orders
       $http.get("/rest/orders").then(resp =>{
           $scope.items = resp.data;
           $(".nav-tabs a:eq(1)").tab('show')
       });
       $http.get("/rest/orderdetails").then(resp =>{
           $scope.total = resp.data;
       });
        $http.get("/rest/totalorder").then(resp =>{
           $scope.order = resp.data;
       })
   }

   //khởi đầu
   $scope.initialize();

   //xóa form
   $scope.reset = function(){
    $scope.form = {
        id: '',
        name: ''
    };
   }

   //Hiển thị lên form
   $scope.edit = function(item){
    $scope.form = angular.copy(item);
    $(".nav-tabs a:eq(0)").tab('show')
   }

   //Thêm danh mục mới
   $scope.create= function(){
       var item = angular.copy($scope.form);
       $http.post(`/rest/orders`,item).then(resp =>{
           $scope.items.push(resp.data);
           $scope.reset();
           alert("Thêm mới danh mục thành công");
           $(".nav-tabs a:eq(1)").tab('show')
       }).catch(error =>{
           alert("Lỗi thêm mới danh mục");
           console.log("Error",error);
       })
   }

   //Cập nhật danh mục
   $scope.update= function(){
    var item = angular.copy($scope.form);
    $http.put(`/rest/orders/${item.id}`,item).then(resp =>{
        var index = $scope.items.findIndex(p => p.id == item.id);
        $scope.items[index] = item;
        alert("Cập nhật danh mục thành công");
        $(".nav-tabs a:eq(1)").tab('show')
    }).catch(error =>{
        alert("Lỗi cập nhật danh mục");
        console.log("Error",error);
    })
   }

   //Xóa danh mục
   $scope.delete = function(item){
    $http.delete(`/rest/orders/${item.id}`).then(resp =>{
        var index = $scope.items.findIndex(p => p.id == item.id);
        $scope.items.splice(index,1);
        $scope.reset();
        alert("Xóa danh mục thành công");
        $(".nav-tabs a:eq(1)").tab('show')
    }).catch(error =>{
        alert("Lỗi xóat danh mục");
        console.log("Error",error);
    })
   }
   
 
   
$scope.pager = {
       page: 0,
       size: 10,
       get items(){
           var start = this.page * this.size;
           return $scope.items.slice(start, start + this.size);
       },
       get count(){
       	return Math.ceil(1.0 * $scope.items.length / this.size);
       },

       first(){
           this.page = 0;
       },
	    prev(){
      	  this.page--;
        	if(this.page <0){
        		this.last();}
    	},
    	next(){
        	this.page++;
       		if(this.page >= this.count){
        	this.first();}
    	}, 
  	    last(){
      	  	this.page = this.count-1;
    	}
   	}
});