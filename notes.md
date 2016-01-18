# Semantic Linefeed
This will convert a single text-file to semantic line feeds.

Since semantic line feeds are **semantic** we can only approximate this.

We can start by breaking on:

- .
- ,
- :
- ;
- (
- [
- &mdash;
- &ndash;

Then we can try to guess based on some words:
- that
- then
- which (should already be included with , but still)
- but   ( ^^ same ^^ )
- and
