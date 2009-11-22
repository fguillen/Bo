Bo
===========

Is a most simple document manager system ever.

Why
-----------

I was to lazy to upload my blog, the biggest issue was that the interface was too much, I was used to use WordPress what is an amazing tool, too amazing for me, too many possibilities, too many functions.. too many to me, and in the other hand was very difficult to include code and embeded video elements, even I was lazy to use the wysiwyg editor... 

Besides the among of times my super-multi-line-not-saved posts was lost because some navigator incident.

Hey man, I only want to put my stupid texts and thats all.. and I want to edit them on my text editor.. and I want to use very simple syntax like MarkDown is.. thats all.


For what is cool Bo
-----------
* To have a very simple blog, absolutely center on *publish*.
* And I can't think on another think it could be valid :)

HowToUse
-----------

### Dependecies

    $ gem install rack-test
    $ gem install httpclient  # client only
    $ gem install mocha       # test only

### Install

    $ gem install bo

### New Document

    $ cd ~/my_documents/my_histories
    $ vim my_opinion_about_me.md
    $ bo upload "http://myboblog.com" pass my_opinion_about_me.md


### Update Document

    $ vim my_opinion_about_me.md
    $ bo upload "http://myboblog.com" pass my_opinion_about_me.md


### Delete Document

    $ echo "" > my_opinion_about_me.md
    $ bo upload "http://myboblog.com" pass my_opinion_about_me.md




Details
-----------

### No DataBase

Every document is a file on the file system.


### Only one Model

Just documents, so there is not _Comments_, no _Pings_, not this kind of things that _normal_ bloggers like.

### MarkDown support and not html scaping

You can upload _MarkDown_ documents or directly _HTML_ or a mess of both.

The document content won't be scaped.


Install
-----------


Config
-----------


Templates
-----------
There is not any template system, I was thinking on some kind of template system but whatever I thought wasn't simpler than directly go to the view folder and edit by your self.

Also you can do a lot staff just changing the **bo.css** and the **user.css** files.
