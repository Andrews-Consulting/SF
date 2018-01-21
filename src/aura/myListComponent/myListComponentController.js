({
    getNumbers: function(component) {
        var numbers = [];
        for (var i = 0; i < 10; i++) {
            numbers.push({
                value: i
            });
        }
        component.set("v.numbers", numbers);
    }
    ,
    getInput : function(cmp, event) {
      var fullName = cmp.find("name").get("v.value");
      var outName = cmp.find("nameOutput");
      outName.set("v.value", fullName);
    }
})