Rime
====

Small command line interface to find rhymes. These are found using two French dictionaries:

- `data/dict.dat`: a dictionary of words and their phonetic equivalent
- `data/syl.dat`: a dictionary of syllables and their phonetic equivalent

Install
-------

```sh
$ git clone https://github.com/sunny/rimes
$ cd rimes
```

Usage
-----

```sh
$ bin/rime cho
artichaut (arti/o)
poncho (pôt/o)
réchaud (ré/o)
bouchot (bu/o)
manchot (mâ/o)
```

Adding a syllable
-----------------

If a syllable doesn't exist, for example:

```sh
$ bin/rime
No phonetic found for 'cha' (bin/rime --add-syllable cha phonetic)
```

You can add it if you know the phonetic syntax:

```sh
$ bin/rime --add-syllable cha /a
```

Adding a word
-------------

If a word doesn't come up and you know the phonetic syntax, you can add it:

```sh
$ bin/rime --add-word chat /a
```


Credits
-------

- By Sunny Ripert
- Under the WTFPL http://sam.zoy.org/wtfpl/
- Thanks to bohwaz's http://tilt.eu.org/rimes/
- Using french lex from http://www.barbery.net/lebarbery/noindex/pourlesnuls-standard.htm

