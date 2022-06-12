<?php

function showPublisher($db)
{
    $statement = $db->query("SELECT DISTINCT publisher FROM literatures");
    while ($data = $statement->fetch()) {
        echo "<option value='$data[0]'>$data[0]</option>";
    }
}

function showAuthor($db)
{
    $statement = $db->query("SELECT DISTINCT name FROM authors");
    while ($data = $statement->fetch()) {
        echo "<option value='$data[0]'>$data[0]</option>";
    }
}

function bookByPublisher($db, $publisher)
{
    $statement = $db->prepare("SELECT name, ISBN, publisher, date, quantity FROM literatures WHERE publisher=?");
    $statement->execute([$publisher]);

    echo "<table style='text-align: center'>";
    echo "<tr><th>Name</th><th>ISBN</th><th>Publisher</th><th>Year</th><th>Number Of Pages</th></tr>";
    while ($data = $statement->fetch()) {
        echo "
                <tr>
                    <td>{$data['name']}</td>
                    <td>{$data['ISBN']}</td>
                    <td>{$data['publisher']}</td>
                    <td>{$data['date']}</td>
                    <td>{$data['quantity']}</td>
                </tr>
            ";
    }
}

function bookByTime($db, $start, $stop)
{
    $statement = $db->prepare("SELECT name, date, literate FROM literatures WHERE date BETWEEN ? AND ?");
    $statement->execute([$start, $stop]);

    echo "<table style='text-align: center'>";
    echo "<tr><th>Name</th><th>Date</th><th>Literate</th>";
    while ($data = $statement->fetch()) {
        echo "
                <tr>
                    <td>{$data['name']}</td>
                    <td>{$data['date']}</td>
                    <td>{$data['literate']}</td>
                </tr>
            ";
    }
}

function bookByAuthor($db, $author)
{
    $statement = $db->prepare("
            SELECT literatures.name, ISBN, publisher, date, quantity, authors.name FROM literatures
            INNER JOIN book_authors ON literatures.ID_Book = book_authors.FID_Book
            INNER JOIN authors ON book_authors.FID_Authors = authors.ID_Authors 
            WHERE literatures.literate = 'Book' AND authors.name = ?
        ");
    $statement->execute([$author]);

    echo "<table style='text-align: center'>";
    echo "<tr><th>Name</th><th>ISBN</th><th>Publisher</th><th>Year</th><th>Number Of Pages</th><th>Author Name</th></tr>";
    while ($data = $statement->fetch()) {
        echo "
                <tr>
                    <td>{$data[0]}</td>
                    <td>{$data['ISBN']}</td>
                    <td>{$data['publisher']}</td>
                    <td>{$data['date']}</td>
                    <td>{$data['quantity']}</td>
                    <td>{$data['name']}</td>
                </tr>
            ";
    }
}