// selectorSupported lovingly lifted from the mad italian genius, diego perini
// http://javascript.nwbox.com/CSSSupport/
function selectorSupported(selector){

  var support, link, sheet, doc = document,
      root = doc.documentElement,
      head = root.getElementsByTagName('head')[0],

      impl = doc.implementation || {
              hasFeature: function() {
                  return false;
              }
      },

  link = doc.createElement("style");
  link.type = 'text/css';

  (head || root).insertBefore(link, (head || root).firstChild);

  sheet = link.sheet || link.styleSheet;

  if (!(sheet && selector)) return false;

  support = impl.hasFeature('CSS2', '') ?

              function(selector) {
                  try {
                      sheet.insertRule(selector + '{ }', 0);
                      sheet.deleteRule(sheet.cssRules.length - 1);
                  } catch (e) {
                      return false;
                  }
                  return true;

              } : function(selector) {

                  sheet.cssText = selector + ' { }';
                  return sheet.cssText.length !== 0 && !(/unknown/i).test(sheet.cssText) && sheet.cssText.indexOf(selector) === 0;
              };

  return support(selector);

};

Modernizr.addTest('target',function(){
  return selectorSupported(':target');
}).addTest('not',function(){
  return selectorSupported(':not(p)');
}).addTest('last-child',function(){
  return selectorSupported(':last-child');
}).addTest('nth-child',function(){
  return selectorSupported(':nth-child(2)');
}).addTest('nth-of-type',function(){
  return selectorSupported(':nth-of-type(2)');
})
