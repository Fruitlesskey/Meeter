<#import "parts/common.ftlh" as c>

<@c.page>
    <h5>${username}</h5>
    ${message!" "}
    <form method="post" xmlns="http://www.w3.org/1999/html">
        <div class="mb-3">
            <label for="exampleInputPassword1">Password:</label>
            <input type="password" name="password" class="form-control" id="exampleInputPassword1"
                   placeholder="Password">
        </div>
            <div class="mb-3">
                <label for="exampleInputEmail1">Email:</label>
                <input type="email" name="email" class="form-control" id="exampleInputEmail1"
                       placeholder="some@some.com" value="${email!" "}">
            </div>
        <input type="hidden" name="_csrf" value="_csrf.token"/>
        <button class="btn btn-primary" type="submit">Save</button>
    </form>
</@c.page>