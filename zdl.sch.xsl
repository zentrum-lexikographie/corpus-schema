<?xml version="1.0" encoding="utf-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
   <title>ISO Schematron rules</title>
   <!-- This file generated 2023-03-27T10:51:39Z by 'extract-isosch.xsl'. -->
   <!-- ********************* -->
   <!-- namespaces, declared: -->
   <!-- ********************* -->
   <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
   <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
   <ns prefix="rng" uri="http://relaxng.org/ns/structure/1.0"/>
   <ns prefix="s" uri="http://www.ascc.net/xml/schematron"/>
   <ns prefix="sch" uri="http://purl.oclc.org/dsdl/schematron"/>
   <ns prefix="sch" uri="http://purl.oclc.org/dsdl/schematron"/>
   <ns prefix="teix" uri="http://www.tei-c.org/ns/Examples"/>
   <!-- ********************* -->
   <!-- namespaces, implicit: -->
   <!-- ********************* -->
   <!-- ************ -->
   <!-- constraints: -->
   <!-- ************ -->
   <pattern id="schematron-constraint-zdl-att.datable.w3c-att-datable-w3c-when-1">
      <rule context="tei:*[@when]">
         <report test="@notBefore|@notAfter|@from|@to" role="nonfatal">The @when attribute cannot be used with any other att.datable.w3c attributes.</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-att.datable.w3c-att-datable-w3c-from-2">
      <rule context="tei:*[@from]">
         <report test="@notBefore" role="nonfatal">The @from and @notBefore attributes cannot be used together.</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-att.datable.w3c-att-datable-w3c-to-3">
      <rule context="tei:*[@to]">
         <report test="@notAfter" role="nonfatal">The @to and @notAfter attributes cannot be used together.</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-att.datable-calendar-calendar-4">
      <rule context="tei:*[@calendar]">
         <assert test="string-length( normalize-space(.) ) gt 0"> @calendar indicates one or more
            systems or calendars to which the date represented by the content of this element belongs,
            but this <name/> element has no textual content.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-att.global.source-source-only_1_ODD_source-5">
      <rule context="tei:*[@source]">
         <let name="srcs" value="tokenize( normalize-space(@source),' ')"/>
         <report test="( self::tei:classRef               | self::tei:dataRef               | self::tei:elementRef               | self::tei:macroRef               | self::tei:moduleRef               | self::tei:schemaSpec )               and               $srcs[2]">
              When used on a schema description element (like
              <value-of select="name(.)"/>), the @source attribute
              should have only 1 value. (This one has <value-of select="count($srcs)"/>.)
            </report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-att.measurement-att-measurement-unitRef-6">
      <rule context="tei:*[@unitRef]">
         <report test="@unit" role="info">The @unit attribute may be unnecessary when @unitRef is present.</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-att.typed-subtypeTyped-7">
      <rule context="tei:*[@subtype]">
         <assert test="@type">The <name/> element should not be categorized in detail with @subtype unless also categorized in general with @type</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-att.pointing-targetLang-targetLang-8">
      <rule context="tei:*[not(self::tei:schemaSpec)][@targetLang]">
         <assert test="@target">@targetLang should only be used on <name/> if @target is specified.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-att.spanning-spanTo-spanTo-points-to-following-9">
      <rule context="tei:*[@spanTo]">
         <assert test="id(substring(@spanTo,2)) and following::*[@xml:id=substring(current()/@spanTo,2)]">
The element indicated by @spanTo (<value-of select="@spanTo"/>) must follow the current element <name/>
         </assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-att.styleDef-schemeVersion-schemeVersionRequiresScheme-10">
      <rule context="tei:*[@schemeVersion]">
         <assert test="@scheme and not(@scheme = 'free')">
              @schemeVersion can only be used if @scheme is specified.
            </assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-p-abstractModel-structure-p-in-ab-or-p-11">
      <rule context="tei:p">
         <report test="(ancestor::tei:ab or ancestor::tei:p) and not( ancestor::tei:floatingText |parent::tei:exemplum |parent::tei:item |parent::tei:note |parent::tei:q |parent::tei:quote |parent::tei:remarks |parent::tei:said |parent::tei:sp |parent::tei:stage |parent::tei:cell |parent::tei:figure )">
        Abstract model violation: Paragraphs may not occur inside other paragraphs or ab elements.
      </report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-p-abstractModel-structure-p-in-l-or-lg-12">
      <rule context="tei:p">
         <report test="(ancestor::tei:l or ancestor::tei:lg) and not( ancestor::tei:floatingText |parent::tei:figure |parent::tei:note )">
        Abstract model violation: Lines may not contain higher-level structural elements such as div, p, or ab, unless p is a child of figure or note, or is a descendant of floatingText.
      </report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-desc-deprecationInfo-only-in-deprecated-13">
      <rule context="tei:desc[ @type eq 'deprecationInfo']">
         <assert test="../@validUntil">Information about a
        deprecation should only be present in a specification element
        that is being deprecated: that is, only an element that has a
        @validUntil attribute should have a child &lt;desc
        type="deprecationInfo"&gt;.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-rt-target-rt-target-not-span-14">
      <rule context="tei:rt/@target">
         <report test="../@from | ../@to">When target= is
            present, neither from= nor to= should be.</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-rt-from-rt-from-15">
      <rule context="tei:rt/@from">
         <assert test="../@to">When from= is present, the to=
            attribute of <name/> is required.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-rt-to-rt-to-16">
      <rule context="tei:rt/@to">
         <assert test="../@from">When to= is present, the from=
            attribute of <name/> is required.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-ptr-ptrAtts-17">
      <rule context="tei:ptr">
         <report test="@target and @cRef">Only one of the
attributes @target and @cRef may be supplied on <name/>.</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-ref-refAtts-18">
      <rule context="tei:ref">
         <report test="@target and @cRef">Only one of the
	attributes @target' and @cRef' may be supplied on <name/>
         </report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-list-gloss-list-must-have-labels-19">
      <rule context="tei:list[@type='gloss']">
         <assert test="tei:label">The content of a "gloss" list should include a sequence of one or more pairs of a label element followed by an item element</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-relatedItem-targetorcontent1-20">
      <rule context="tei:relatedItem">
         <report test="@target and count( child::* ) &gt; 0">
If the @target attribute on <name/> is used, the
relatedItem element must be empty</report>
         <assert test="@target or child::*">A relatedItem element should have either a 'target' attribute
        or a child element to indicate the related bibliographic item</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-l-abstractModel-structure-l-in-l-21">
      <rule context="tei:l">
         <report test="ancestor::tei:l[not(.//tei:note//tei:l[. = current()])]">
        Abstract model violation: Lines may not contain lines or lg elements.
      </report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-lg-atleast1oflggapl-22">
      <rule context="tei:lg">
         <assert test="count(descendant::tei:lg|descendant::tei:l|descendant::tei:gap) &gt; 0">An lg element
        must contain at least one child l, lg, or gap element.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-lg-abstractModel-structure-lg-in-l-23">
      <rule context="tei:lg">
         <report test="ancestor::tei:l[not(.//tei:note//tei:lg[. = current()])]">
        Abstract model violation: Lines may not contain line groups.
      </report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-quotation-quotationContents-24">
      <rule context="tei:quotation">
         <report test="not(@marks) and not (tei:p)">
On <name/>, either the @marks attribute should be used, or a paragraph of description provided</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-citeStructure-match-citestructure-outer-match-25">
      <rule context="tei:citeStructure[not(parent::tei:citeStructure)]">
         <assert test="starts-with(@match,'/')">An XPath in @match on the outer <name/> must start with '/'.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-citeStructure-match-citestructure-inner-match-26">
      <rule context="tei:citeStructure[parent::tei:citeStructure]">
         <assert test="not(starts-with(@match,'/'))">An XPath in @match must not start with '/' except on the outer <name/>.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-div-abstractModel-structure-div-in-l-or-lg-29">
      <rule context="tei:div">
         <report test="(ancestor::tei:l or ancestor::tei:lg) and not(ancestor::tei:floatingText)">
        Abstract model violation: Lines may not contain higher-level structural elements such as div, unless div is a descendant of floatingText.
      </report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-div-abstractModel-structure-div-in-ab-or-p-30">
      <rule context="tei:div">
         <report test="(ancestor::tei:p or ancestor::tei:ab) and not(ancestor::tei:floatingText)">
        Abstract model violation: p and ab may not contain higher-level structural elements such as div, unless div is a descendant of floatingText.
      </report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-shift-shiftNew-31">
      <rule context="tei:shift">
         <assert test="@new" role="warning">              
The @new attribute should always be supplied; use the special value
"normal" to indicate that the feature concerned ceases to be
remarkable at this point.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-s-noNestedS-32">
      <rule context="tei:s">
         <report test="tei:s">You may not nest one s element within
      another: use seg instead</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-span-targetfrom-33">
      <rule context="tei:span">
         <report test="@from and @target">
Only one of the attributes @target and @from may be supplied on <name/>
         </report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-span-targetto-34">
      <rule context="tei:span">
         <report test="@to and @target">
Only one of the attributes @target and @to may be supplied on <name/>
         </report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-span-tonotfrom-35">
      <rule context="tei:span">
         <report test="@to and not(@from)">
If @to is supplied on <name/>, @from must be supplied as well</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-span-tofrom-36">
      <rule context="tei:span">
         <report test="contains(normalize-space(@to),' ') or contains(normalize-space(@from),' ')">
The attributes @to and @from on <name/> may each contain only a single value</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-catchwords-catchword_in_msDesc-37">
      <rule context="tei:catchwords">
         <assert test="ancestor::tei:msDesc or ancestor::tei:egXML">The <name/> element should not be used outside of msDesc.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-dimensions-duplicateDim-38">
      <rule context="tei:dimensions">
         <report test="count(tei:width)&gt; 1">
The element <name/> may appear once only
      </report>
         <report test="count(tei:height)&gt; 1">
The element <name/> may appear once only
      </report>
         <report test="count(tei:depth)&gt; 1">
The element <name/> may appear once only
      </report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-secFol-secFol_in_msDesc-39">
      <rule context="tei:secFol">
         <assert test="ancestor::tei:msDesc or ancestor::tei:egXML">The <name/> element should not be used outside of msDesc.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-signatures-signatures_in_msDesc-40">
      <rule context="tei:signatures">
         <assert test="ancestor::tei:msDesc or ancestor::tei:egXML">The <name/> element should not be used outside of msDesc.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-msIdentifier-msId_minimal-41">
      <rule context="tei:msIdentifier">
         <report test="not(parent::tei:msPart) and (local-name(*[1])='idno' or local-name(*[1])='altIdentifier' or normalize-space(.)='')">An msIdentifier must contain either a repository or location.</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-facsimile-no_facsimile_text_nodes-42">
      <rule context="tei:facsimile//tei:line | tei:facsimile//tei:zone">
         <report test="child::text()[ normalize-space(.) ne '']">
  	  A facsimile element represents a text with images, thus
	  transcribed text should not be present within it.
	</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-path-pathmustnotbeclosed-43">
      <rule context="tei:path[@points]">
         <let name="firstPair" value="tokenize( normalize-space( @points ), ' ')[1]"/>
         <let name="lastPair"
              value="tokenize( normalize-space( @points ), ' ')[last()]"/>
         <let name="firstX" value="xs:float( substring-before( $firstPair, ',') )"/>
         <let name="firstY" value="xs:float( substring-after( $firstPair, ',') )"/>
         <let name="lastX" value="xs:float( substring-before( $lastPair, ',') )"/>
         <let name="lastY" value="xs:float( substring-after( $lastPair, ',') )"/>
         <report test="$firstX eq $lastX and $firstY eq $lastY">The first and
          last elements of this path are the same. To specify a closed polygon, use
          the zone element rather than the path element. </report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-addSpan-addSpan-requires-spanTo-44">
      <rule context="tei:addSpan">
         <assert test="@spanTo">The @spanTo attribute of <name/> is required.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-damageSpan-damageSpan-requires-spanTo-46">
      <rule context="tei:damageSpan">
         <assert test="@spanTo">The @spanTo attribute of <name/> is required.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-delSpan-delSpan-requires-spanTo-48">
      <rule context="tei:delSpan">
         <assert test="@spanTo">The @spanTo attribute of <name/> is required.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-subst-substContents1-50">
      <rule context="tei:subst">
         <assert test="child::tei:add and (child::tei:del or child::tei:surplus)">
            <name/> must have at least one child add and at least one child del or surplus</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-rdgGrp-only1lem-51">
      <rule context="tei:rdgGrp">
         <assert test="count(tei:lem) &lt; 2">Only one &lt;lem&gt; element may appear within a &lt;rdgGrp&gt;</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-variantEncoding-location-variantEncodingLocation-52">
      <rule context="tei:variantEncoding">
         <report test="@location eq 'external' and @method eq 'parallel-segmentation'">
              The @location value "external" is inconsistent with the
              parallel-segmentation method of apparatus markup.</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-relation-reforkeyorname-53">
      <rule context="tei:relation">
         <assert test="@ref or @key or @name">One of the attributes  'name', 'ref' or 'key' must be supplied</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-relation-activemutual-54">
      <rule context="tei:relation">
         <report test="@active and @mutual">Only one of the attributes @active and @mutual may be supplied</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-relation-activepassive-55">
      <rule context="tei:relation">
         <report test="@passive and not(@active)">the attribute 'passive' may be supplied only if the attribute 'active' is supplied</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-link-linkTargets3-56">
      <rule context="tei:link">
         <assert test="contains(normalize-space(@target),' ')">You must supply at least two values for @target or  on <name/>
         </assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-ab-abstractModel-structure-ab-in-l-or-lg-57">
      <rule context="tei:ab">
         <report test="(ancestor::tei:l or ancestor::tei:lg) and not( ancestor::tei:floatingText |parent::tei:figure |parent::tei:note )">
        Abstract model violation: Lines may not contain higher-level divisions such as p or ab, unless ab is a child of figure or note, or is a descendant of floatingText.
      </report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-join-joinTargets3-58">
      <rule context="tei:join">
         <assert test="contains(@target,' ')">
You must supply at least two values for @target on <name/>
         </assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-standOff-nested_standOff_should_be_typed-59">
      <rule context="tei:standOff">
         <assert test="@type or not(ancestor::tei:standOff)">This
      <name/> element must have a @type attribute, since it is
      nested inside a <name/>
         </assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-att.repeatable-MINandMAXoccurs-60">
      <rule context="*[ @minOccurs and @maxOccurs ]">
         <let name="min" value="@minOccurs cast as xs:integer"/>
         <let name="max"
              value="if ( normalize-space( @maxOccurs ) eq 'unbounded') then -1 else @maxOccurs cast as xs:integer"/>
         <assert test="$max eq -1 or $max ge $min">@maxOccurs should be greater than or equal to @minOccurs</assert>
      </rule>
      <rule context="*[ @minOccurs and not( @maxOccurs ) ]">
         <assert test="@minOccurs cast as xs:integer lt 2">When @maxOccurs is not specified, @minOccurs must be 0 or 1</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-att.identified-spec-in-module-61">
      <rule context="tei:elementSpec[@module]|tei:classSpec[@module]|tei:macroSpec[@module]">
         <assert test="(not(ancestor::tei:schemaSpec | ancestor::tei:TEI | ancestor::tei:teiCorpus)) or (not(@module) or (not(//tei:moduleSpec) and not(//tei:moduleRef)) or (//tei:moduleSpec[@ident = current()/@module]) or (//tei:moduleRef[@key = current()/@module]))">
        Specification <value-of select="@ident"/>: the value of the module attribute ("<value-of select="@module"/>") 
should correspond to an existing module, via a moduleSpec or
      moduleRef</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-att.deprecated-validUntil-deprecation-two-month-warning-62">
      <rule context="tei:*[@validUntil]">
         <let name="advance_warning_period"
              value="current-date() + xs:dayTimeDuration('P60D')"/>
         <let name="me_phrase"
              value="if (@ident) then concat('The ', @ident ) else concat('This ', local-name(.), ' of ', ancestor::tei:*[@ident][1]/@ident )"/>
         <assert test="@validUntil cast as xs:date ge current-date()">
            <value-of select="concat( $me_phrase, ' construct is outdated (as of ', @validUntil, '); ODD processors may ignore it, and its use is no longer supported' )"/>
         </assert>
         <assert role="nonfatal"
                 test="@validUntil cast as xs:date ge $advance_warning_period">
            <value-of select="concat( $me_phrase, ' construct becomes outdated on ', @validUntil )"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-att.deprecated-validUntil-deprecation-should-be-explained-63">
      <rule context="tei:*[@validUntil][ not( self::valDesc | self::valList | self::defaultVal )]">
         <assert test="child::tei:desc[ @type eq 'deprecationInfo']">
              A deprecated construct should include, whenever possible, an explanation, but this <value-of select="name(.)"/> does not have a child &lt;desc type="deprecationInfo"&gt;</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-moduleRef-modref-64">
      <rule context="tei:moduleRef">
         <report test="* and @key">
Child elements of <name/> are only allowed when an external module is being loaded
        </report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-moduleRef-prefix-not-same-prefix-65">
      <rule context="tei:moduleRef">
         <report test="//*[ not( generate-id(.) eq generate-id( current() ) ) ]/@prefix = @prefix">The prefix attribute
	    of <name/> should not match that of any other
	    element (it would defeat the purpose)</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-moduleRef-prefix-not-except-and-include-66">
      <rule context="tei:moduleRef">
         <report test="@except and @include">It is an error to supply both the @include and @except attributes</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-elementSpec-child-constraint-based-on-mode-67">
      <rule context="tei:elementSpec[ @mode eq 'delete' ]">
         <report test="child::*">This elementSpec element has a mode= of "delete" even though it has child elements. Change the mode= to "add", "change", or "replace", or remove the child elements.</report>
      </rule>
      <rule context="tei:elementSpec[ @mode = ('add','change','replace') ]">
         <assert test="child::* | (@* except (@mode, @ident))">This elementSpec element has a mode= of "<value-of select="@mode"/>", but does not have any child elements or schema-changing attributes. Specify child elements, use validUntil=, predeclare=, ns=, or prefix=, or change the mode= to "delete".</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-listRef-TagDocsNestinglistRef-68">
      <rule context="( tei:classSpec | tei:dataSpec | tei:elementSpec | tei:macroSpec | tei:moduleSpec | tei:schemaSpec | tei:specGrp )/tei:listRef">
         <report test="tei:listRef">In the context of tagset documentation, the listRef element must not self-nest.</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-listRef-TagDocslistRefChildren-69">
      <rule context="( tei:classSpec | tei:dataSpec | tei:elementSpec | tei:macroSpec | tei:moduleSpec | tei:schemaSpec | tei:specGrp )/tei:listRef/tei:ptr | ( tei:classSpec | tei:dataSpec | tei:elementSpec | tei:macroSpec | tei:moduleSpec | tei:schemaSpec | tei:specGrp )/tei:listRef/tei:ref">
         <assert test="@target and not( matches( @target,'\s') )">In the context of tagset documentation, each ptr or ref element inside a listRef must have a target attribute with only 1 pointer as its value.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-altIdent-deprecate_altIdent_in_non-ODD_places-70">
      <rule context="tei:altIdent">
         <report test="parent::tei:model | parent::tei:modelGrp | parent::tei:modelSequence | parent::tei:paramSpec | parent::tei:schemaSpec"
                 role="nonfatal">
        Use of &lt;altIdent&gt; as a child of &lt;<value-of select="name(..)"/>&gt; is
        deprecated, and will no longer be valid after 2022-07-14.
      </report>
         <report test="parent::tei:moduleSpec" role="nonfatal">
        Use of &lt;altIdent&gt; to declare the FPI of a module is
        deprecated, and will no longer be valid after 2022-07-14;
        please use &lt;idno type="FPI"&gt; instead.
      </report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-altIdent-altIdent_usually_an_NCName-71">
      <rule context="tei:altIdent[ not( parent::tei:moduleSpec or @type eq 'FPI' ) ]">
         <assert test=". castable as xs:NCName">
          The content of this 'altIdent' element (<value-of select="normalize-space(.)"/>)
          should conform to teidata.xmlName.
        </assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-model-no_dup_default_models-72">
      <rule context="tei:model[ not( parent::tei:modelSequence ) ][ not( @predicate ) ]">
         <let name="output" value="normalize-space( @output )"/>
         <report test="following-sibling::tei:model [ not( @predicate )] [ normalize-space( @output ) eq $output ]">
          There are 2 (or more) 'model' elements in this '<value-of select="local-name(..)"/>'
          that have no predicate, but are targeted to the same output
          ("<value-of select="( $output, parent::modelGrp/@output, 'all')[1]"/>")</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-model-no_dup_models-73">
      <rule context="tei:model[ not( parent::tei:modelSequence ) ][ @predicate ]">
         <let name="predicate" value="normalize-space( @predicate )"/>
         <let name="output" value="normalize-space( @output )"/>
         <report test="following-sibling::tei:model [ normalize-space( @predicate ) eq $predicate ] [ normalize-space( @output ) eq $output ]">
          There are 2 (or more) 'model' elements in this
          '<value-of select="local-name(..)"/>' that have
          the same predicate, and are targeted to the same output
          ("<value-of select="( $output, parent::modelGrp/@output, 'all')[1]"/>")</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-modelSequence-no_outputs_nor_predicates_4_my_kids-74">
      <rule context="tei:modelSequence">
         <report test="tei:model[@output]" role="warning">The 'model' children
      of a 'modelSequence' element inherit the @output attribute of the
      parent 'modelSequence', and thus should not have their own</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-sequence-sequencechilden-75">
      <rule context="tei:sequence">
         <assert test="count(*)&gt;1">The sequence element must have at least two child elements</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-alternate-alternatechilden-76">
      <rule context="tei:alternate">
         <assert test="count(*)&gt;1">The alternate element must have at least two child elements</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-constraintSpec-empty-based-on-mode-77">
      <rule context="tei:constraintSpec[ @mode eq 'delete']">
         <report test="child::*">This constraintSpec element has a mode= of "delete" even though it has child elements. Change the mode= to "add", "change", or "replace", or remove the child elements.</report>
      </rule>
      <rule context="tei:constraintSpec[ @mode eq 'change']">
         <assert test="child::*">This constraintSpec element has a mode= of "change", but does not have any child elements. Specify child elements, or change the mode= to "delete".</assert>
      </rule>
      <rule context="tei:constraintSpec[ @mode = ('add','replace') ]">
         <assert test="child::tei:constraint">This constraintSpec element has a mode= of "<value-of select="@mode"/>", but does not have a child 'constraint' element. Use a child 'constraint' element or change the mode= to "delete" or "change".</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-constraintSpec-sch_no_more-78">
      <rule context="tei:constraintSpec">
         <report test="tei:constraint/s:* and @scheme = ('isoschematron','schematron')">Rules
        in the Schematron 1.* language must be inside a constraintSpec
        with a value other than 'schematron' or 'isoschematron' on the
        scheme attribute</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-constraintSpec-isosch-79">
      <rule context="tei:constraintSpec">
         <report test="tei:constraint/sch:* and not( @scheme eq 'schematron')">Rules
        in the ISO Schematron language must be inside a constraintSpec
        with the value 'schematron' on the scheme attribute</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-constraintSpec-needrules-80">
      <rule context="tei:macroSpec/tei:constraintSpec[@scheme eq 'schematron']/tei:constraint">
         <report test="sch:assert|sch:report">An ISO Schematron constraint specification for a macro should not
        have an 'assert' or 'report' element without a parent 'rule' element</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-constraintSpec-unique-constraintSpec-ident-81">
      <rule context="tei:constraintSpec[ @mode eq 'add' or not( @mode ) ]">
         <let name="myIdent" value="normalize-space(@ident)"/>
         <report test="preceding::tei:constraintSpec[ normalize-space(@ident) eq $myIdent ]">
        The @ident of 'constraintSpec' should be unique; this one (<value-of select="$myIdent"/>) is the same as that of a previous 'constraintSpec'.
        </report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-attDef-attDefContents-82">
      <rule context="tei:attDef">
         <assert test="ancestor::teix:egXML[@valid='feasible'] or @mode eq 'change' or @mode eq 'delete' or tei:datatype or tei:valList[@type='closed']">Attribute: the definition of the @<value-of select="@ident"/> attribute in the <value-of select="ancestor::*[@ident][1]/@ident"/>
            <value-of select="' '"/>
            <value-of select="local-name(ancestor::*[@ident][1])"/> should have a closed valList or a datatype</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-attDef-noDefault4Required-83">
      <rule context="tei:attDef[@usage eq 'req']">
         <report test="tei:defaultVal">Since the @<value-of select="@ident"/> attribute is required, it will always be specified. Thus the default value (of "<value-of select="normalize-space(tei:defaultVal)"/>") will never be used. Either change the definition of the attribute so it is not required ("rec" or "opt"), or remove the defaultVal element.</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-attDef-defaultIsInClosedList-twoOrMore-84">
      <rule context="tei:attDef[ tei:defaultVal and tei:valList[@type eq 'closed'] and tei:datatype[ @maxOccurs &gt; 1 or @minOccurs &gt; 1 or @maxOccurs = 'unbounded' ] ]">
         <assert test="tokenize(normalize-space(tei:defaultVal),' ') = tei:valList/tei:valItem/@ident">In the <value-of select="local-name(ancestor::*[@ident][1])"/> defining
        <value-of select="ancestor::*[@ident][1]/@ident"/> the default value of the
        @<value-of select="@ident"/> attribute is not among the closed list of possible
        values</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-attDef-defaultIsInClosedList-one-85">
      <rule context="tei:attDef[ tei:defaultVal and tei:valList[@type eq 'closed'] and tei:datatype[ not(@maxOccurs) or ( if ( @maxOccurs castable as xs:integer ) then ( @maxOccurs cast as xs:integer eq 1 ) else false() )] ]">
         <assert test="string(tei:defaultVal) = tei:valList/tei:valItem/@ident">In the <value-of select="local-name(ancestor::*[@ident][1])"/> defining
        <value-of select="ancestor::*[@ident][1]/@ident"/> the default value of the
        @<value-of select="@ident"/> attribute is not among the closed list of possible
        values</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-dataRef-restrictDataFacet-86">
      <rule context="tei:dataRef[tei:dataFacet]">
         <assert test="@name" role="nonfatal">Data facets can only be specified for references to datatypes specified by
          XML Schemas: Part 2: Datatypes — that is, for there to be a 'dataFacet' child there must be a @name attribute.</assert>
         <report test="@restriction" role="nonfatal">Data facets and restrictions cannot both be expressed on the same data reference — that is, the @restriction attribute cannot be used when a 'dataFacet' element is present.</report>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-zdl-dataRef-restrictAttResctrictionName-87">
      <rule context="tei:dataRef[@restriction]">
         <assert test="@name" role="nonfatal">Restrictions can only be specified for references to datatypes specified by
          XML Schemas: Part 2: Datatypes — that is, for there to be a @restriction attribute there must be a @name attribute, too.</assert>
      </rule>
   </pattern>
   <!-- **************** -->
   <!-- parameter lists: -->
   <!-- **************** -->
   <pattern id="teipm-model-paramList-1">
      <rule context="tei:param[parent::tei:model/@behaviour='alternate']">
         <assert role="error" test="@name='default'   or  @name='alternate'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: default, alternate</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-2">
      <rule context="tei:param[parent::tei:model/@behaviour='anchor']">
         <assert role="error" test="@name='id'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: id</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-3">
      <rule context="tei:param[parent::tei:model/@behaviour='block']">
         <assert role="error" test="@name='content'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: content</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-4">
      <rule context="tei:param[parent::tei:model/@behaviour='body']">
         <assert role="error" test="@name='content'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: content</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-5">
      <rule context="tei:param[parent::tei:model/@behaviour='break']">
         <assert role="error" test="@name='type'   or  @name='label'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: type, label</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-6">
      <rule context="tei:param[parent::tei:model/@behaviour='cell']">
         <assert role="error" test="@name='content'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: content</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-7">
      <rule context="tei:param[parent::tei:model/@behaviour='cit']">
         <assert role="error" test="@name='content'   or  @name='source'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: content, source</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-8">
      <rule context="tei:param[parent::tei:model/@behaviour='document']">
         <assert role="error" test="@name='content'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: content</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-9">
      <rule context="tei:param[parent::tei:model/@behaviour='figure']">
         <assert role="error" test="@name='title'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: title</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-10">
      <rule context="tei:param[parent::tei:model/@behaviour='glyph']">
         <assert role="error" test="@name='uri'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: uri</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-11">
      <rule context="tei:param[parent::tei:model/@behaviour='graphic']">
         <assert role="error"
                 test="@name='url'   or  @name='width'   or  @name='height'   or  @name='scale'   or  @name='title'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: url, width, height, scale, title</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-12">
      <rule context="tei:param[parent::tei:model/@behaviour='heading']">
         <assert role="error" test="@name='content'   or  @name='level'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: content, level</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-13">
      <rule context="tei:param[parent::tei:model/@behaviour='index']">
         <assert role="error" test="@name='type'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: type</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-14">
      <rule context="tei:param[parent::tei:model/@behaviour='inline']">
         <assert role="error" test="@name='content'   or  @name='label'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: content, label</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-15">
      <rule context="tei:param[parent::tei:model/@behaviour='link']">
         <assert role="error" test="@name='content'   or  @name='uri'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: content, uri</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-16">
      <rule context="tei:param[parent::tei:model/@behaviour='list']">
         <assert role="error" test="@name='content'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: content</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-17">
      <rule context="tei:param[parent::tei:model/@behaviour='listItem']">
         <assert role="error" test="@name='content'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: content</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-18">
      <rule context="tei:param[parent::tei:model/@behaviour='metadata']">
         <assert role="error" test="@name='content'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: content</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-19">
      <rule context="tei:param[parent::tei:model/@behaviour='note']">
         <assert role="error"
                 test="@name='content'   or  @name='place'   or  @name='label'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: content, place, label</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-20">
      <rule context="tei:param[parent::tei:model/@behaviour='paragraph']">
         <assert role="error" test="@name='content'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: content</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-21">
      <rule context="tei:param[parent::tei:model/@behaviour='row']">
         <assert role="error" test="@name='content'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: content</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-22">
      <rule context="tei:param[parent::tei:model/@behaviour='section']">
         <assert role="error" test="@name='content'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: content</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-23">
      <rule context="tei:param[parent::tei:model/@behaviour='table']">
         <assert role="error" test="@name='content'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: content</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-24">
      <rule context="tei:param[parent::tei:model/@behaviour='text']">
         <assert role="error" test="@name='content'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: content</assert>
      </rule>
   </pattern>
   <pattern id="teipm-model-paramList-25">
      <rule context="tei:param[parent::tei:model/@behaviour='title']">
         <assert role="error" test="@name='content'">
          Parameter name '<value-of select="@name"/>'  (on <value-of select="ancestor::tei:elementSpec/@ident"/>) not allowed.
          Must  be  drawn from the list: content</assert>
      </rule>
   </pattern>
</schema>
