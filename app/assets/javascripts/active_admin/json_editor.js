//= require jsoneditor/jsoneditor.js
//= require jsoneditor/asset/jsonlint/jsonlint.js

;(function(window, $) {
  var initEditor = function(i,wrap){
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
  }

  $(function() {
    $('div.jsoneditor-wrap').each(initEditor);

    $(document).on('has_many_add:after', '.has_many_container', function(e, fieldset, container) {
      $('div.jsoneditor-wrap', fieldset).each(initEditor)
    })
  });
})(window, jQuery);
