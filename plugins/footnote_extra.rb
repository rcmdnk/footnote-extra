# Footnote for Jekyll (Octupress) with PHP Markdown Extra
# rcmdnk (https://github.com/rcmdnk/footnote-extra)

module Jekyll
  class FootNoteExtra < Liquid::Block
    def initialize(name, markup, tokens)
      super
    end

    def render(context)
      # PHP Markdown Extra's footnote recognizes block-level elements
      # (indented with four spaces.)
      note = ""
      super.strip().each_line{|l| note += "    "+l}
      context['page']['fn_count'] = (context['page'].has_key?('fn_count')? context['page']['fn_count'] : 0) + 1
      context['page']['fn_notes'] = (context['page'].has_key?('fn_notes')? context['page']['fn_notes'] : "") + "\n\n[^#{context['page']['fn_count']}]: #{note}"
      "[^#{context['page']['fn_count']}]"
    end
  end

  class FootNoteListExtra < Liquid::Tag
    def initialize(name, markup, tokens)
      super
    end

    def render(context)
      fn_notes = (context['page'].has_key?('fn_notes')? context['page']['fn_notes'] : "")
      context['page']['fn_notes'] = ""
      fn_notes
    end
  end
end

Liquid::Template.register_tag('fnex', Jekyll::FootNoteExtra)
Liquid::Template.register_tag('footnote_extra', Jekyll::FootNoteExtra)
Liquid::Template.register_tag('footnotes_extra', Jekyll::FootNoteListExtra)
Liquid::Template.register_tag('footnotes_list_extra', Jekyll::FootNoteListExtra)
