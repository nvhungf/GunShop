app.controller("customer-ctrl",function($scope,$http){
   $scope.items = [];
   $scope.form = {};
   $scope.cates = [];
   $scope.total = [];
   $scope.initialize= function(){
       //load products
       $http.get("/rest/account").then(resp =>{
           $scope.items = resp.data;
            $(".nav-tabs a:eq(1)").tab('show')
       });
   }

   //khởi đầu
   $scope.initialize();

   //xóa form
   $scope.reset = function(){
    $scope.form = {
    };
   }

   //Hiển thị lên form
   $scope.edit = function(item){
    $scope.form = angular.copy(item);
    $(".nav-tabs a:eq(0)").tab('show')
   }

   //Thêm sản phẩm mới
   $scope.create= function(){
       var item = angular.copy($scope.form);
       $http.post(`/rest/account`,item).then(resp =>{
           $scope.items.push(resp.data);
           $scope.reset();
           alert("Thêm mới customer thành công");
           $(".nav-tabs a:eq(1)").tab('show')
       }).catch(error =>{
           alert("Lỗi thêm mới customer");
           console.log("Error",error);
       })
   }

   //Cập nhật sản phẩm
   $scope.update= function(){
    var item = angular.copy($scope.form);
    $http.put(`/rest/account/${item.username}`,item).then(resp =>{
        var index = $scope.items.findIndex(p => p.id == item.id);
        $scope.items[index] = item;
        alert("Cập nhật customer thành công");
        $(".nav-tabs a:eq(1)").tab('show')
    }).catch(error =>{
        alert("Lỗi cập nhật customer");
        console.log("Error",error);
    })
   }

   //Xóa sản phẩm
   $scope.delete = function(item){
    $http.delete(`/rest/account/${item.username}`).then(resp =>{
        var index = $scope.items.findIndex(p => p.username == item.username);
        $scope.items.splice(index,1);
        $scope.reset();
        alert("Xóa customer thành công");
        $(".nav-tabs a:eq(1)").tab('show')
    }).catch(error =>{
        alert("Lỗi xóat customer");
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