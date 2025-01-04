
To fetch the newest Clemintine Project Text:

11164  git clone https://bitbucket.org/clementinetextproject/text.git  downloaded_source
11167  (cd downloaded_source && git log | tee git.log)
11169  (cd downloaded_source && rm -rf .git)

# Very out of date sources of the file to be avoided
#
#  https://github.com/jrichter/ClementineVulgateConverter -- uses text from about 2013
#  https://sourceforge.net/projects/vulsearch/ -- last updated in 2006
#

========================================================
Formating (from https://bitbucket.org/clementinetextproject/vulsearch4/src/master/)
========================================================

The text is plain text, codepage 1252, with DOS-style line endings. 

Commas and periods have no space before, and a single space after 
(unless they end a line—there is never a space at the end of a verse),

 whereas : ; ? ! each have a single space before, and a single space after 
 (unless they end a line). 

 In general, the first word of a verse is not capitalized, 
 nor the first word of a line of poetry, 
 but the first word of a sentence, as well as the first word of direct speech 
 or quotation, is capitalized.

The text really has two structures: 
  *  the traditional division into books, chapters and verses, 
  *  and a 'natural' structure as sentences and paragraphs. 
     This latter structure is not an intrinsic part of the text, 
     and has been imposed differently by each editor of the Vulgate through 
     the centuries; 
for my part I have tried to use punctuation both to make the meaning 
transparent, and to reflect the natural cadences in the text.

Paragraph divisions are indicated by a backslash \, 
though this is omitted at the very start or end of a chapter. 
This is followed by a space if it should occur in the middle of a verse.

When text is set as verse, the start and end of a section of verse are 
indicated by brackets [ (preceded by a space) and ] 
(followed by a space unless it end the verse) respectively. 

Line breaks within the verse are indicated by a slash / 
(followed by a space unless it end the verse).

When different speakers are indicated (e.g. in the Lamentations), 
the speaker's name is placed between angle brackets <...>, 
with no space after the closing bracket.

Lamentations and Ecclesiasticus have prologues (which may be non-canonical?). 
In the source, this appears at the start of 1:1, 
though logically it belongs before the start of ch. 1. 
The prologue is preceded by <Prologus> and in both books the text of verse 1 
begins at the first bracket [.

Information on the creators and proof-readers of each book can be found in 
data.txt in the Scripts repository; a description of the format of this file 
appears at its head.

========================================================
Sample decoders
========================================================

https://bitbucket.org/clementinetextproject/scripts/src/master/


========================================================
Notes from the Project
========================================================

== The version of the text

There is a single, definitive Clementine text, namely the Editio Typica 
published by the Typographus Vaticanus in 1598 under the title "Biblia Sacra 
Vulgatæ editionis, Sixti V Pontificis Maximi jussu recognita et edita". 
However, the text here has necessarily been derived from later sources, 
principally that edited by A. Colunga and L. Turrado (La Editorial Católica, 
Madrid, 1946). For dubious readings, the editions of C. Vercellone (Typis S. 
Congregationis de Propaganda Fide, Rome, 1861) and M. Hetzenauer (Pustet & Co, 
1914) were also consulted. Only the canonical books are included (many printed 
versions include an appendix with the apocryphal books Oratio Manassæ and Esdræ 
III and IV).

== Editorial decisions
The words of the text have been transcribed as accurately as possible, human 
error notwithstanding. The usual division into books, chapters, and verses is 
observed. Punctuation, which varies widely between different editions, has been 
chosen with readability in mind; the text is divided into paragraphs for the 
same purpose. In the poetry sections, the text is presented split into lines, 
following Colunga and Turrado, who themselves in their Præfatio say they follow 
other 'recentiores editiones' in this.

Where there are minor variations in spelling amongst the previous editions, 
the new version generally adopts those spellings most familiar from the 
liturgical books printed in the first half of the twentieth century. It also 
distinguishes the semivowel j, and represents the diphthongs ae and oe by 
ligatures.

== Copyright and licensing

The text has been released into the public domain. 
Those who use it are requested to acknowledge their source, 
report typographical errors to the project maintainer, 
and make clear any modifications they make, 
but these are only requests that are not enforced by any licence.

== Contact
You can email the project maintainer at (clementinevulgateproject@mail.com). Please report any errors you find in the text. Warning: replies may not be quick - sorry! - but I get to everything in the end. Feel free to nudge me if you think your email has been lost or forgotten. (Note that the previous email address for the project no longer works, because of a change by the provider.)
