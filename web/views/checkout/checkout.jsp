<%@ taglib prefix="checkout" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<checkout:wrap title="CSUEB Pizza - Checkout">
<h1>Your order</h1>

<table class="table">
	<tr>
		<th>Name</th>
		<th>Price</th>
		<th>Description</th>
		<th>Quantity</th>
	</tr>
	<c:forEach var="item" items="${basket.list}" varStatus="i">
	<tr>
		<td>${item.value.name}</td>
		<td>${item.value.price}</td>
		<td>${item.value.description}</td>
		<td>${item.value.quantity}</td>
	</tr>
	</c:forEach>
</table>

<p>Total number of Pizza's: <b>${basket.size}</b></p>
<p>Total price: <b>$ ${basket.totalPrice}</b></p>

<h3 style="padding-top:10px">Delivery information</h3>
<table class="table">
	<tr>
		<th>Name</th>
		<th>Address</th>
		<th>Zip Code</th>
                <th>Phone Number<th>
	</tr>
	<tr>
		<td>${user.name}</td>
		<td>${user.address}</td>
		<td>${user.zipcode}</td>
                <td>${user.phoneNumber}</td>
	</tr>
</table>

        
<div class="container">
  <form class="form-horizontal" role="form">
    <fieldset>
        <legend>Payments Accepted only Credit Cards <img src="http://i76.imgup.net/accepted_c22e0.png"></legend>
            
      <div class="form-group">
        <label class="col-sm-3 control-label" for="card-holder-name">Name on Card</label>
        <div class="col-sm-9">
          <input type="text" class="form-control" name="card-holder-name" id="card-holder-name" placeholder="Card Holder's Name">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="card-number">Card Number</label>
        <div class="col-sm-9">
          <input type="text" class="form-control" name="card-number" id="card-number" placeholder="Debit/Credit Card Number">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="expiry-month">Expiration Date</label>
        <div class="col-sm-9">
          <div class="row">
            <div class="col-xs-3">
              <select class="form-control col-sm-2" name="expiry-month" id="expiry-month">
                <option>Month</option>
                <option value="01">Jan (01)</option>
                <option value="02">Feb (02)</option>
                <option value="03">Mar (03)</option>
                <option value="04">Apr (04)</option>
                <option value="05">May (05)</option>
                <option value="06">June (06)</option>
                <option value="07">July (07)</option>
                <option value="08">Aug (08)</option>
                <option value="09">Sep (09)</option>
                <option value="10">Oct (10)</option>
                <option value="11">Nov (11)</option>
                <option value="12">Dec (12)</option>
              </select>
            </div>
            <div class="col-xs-3">
              <select class="form-control" name="expiry-year">
                <option value="13">2013</option>
                <option value="14">2014</option>
                <option value="15">2015</option>
                <option value="16">2016</option>
                <option value="17">2017</option>
                <option value="18">2018</option>
                <option value="19">2019</option>
                <option value="20">2020</option>
                <option value="21">2021</option>
                <option value="22">2022</option>
                <option value="23">2023</option>
              </select>
            </div>
          </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="cvv">Card CVV</label>
        <div class="col-sm-3">
          <input type="text" class="form-control" name="cvv" id="cvv" placeholder="Security Code">
        </div>
      </div>
    </fieldset>
  </form>
</div>        
        
        

<a href="receipt"><button type="button" class="btn btn-success"><span class="glyphicon glyphicon-shopping-cart"></span> Confirm</button></a>
		

</checkout:wrap>