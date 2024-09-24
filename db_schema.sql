
-- This makes sure that foreign_key constraints are observed and that errors will be thrown for violations
PRAGMA foreign_keys=ON;

BEGIN TRANSACTION;

--create your tables with SQL commands here (watch out for slight syntactical differences with SQLite)

CREATE TABLE IF NOT EXISTS User (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_name TEXT NOT NULL,
    pw TEXT NOT NULL
);


CREATE TABLE IF NOT EXISTS authorSettings (
    blogTitle TEXT NOT NULL,
    blogSubtitle TEXT NOT NULL,
    authors_name TEXT NOT NULL,
    authors_user_id INTEGER PRIMARY KEY AUTOINCREMENT
);

CREATE TABLE IF NOT EXISTS Articles (
    articleID INTEGER PRIMARY KEY AUTOINCREMENT,
    articleTitle TEXT NOT NULL,
    articleSubtitle TEXT NOT NULL,
    articleText TEXT NOT NULL,
    articleLikes INTEGER DEFAULT 0,
    articleCreationDate DATE,
    articleLastModDate DATE,
    articlePublishedDate DATE,
    articleState INTEGER CHECK(articleState =0 OR articleState =1) DEFAULT 0
);

CREATE TABLE IF NOT EXISTS Comments (
    commentID INTEGER PRIMARY KEY AUTOINCREMENT,
    commentCreationDate DATE NOT NULL,
    commentContent TEXT NOT NULL,
    articleID INTEGER,
    FOREIGN KEY(articleID) REFERENCES Articles(articleID)
);


--insert default data (if necessary here)

INSERT INTO User ("user_id","user_name", "pw") VALUES(1,"MarcusMui", "password123");
INSERT INTO authorSettings ("blogTitle", "blogSubtitle", "authors_name", "authors_user_id") VALUES("BlogTitle", "BlogSubtitle", "Author Name", 1);

COMMIT;

