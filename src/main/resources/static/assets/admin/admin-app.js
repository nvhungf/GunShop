app = angular.module("admin-app",["ngRoute"]);

app.config(function($routeProvider){
    $routeProvider
    .when("/cc",{
        templateUrl: "/assets/admin/product/index.html",
        controller: "product-ctrl"
    })
    .when("/product",{
        templateUrl: "/assets/admin/product/index.html",
        controller: "product-ctrl"
    })
    .when("/category",{
        templateUrl: "/assets/admin/category/index.html",
        controller: "category-ctrl"
    })
    .when("/order",{
        templateUrl: "/assets/admin/order/index.html",
        controller: "order-ctrl"
    })
    .when("/authorize",{
        templateUrl: "/assets/admin/authority/index.html",
        controller: "authority-ctrl"
    }).when("unauthorized",{
        templateUrl: "/assets/admin/authority/unauthorized.html",
        controller: "authority-ctrl"
    }).when("/iventory",{
        templateUrl: "/assets/admin/iventory/iventory.html",
        controller: "iventory-ctrl"
    }).when("/chatbox",{
        templateUrl: "/assets/admin/chatbox/chatbox.html",
        controller: "chatbox-ctrl"
    }).when("/customer",{
        templateUrl: "/assets/admin/customer/index.html",
        controller: "customer-ctrl"
    }).otherwise({
        template: "<h1 class='text-center'>FPT Polytechnic Administration</h1>"
    });
})