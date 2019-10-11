<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
</style>
</head>
<body>


<section class="container py-4">
        <div class="row">
            <div class="col-md-12">
                <h2>Tabs</h2>
                <ul id="tabsJustified" class="nav nav-tabs">
                    <li class="nav-item"><a href="" data-target="#home1" data-toggle="tab" class="nav-link small text-uppercase">Home</a></li>
                    <li class="nav-item"><a href="" data-target="#profile1" data-toggle="tab" class="nav-link small text-uppercase active">Profile</a></li>
                    <li class="nav-item"><a href="" data-target="#messages1" data-toggle="tab" class="nav-link small text-uppercase">Messages</a></li>
                </ul>
                <br>
                <div id="tabsJustifiedContent" class="tab-content">
                    <div id="home1" class="tab-pane fade">
                        <div class="list-group"><a href="" class="list-group-item d-inline-block"><span class="float-right badge badge-pill badge-dark">51</span> Home Link</a> <a href="" class="list-group-item d-inline-block"><span class="float-right badge badge-pill badge-dark">8</span> Link 2</a>                            <a href="" class="list-group-item d-inline-block"><span class="float-right badge badge-pill badge-dark">23</span> Link 3</a> <a href="" class="list-group-item d-inline-block text-muted">Link n..</a></div>
                    </div>
                    <div id="profile1" class="tab-pane fade active show">
                        <div class="row pb-2">
                            <div class="col-md-7">
                                <p>Tabs can be used to contain a variety of content &amp; elements. They are a good way to group <a href="" class="link">relevant content</a>. Display initial content in context to the user. Enable the user to flow through
                                    <a href="" class="link">more</a> information as needed.
                                </p>
                            </div>
                            <div class="col-md-5"><img src="//dummyimage.com/1005x559.png/5fa2dd/ffffff" class="float-right img-fluid img-rounded"></div>
                        </div>
                    </div>
                    <div id="messages1" class="tab-pane fade">
                        <div class="list-group"><a href="" class="list-group-item d-inline-block"><span class="float-right badge badge-pill badge-dark">44</span> Message 1</a> <a href="" class="list-group-item d-inline-block"><span class="float-right badge badge-pill badge-dark">8</span> Message 2</a>                            <a href="" class="list-group-item d-inline-block"><span class="float-right badge badge-pill badge-dark">23</span> Message 3</a> <a href="" class="list-group-item d-inline-block text-muted">Message n..</a></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</body>
</html>