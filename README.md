# CollabCopy
Homepage: http://localhost:8080/app/index
Access config browser (to see action mapping): http://localhost:8080/app/config-browser/index

Change Settings:
1) Change scroll back buffer value for debugging
https://stackoverflow.com/questions/39881395/visual-studio-code-scroll-back-buffer

Improvement notes from presentation:
1) Fines for Late returns (?)
2) Add Location input for books
3) Add automation for book serial in case librarian buys 500 books and doesn't want to manually input 500 book copies.
-
Other improvements:
- No security currently. Anyone can access admin panel. SessionAware already exists but also not being used.
- No ability to upload own book cover. Currently pulling it from openlibrary. And if there is nothing pulled, there will be no image.
