(function() {
  window.onload = function() {
    var body = document.body;
    body.onkeypress = function(e) {
      if (e.keyCode == 103 || e.charCode == 103) {
        var dev = body.getAttribute('data-development-grid');
        if (dev === null || dev == 'hide') {
          body.setAttribute('data-development-grid', 'show');
        }
        else {
          body.setAttribute('data-development-grid', 'hide');
        }
      }
    }
  }
})();