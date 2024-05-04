#create the database and use it
CREATE DATABASE IF NOT EXISTS library;
USE library;

#create all the tables in the db
CREATE TABLE IF NOT EXISTS Renters
(
	renter_id INT PRIMARY KEY AUTO_INCREMENT,
    renter_email VARCHAR(45),
    items_borrowed VARCHAR(500),
    requests VARCHAR(500),
    phone_number VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS Renters_rentals
(
	renters_event_id INT PRIMARY KEY AUTO_INCREMENT,
    FK_renter_id INT,
    FK_rental_id INT
);

CREATE TABLE IF NOT EXISTS rentals
(
	rental_id INT PRIMARY KEY AUTO_INCREMENT,
    date_checked_in DATETIME,
	date_checked_out DATETIME,
    date_due DATETIME
);

CREATE TABLE IF NOT EXISTS CDs
(
	cd_id INT PRIMARY KEY AUTO_INCREMENT,
    cd_title VARCHAR(100),
    cd_artist VARCHAR(45),
    cd_genre VARCHAR(45),
    cd_year VARCHAR(45),
    cd_availability VARCHAR(45),
    FK_cd_renter_id INT
);

CREATE TABLE IF NOT EXISTS Books
(
	book_id INT PRIMARY KEY AUTO_INCREMENT,
	book_title VARCHAR(100),
    book_genre VARCHAR(45),
    book_author VARCHAR(45),
    book_publisher VARCHAR(45),
    book_availability VARCHAR(45),
    FK_book_renter_id INT
);

CREATE TABLE IF NOT EXISTS Video_Games
(
	videogame_id INT PRIMARY KEY AUTO_INCREMENT,
    videogame_title VARCHAR(100),
    videogame_rating VARCHAR(45),
    videogame_developer VARCHAR(45),
    videogame_genre VARCHAR(45),
    videogame_platform VARCHAR(45),
    videogame_availability VARCHAR(45),
    FK_videogame_renter_id INT
);

CREATE TABLE IF NOT EXISTS Fines
(
	fine_id INT PRIMARY KEY AUTO_INCREMENT,
    days_overdue INT,
    fine_price DECIMAL(20),
    total_fine DECIMAL(20),
    FK_renterf_id INT
);


#create relationships between tables

#Renters to Renters_rentals is made 1 to many, 
ALTER TABLE Renters_rentals
	ADD FOREIGN KEY (FK_renter_id) REFERENCES Renters(renter_id)
    ON DELETE CASCADE
	ON UPDATE CASCADE;

#rentals to Renters_rentals is made 1 to many
ALTER TABLE Renters_rentals
	ADD FOREIGN KEY (FK_rental_id) REFERENCES rentals(rental_id)
    ON DELETE CASCADE
	ON UPDATE CASCADE;
    
#Renters to CDs is made 1 to many
ALTER TABLE CDs
	ADD FOREIGN KEY (FK_cd_renter_id) REFERENCES Renters(renter_id)
    ON DELETE CASCADE
	ON UPDATE CASCADE;

#Renters to Books is made 1 to many
ALTER TABLE Books
	ADD FOREIGN KEY (FK_book_renter_id) REFERENCES Renters(renter_id)
    ON DELETE CASCADE
	ON UPDATE CASCADE;

#Renters to Video_Games is made 1 to many
ALTER TABLE Video_Games
	ADD FOREIGN KEY (FK_videogame_renter_id) REFERENCES Renters(renter_id)
    ON DELETE CASCADE
	ON UPDATE CASCADE;
    
#Renters to Fines is made 1 to many
ALTER TABLE Fines
	ADD FOREIGN KEY (FK_renterf_id) REFERENCES Renters(renter_id)
    ON DELETE CASCADE
	ON UPDATE CASCADE;
    

#INSERTING DATA

INSERT INTO Renters (renter_email, items_borrowed, requests, phone_number) VALUES ("ab123@pitt.edu", "Harry Potter and the Order of the Phoenix, Hogwarts Legacy", "More Harry Potter series book!", "1123345567");
INSERT INTO Renters (renter_email, items_borrowed, requests, phone_number) VALUES ("cd234@pitt.edu", "Thriller, A Tale of Two Cities", "More Michael Jackson's CD!", "2234456678");
INSERT INTO Renters (renter_email, items_borrowed, requests, phone_number) VALUES ("ef345@pitt.edu", "Back in Black, The Elder Scrolls V", "", "3345567789");
INSERT INTO Renters (renter_email, items_borrowed, requests, phone_number) VALUES ("gh456@pitt.edu", "The Bodyguard, The Little Prince, And Then There Were None", "", "4456678890");
INSERT INTO Renters (renter_email, items_borrowed, requests, phone_number) VALUES ("ij567@pitt.edu", "Dream of the Red Chamber, Bloodborne, Dark Souls III", "I want to read Romance of the Three Kingdoms as well!", "5567789901");
INSERT INTO Renters (renter_email, items_borrowed, requests, phone_number) VALUES ("kl678@pitt.edu", "The Dark Side of the Moon, Their Greatest Hits, Bat Out of Hell", "", "6678890012");
INSERT INTO Renters (renter_email, items_borrowed, requests, phone_number) VALUES ("mn789@pitt.edu", "Hotel California, The Hobbit, She: A History of Adventure, To Kill a Mockingbird", "", "7789901123");
INSERT INTO Renters (renter_email, items_borrowed, requests, phone_number) VALUES ("op890@pitt.edu", "Celeste, Yakuza 0, Final Fantasy VII Remake, Titanfall 2", "", "8890012234");
INSERT INTO Renters (renter_email, items_borrowed, requests, phone_number) VALUES ("qr901@pitt.edu", "Anne of Green Gables, Resident Evil 4 Remake", "More Resident Evil series game!", "9901123345");
INSERT INTO Renters (renter_email, items_borrowed, requests, phone_number) VALUES ("st012@pitt.edu", "Saturday Night Fever, Black Beauty", "", "0012234456");

INSERT INTO CDs (cd_title, cd_artist, cd_genre, cd_year, cd_availability, FK_cd_renter_id) VALUES ("Thriller", "Michael Jackson", "Pop", "1982", "No", "1");
INSERT INTO CDs (cd_title, cd_artist, cd_genre, cd_year, cd_availability, FK_cd_renter_id) VALUES ("Back in Black", "AC/DC", "Hard rock", "1980", "No", "2");
INSERT INTO CDs (cd_title, cd_artist, cd_genre, cd_year, cd_availability, FK_cd_renter_id) VALUES ("The Bodyguard", "Whitney Houston", "R&B", "1992", "No", "3");
INSERT INTO CDs (cd_title, cd_artist, cd_genre, cd_year, cd_availability, FK_cd_renter_id) VALUES ("The Dark Side of the Moon", "Pink Floyd", "Progressive rock", "1973", "No", "4");
INSERT INTO CDs (cd_title, cd_artist, cd_genre, cd_year, cd_availability, FK_cd_renter_id) VALUES ("Their Greatest Hits", "Eagles", "Country rock", "1976", "No", "5");
INSERT INTO CDs (cd_title, cd_artist, cd_genre, cd_year, cd_availability, FK_cd_renter_id) VALUES ("Bat Out of Hell", "Meat Loaf", "Hard rock", "1977", "No", "6");
INSERT INTO CDs (cd_title, cd_artist, cd_genre, cd_year, cd_availability, FK_cd_renter_id) VALUES ("Hotel California", "Eagles", "Soft rock", "1976", "No", "7");
INSERT INTO CDs (cd_title, cd_artist, cd_genre, cd_year, cd_availability, FK_cd_renter_id) VALUES ("Come On Over", "Shania Twain", "Country", "1997", "Yes", "8");
INSERT INTO CDs (cd_title, cd_artist, cd_genre, cd_year, cd_availability, FK_cd_renter_id) VALUES ("Rumours", "Fleetwood Mac", "Soft rock", "1977", "Yes", "9");
INSERT INTO CDs (cd_title, cd_artist, cd_genre, cd_year, cd_availability, FK_cd_renter_id) VALUES ("Saturday Night Fever", "Bee Gees", "Disco", "1977", "No", "10");

INSERT INTO Books (book_title, book_genre, book_author, book_publisher, book_availability, FK_book_renter_id) VALUES ("Harry Potter and the Order of the Phoenix", "Fantasy", "J. K. Rowling", "Scholastic", "No", "1");
INSERT INTO Books (book_title, book_genre, book_author, book_publisher, book_availability, FK_book_renter_id) VALUES ("A Tale of Two Cities", "Historical fiction", "Charles Dickens", "‎Dover Publications", "No", "2");
INSERT INTO Books (book_title, book_genre, book_author, book_publisher, book_availability, FK_book_renter_id) VALUES ("The Little Prince", "Novella", "Antoine de Saint-Exupéry", "Reynal & Hitchcock", "No", "3");
INSERT INTO Books (book_title, book_genre, book_author, book_publisher, book_availability, FK_book_renter_id) VALUES ("And Then There Were None", "Mystery", "Agatha Christie", "HarperCollins", "No", "4");
INSERT INTO Books (book_title, book_genre, book_author, book_publisher, book_availability, FK_book_renter_id) VALUES ("Dream of the Red Chamber", "Family saga", "Cao Xueqin", "Anchor", "No", "5");
INSERT INTO Books (book_title, book_genre, book_author, book_publisher, book_availability, FK_book_renter_id) VALUES ("The Hobbit", "Fantasy", "J. R. R. Tolkien", "Houghton Mifflin Harcourt", "Yes", "6");
INSERT INTO Books (book_title, book_genre, book_author, book_publisher, book_availability, FK_book_renter_id) VALUES ("She: A History of Adventure", "Adventure", "H. Rider Haggard", "Longmans", "No", "7");
INSERT INTO Books (book_title, book_genre, book_author, book_publisher, book_availability, FK_book_renter_id) VALUES ("To Kill a Mockingbird", "Southern Gothic", "Harper Lee", "J. B. Lippincott & Co.", "No", "8");
INSERT INTO Books (book_title, book_genre, book_author, book_publisher, book_availability, FK_book_renter_id) VALUES ("Anne of Green Gables", "Children's novel", "Lucy Maud Montgomery", "L.C. Page & Co.", "No", "9");
INSERT INTO Books (book_title, book_genre, book_author, book_publisher, book_availability, FK_book_renter_id) VALUES ("Black Beauty", "Children's literature", "Anna Sewell", "Simon & Schuster", "Yes", "10");

INSERT INTO Video_Games (videogame_title, videogame_rating, videogame_developer, videogame_genre, videogame_platform, videogame_availability, FK_videogame_renter_id) VALUES ("Hogwarts Legacy", "9.2", "Avalanche Software", "Fantasy", "PS4", "No", "1");
INSERT INTO Video_Games (videogame_title, videogame_rating, videogame_developer, videogame_genre, videogame_platform, videogame_availability, FK_videogame_renter_id) VALUES ("The Elder Scrolls V", "9.4", "Bethesda Game Studios", "Open World", "PS4", "No", "2");
INSERT INTO Video_Games (videogame_title, videogame_rating, videogame_developer, videogame_genre, videogame_platform, videogame_availability, FK_videogame_renter_id) VALUES ("Bloodborne", "9.4", "FromSoftware Inc.", "Action Role-playing", "PS4", "No", "3");
INSERT INTO Video_Games (videogame_title, videogame_rating, videogame_developer, videogame_genre, videogame_platform, videogame_availability, FK_videogame_renter_id) VALUES ("Dark Souls III", "9.4", "FromSoftware Inc.", "Action Role-playing", "Xbox One", "No", "4");
INSERT INTO Video_Games (videogame_title, videogame_rating, videogame_developer, videogame_genre, videogame_platform, videogame_availability, FK_videogame_renter_id) VALUES ("Celeste", "9.7", "Extremely OK Games, Ltd.", "Platform", "Nintendo Switch", "No", "5");
INSERT INTO Video_Games (videogame_title, videogame_rating, videogame_developer, videogame_genre, videogame_platform, videogame_availability, FK_videogame_renter_id) VALUES ("Yakuza 0", "9.5", "Ryu Ga Gotoku Studio", "Action-adventure", "PS4", "Yes", "6");
INSERT INTO Video_Games (videogame_title, videogame_rating, videogame_developer, videogame_genre, videogame_platform, videogame_availability, FK_videogame_renter_id) VALUES ("Final Fantasy VII Remake", "9.0", "Square Enix", "Action Role-playing", "PS5", "No", "7");
INSERT INTO Video_Games (videogame_title, videogame_rating, videogame_developer, videogame_genre, videogame_platform, videogame_availability, FK_videogame_renter_id) VALUES ("Titanfall 2", "9.4", "Respawn Entertainment", "First-person Shooter", "Xbox One", "No", "8");
INSERT INTO Video_Games (videogame_title, videogame_rating, videogame_developer, videogame_genre, videogame_platform, videogame_availability, FK_videogame_renter_id) VALUES ("Resident Evil 4 Remake", "9.7", "CAPCOM Co., Ltd.", "Survival Horror", "PS5", "Yes", "9");
INSERT INTO Video_Games (videogame_title, videogame_rating, videogame_developer, videogame_genre, videogame_platform, videogame_availability, FK_videogame_renter_id) VALUES ("Fallout 4", "8.3", "Bethesda Game Studios", "Open World", "Xbox One", "Yes", "10");

INSERT INTO Fines (days_overdue, fine_price, total_fine) VALUE ("0", "0", "0");
INSERT INTO Fines (days_overdue, fine_price, total_fine) VALUE ("0", "0", "0");
INSERT INTO Fines (days_overdue, fine_price, total_fine) VALUE ("4", "4", "8");
INSERT INTO Fines (days_overdue, fine_price, total_fine) VALUE ("0", "0", "0");
INSERT INTO Fines (days_overdue, fine_price, total_fine) VALUE ("2", "2", "6");
INSERT INTO Fines (days_overdue, fine_price, total_fine) VALUE ("0", "0", "0");
INSERT INTO Fines (days_overdue, fine_price, total_fine) VALUE ("0", "0", "0");
INSERT INTO Fines (days_overdue, fine_price, total_fine) VALUE ("0", "0", "0");
INSERT INTO Fines (days_overdue, fine_price, total_fine) VALUE ("1", "1", "2");
INSERT INTO Fines (days_overdue, fine_price, total_fine) VALUE ("0", "0", "0");

INSERT INTO rentals (date_checked_in, date_checked_out, date_due) VALUE ("2023-03-01", "2023-04-07", "2023-04-28");
INSERT INTO rentals (date_checked_in, date_checked_out, date_due) VALUE ("2023-03-02", "2023-04-10", "2023-05-01");
INSERT INTO rentals (date_checked_in, date_checked_out, date_due) VALUE ("2023-03-03", "2023-04-01", "2023-04-22");
INSERT INTO rentals (date_checked_in, date_checked_out, date_due) VALUE ("2023-03-04", "2023-04-12", "2023-05-03");
INSERT INTO rentals (date_checked_in, date_checked_out, date_due) VALUE ("2023-03-05", "2023-04-03", "2023-04-24");
INSERT INTO rentals (date_checked_in, date_checked_out, date_due) VALUE ("2023-03-06", "2023-04-15", "2023-05-06");
INSERT INTO rentals (date_checked_in, date_checked_out, date_due) VALUE ("2023-03-07", "2023-04-18", "2023-05-09");
INSERT INTO rentals (date_checked_in, date_checked_out, date_due) VALUE ("2023-03-08", "2023-04-21", "2023-05-12");
INSERT INTO rentals (date_checked_in, date_checked_out, date_due) VALUE ("2023-03-09", "2023-04-04", "2023-04-25");
INSERT INTO rentals (date_checked_in, date_checked_out, date_due) VALUE ("2023-03-10", "2023-04-22", "2023-05-13");



# SQL STATEMENTS

# 1.) Which books in the library are fantasy? (SELECT)
#This information would be valuable for librarian use if a customer or renter were to ask which fantasy books they could check out. 
SELECT book_title, book_genre, book_availability FROM Books WHERE book_genre = "Fantasy";

# 2.) Which books, cds and videogames are available? (INNER JOIN)
#This would be useful for a user of the library to look up which books, cds, and videogames are available to them
SELECT
	book_title,
    cd_title,
    videogame_title,
    book_availability,
    cd_availability,
    videogame_availability
FROM
	renters INNER JOIN books ON renters.renter_id = books.FK_book_renter_id
    INNER JOIN cds ON renters.renter_id = cds.FK_cd_renter_id
    INNER JOIN video_games ON renters.renter_id = video_games.FK_videogame_renter_id;

# 3.) Which books and cds available? (LEFT JOIN)
#This would be useful for a user of the library to look up which books and cds are available.
SELECT
	book_title,
    cd_title,
    book_availability,
    cd_availability
FROM
	renters LEFT JOIN books ON renters.renter_id = books.FK_book_renter_id
    LEFT JOIN cds ON renters.renter_id = cds.FK_cd_renter_id;


# 4.a) What's the average fine price for all fines? (AVG)
#By calculating the average fine price, the library can know the overall effectiveness and fairness of their fine system, 
#and make adjustments as needed.
SELECT AVG(fine_price) AS avg_fine_price FROM Fines;

# 4.b) What's the number of rentals for each renter? (COUNT)
#It helps the library to identify its most frequent renters and determine whether there are any renters who have not used the library's resources for a long time.
SELECT renter_id, COUNT(*) AS rental_count FROM Renters GROUP BY renter_id;

# 5.) How many renters have current requests? (GROUP BY)
#This allows the librarians to view which customers have requests, how many requests there are, and what each customer is requesting. 
SELECT COUNT(renter_id), requests FROM Renters GROUP BY requests; 

# 6.)  How many renters have the request for a certain book (HAVING)?
#This allows librarians to see the popularity of a book by looking at which requests are high in volume
SELECT COUNT(renter_id), requests FROM Renters GROUP BY requests HAVING requests = "More Harry Potter series book!";

# 7.) What are the most recent items to be checked out? (ORDER BY)
#This allows the staff to see what items have recently been checked out, 
#perhaps to double check availability of an item or track down an item that is not found in the library. 
SELECT * FROM rentals ORDER BY date_checked_out DESC;

# 8.) What are the top 3 highest rated videogames, ranked from highest to lowest? (LIMIT)
# This lets patrons of the libary to narrow down their choices to the games with the highest ratings
SELECT videogame_title, videogame_rating FROM video_games ORDER BY videogame_rating DESC LIMIT 3;

# 9.) What are the titles of CDs that have been borrowed by renters? (IN)
#The library can determine which items are popular, and which items may need to be replaced, 
#so the library can meet the needs and preferences of its renters.
SELECT cd_title FROM CDs WHERE cd_id IN (SELECT cd_id FROM CDs);