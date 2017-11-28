<%@ taglib prefix="create" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<create:wrap title="CSUEB Pizza Create user Page">
<h1>Create user</h1>
<c:if test="${msg != null}"><div class="alert alert-warning"><p class="msg">${msg}</p></div></c:if>
<div class="form-group">
	<form method="POST" action="createuser">
		
		<div class="form-group" id ="email-group">
		<label for="email">Email:</label>
		<input type="email" id="email" class="form-control" placeholder="Enter email" name="email">
		<span id="email-glyph"></span>
		</div>

		<div class="form-group" id="password-group">
		<label for="password">Password:</label>
		<input type="password" id="password" class="form-control" placeholder="Enter password" name="password">
		<span id="password-glyph"></span>
		</div>
		
		<div class="form-group" id="name-group">
		<label for="name">Name:</label>
		<input type="text" id="name" class="form-control" placeholder="Enter name" name="name">
		</div>
		
		<div class="form-group" id="address-group">
		<label for="address">Address:</label>
		<input type="text" id="address" class="form-control" placeholder="Enter address" name="address">
		</div>
		
		<div class="form-group" id="zipcode-group">
		<label for="zipcode">Zip Code:</label>
		<input type="text" id="zipcode" class="form-control" placeholder="Enter zipcode" name="zipcode">
		</div>
		
		<div class="form-group" id="phonenumber-group">
		<label for="phonenumber">Phone Number:</label>
		<input type="text" id="phonenumber" class="form-control" placeholder="Enter phonenumber" name="phonenumber">
		</div>
		
		<input type="submit" class="btn btn-success" value="Create New User">
	</form>
</div>
</create:wrap>

