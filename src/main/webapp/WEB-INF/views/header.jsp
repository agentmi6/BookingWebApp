<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>			


<div class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>   
                <a href="${pageContext.request.contextPath}\" class="navbar-brand">Web Application</a>            
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath}\p\products">Products</a></li> 
				<sec:authorize access="hasRole('ADMIN')"> 
                    <li><a href="${pageContext.request.contextPath}\roomType\roomTypes">RoomTypes</a></li>
                    <li><a href="${pageContext.request.contextPath}\room\rooms">Rooms</a></li>
				</sec:authorize>                                                                    
                </ul>
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${pageContext.request.userPrincipal.name != null}">
						<li>
							<a href="#" class="text-capitalize">Welcome ${pageContext.request.userPrincipal.name}</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}\logout">Logout</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath}\newUser"> <span class="glyphicon glyphicon-user"></span>
								Sign up
						</a></li>
						<li><a href="${pageContext.request.contextPath}\login"> <span
								class="glyphicon glyphicon-log-in"></span> Login
						</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
        </div>
    </div>