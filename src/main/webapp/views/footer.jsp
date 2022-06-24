<%@ page import="java.time.YearMonth" %>
<%

int year = YearMonth.now().getYear();

%>

<style>
footer {
	width: 100%;
	position: fixed;
	bottom: 0;
	text-align: center;
}

footer p {
	padding-top: 15px;
}
</style>

<footer class="bg-dark">
	<div class="text-white">
		<p>Copyright Maze Bank &copy; <% out.print(year); %></p>
	</div>
</footer>