app.controller("category-ctrl",function($scope,$http){
   $scope.items = [];
   $scope.form = {};
   $scope.cates = [];
   $scope.initialize= function(){
       //load categories
       $http.get("/rest/categories").then(resp =>{
           $scope.items = resp.data;
           $(".nav-tabs a:eq(1)").tab('show')
       });
       
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

   $scope.check = function(){
    var item = angular.copy($scope.form);

    if (item.id == "" || item.id == undefined){
        console.log(item.id);
        $scope.msgId = 'Id is required'; 

        return true;
    }else {
        $scope.msgId = ''; 
    }

    if (item.name == "" || item.name == undefined){
        console.log(item.name);
        $scope.msgName = 'Name is required'; 

        return true;
    }else {
        $scope.msgName = ''; 
    }

   }
   //Thêm danh mục mới
   $scope.create= function(){
       var item = angular.copy($scope.form);
       $scope.check();
        if($scope.check()){
            return;
        }
       $http.post(`/rest/categories`,item).then(resp =>{
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
    $scope.check();
        if($scope.check()){
            return;
        }
    $http.put(`/rest/categories/${item.id}`,item).then(resp =>{
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
    $http.delete(`/rest/categories/${item.id}`).then(resp =>{
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