<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Details</title>
<link rel="stylesheet" href="../css/bookDetail.css">
<link rel="stylesheet" href="../css/header.css">
</head>

<%@ include file="header.html"%>
<br><br><br><br><br><br><br>
<body>
	<div class="container">
		<article class="item-pane">
			<div class="item-preview">
				<div class="book"></div>
			</div>
			<div class="item-details">
				<h1>The Picture of Dorian Gray</h1>
				<span class="subtitle">Oscar Wilde</span>
				<div class="pane__section">
					<p>
						The Picture of Dorian Gray is a philosophical novel by the writer
						Oscar Wilde, first published complete in the July 1890 issue of
						Lippincott's Monthly Magazine. The magazine's editor feared the
						story was indecent, and without Wilde's knowledge, deleted roughly
						five hundred words before publication. Despite that censorship,
						The Picture of Dorian Gray offended the moral sensibilities of
						British book reviewers, some of whom said that Oscar Wilde merited
						prosecution for violating the laws guarding the public morality.
						In response, Wilde aggressively defended his novel and art in
						correspondence with the British press, although he personally made
						excisions of some of the most controversial material when revising
						and lengthening the story for book publication the following year.
						- <a
							href="https://en.wikipedia.org/wiki/The_Picture_of_Dorian_Gray">Wikipedia</a>
					</p>
				</div>
				<div class="pane__section">
					<dl>
						<dt>Cover by</dt>
						<dd>
							<a
								href="http://recoveringtheclassics.com/book/picture-of-dorian-gray/">Roberto
								Lanznaster</a>
						</dd>
						<dt>Format</dt>
						<dd>Paperback</dd>
						<dt>Publisher</dt>
						<dd>Penguin</dd>
						<dt>Published</dt>
						<dd>2008</dd>
						<dt>Edition</dt>
						<dd>N/A</dd>
						<dt>ISBN</dt>
						<dd>1234567890</dd>
					</dl>
				</div>
				<div class="pane__section clearfix">
					<span class="item-price">10.99<span
						class="item-price__units">NZD</span></span><a class="button buy-button"
						href="#">Purchase</a>
				</div>
			</div>
		</article>
	</div>
</body>

</html>