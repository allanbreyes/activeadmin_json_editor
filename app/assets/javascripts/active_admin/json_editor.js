//= require jsoneditor/jsoneditor.js
//= require jsoneditor/asset/jsonlint/jsonlint.js

;(function(window, $) {
  $(function() {
    $('div.jsoneditor-wrap').each(function(i,wrap){
      var fieldset = $(wrap).parents('li:eq(0)');
      var container = $(wrap)[0];
      var textarea = $($(wrap).find('textarea'));
      var editor;
      var options = {
        modes: ['tree', 'text'],
        mode: 'tree',
        change: function(ev){
          try {
            var text = JSON.stringify(editor.get());
            textarea.text(text);
            $(fieldset).toggleClass('error',false);
            textarea.text(JSON.stringify(editor.get()));
          } catch (e) {
            editor.options.error(e);
          }
        },
        error: function(e){
          $(fieldset).toggleClass('error',true);
        }
      };
      editor = new JSONEditor(container, options,JSON.parse(textarea.val()));
    });
  });
})(window, jQuery);
