# encoding: utf-8

module Jekyll
  class FootNoteInline < Liquid::Block
    def initialize(name, markup, tokens)
      super
    end

    def render(context)
      context['page']['fnin_count'] =\
        (context['page'].has_key?('fnin_count')?\
           context['page']['fnin_count'] : 0
        ) + 1
      #note = RDiscount.new(super).to_html
      note = Kramdown::Document.new(super).to_html
      context['page']['fnin_notes'] =\
        (context['page'].has_key?('fnin_notes')?\
           context['page']['fnin_notes'] : "") +\
        "<li id='fn:#{context['page']['fnin_count']}'>#{note}<a href='#fnref:#{context['page']['fnin_count']}' rel='reference'>&#8617;</a></li>"
      "<sup id='fninref:#{context['page']['fnin_count']}'><a href='#fnin:#{context['page']['fnin_count']}' rel='footnote'>#{context['page']['fnin_count']}</a></sup>"
    end
  end

  class FootNoteListInline < Liquid::Tag
    def initialize(name, markup, tokens)
      super
    end

    def render(context)
      fnin_notes =\
        (context['page'].has_key?('fnin_notes')?
          "<div class=\"footnotes\"><ol>#{context['page']['fnin_notes']}</ol></div>"\
          : "")
      context['page']['fnin_notes'] = ""
      fnin_notes
    end
  end
end

Liquid::Template.register_tag('fnin', Jekyll::FootNoteInline)
Liquid::Template.register_tag('footnote_inline', Jekyll::FootNoteInline)
Liquid::Template.register_tag('footnotes_inline', Jekyll::FootNoteListInline)
Liquid::Template.register_tag('footnotes_list_inline', Jekyll::FootNoteListInline)
