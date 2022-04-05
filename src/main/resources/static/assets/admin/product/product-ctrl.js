app.controller("product-ctrl",function($scope,$http){
    
   $scope.items = [];
   $scope.form = {};
   $scope.cates = [];
   $scope.initialize= function(){
       //load products
       $http.get("/rest/products").then(resp =>{
           $scope.items = resp.data;
           $scope.items.forEach(item =>{
               item.createDate= new Date(item.createDate);
               $(".nav-tabs a:eq(1)").tab('show')
           })
       });
       //load categories
       $http.get("/rest/categories").then(resp =>{
           $scope.cates = resp.data;
       });
   }

   //khởi đầu
   $scope.initialize();

   //xóa form
   $scope.reset = function(){
    $scope.form = {
        createDate: new Date(),
        image: 'cloud-upload.jpg',
        available: true
    };
   }

   //Hiển thị lên form
   $scope.edit = function(item){
    $scope.form = angular.copy(item);
    $(".nav-tabs a:eq(0)").tab('show')
   }
   
   $scope.check = function(){
    var item = angular.copy($scope.form);
    if (item.name == "" || item.name == undefined){
        console.log(item.name);
        $scope.msgName = 'Name is required'; 

        return true;
    }else {
        $scope.msgName = ''; 
    }

    if (item.price == "" || item.price == undefined){
        console.log(item.price);
        $scope.msgPrice = 'Price is required'; 

        return true;
    }else {
        $scope.msgPrice = ''; 
    }

    if (item.category.id == "" || item.category.id == undefined){
        console.log(item.category.id);
        $scope.msgCategory = 'Please Select Category'; 

        return true;
    }else {
        $scope.msgCategory = ''; 
    }

    if (item.image == "" || item.image == undefined){
        console.log(item.image);
        $scope.msgImage = 'Image is required'; 

        return true;
    }else {
        $scope.msgImage = ''; 
    }

    if (item.available == "" || item.available == undefined){
        console.log(item.available);
        $scope.msgAvailable = 'Available is required'; 

        return true;
    }else {
        $scope.msgAvailable = ''; 
    }

   

   }
   //Thêm sản phẩm mới
   $scope.create= function(){
       var item = angular.copy($scope.form);
        $scope.check();
        if($scope.check()){
            return;
        }
            
                $http.post(`/rest/products`,item).then(resp =>{
                    resp.data.createDate = new Date(resp.data.createDate)
                    $scope.items.push(resp.data);
                    $scope.reset();
                    alert("Thêm mới sản phẩm thành công");
                    $(".nav-tabs a:eq(1)").tab('show')
                    $http.get("/rest/categories").then(resp =>{
                        $scope.cates = resp.data;
                    });
                }).catch(error =>{
                    alert("Lỗi thêm mới sản phẩm");
                    console.log("Error",error);
                })
            
       
   }

   //Cập nhật sản phẩm
   $scope.update= function(){
    var item = angular.copy($scope.form);
    $scope.check();
        if($scope.check()){
            return;
        }
    $http.put(`/rest/products/${item.id}`,item).then(resp =>{
        var index = $scope.items.findIndex(p => p.id == item.id);
        $scope.items[index] = item;
        alert("Cập nhật sản phẩm thành công");
        $(".nav-tabs a:eq(1)").tab('show')
    }).catch(error =>{
        alert("Lỗi cập nhật sản phẩm");
        console.log("Error",error);
    })
   }

   //Xóa sản phẩm
   $scope.delete = function(item){
    $http.delete(`/rest/products/${item.id}`).then(resp =>{
        var index = $scope.items.findIndex(p => p.id == item.id);
        $scope.items.splice(index,1);
        $scope.reset();
        alert("Xóa sản phẩm thành công");
        $(".nav-tabs a:eq(1)").tab('show')
    }).catch(error =>{
        alert("Lỗi xóat sản phẩm");
        console.log("Error",error);
    })
   }
  
 //Upload hình
   $scope.imageChanged = function(files){
    var data = new FormData();
    data.append('file',files[0]);
    $http.post('/rest/upload/images',data,{
        transformRequest: angular.identity,
        headers:{'Content-Type': undefined}
    }).then(resp =>{
        $scope.form.image = resp.data.name;
    }).catch(error =>{
        alert("Lỗi upload hình ảnh");
        console.log("Error",error)
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