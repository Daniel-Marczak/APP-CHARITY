<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav class="container container--70">
    <sec:authorize access="!isAuthenticated()">
        <ul class="nav--actions">
            <li><a href="<c:url value="/login"/>" class="btn btn--small btn--without-border"><spring:message code="app.top-bar-login-href"/> </a></li>
            <li><a href="<c:url value="/registration"/>" class="btn btn--small btn--without-border"><spring:message code="app.top-bar-register-href"/> </a></li>
        </ul>
    </sec:authorize>

    <sec:authorize access="isAuthenticated()">
        <ul class="nav--actions">
            <li class="logged-user">
                <spring:message code="app.top-bar-logged-user-welcome-text"/> <c:out value="${sessionScope.user.name}"/>
                <ul class="dropdown"  style="text-align: center">
                    <sec:authorize access="hasRole('USER')">
                        <li style="padding: 5px">
                            <a class="btn btn--without-border btn--small" href="<c:url value="/user/profile"/>" style="width: 100px">
                                <spring:message code="app.top-bar-logged-user-menu-profile-href"/>
                            </a>
                        </li>
                    </sec:authorize>
                    <li style="padding-top: 5px">
                        <a class="btn btn--without-border btn--small" href="<c:url value="/user/main"/>" style="width: 100px">
                            <spring:message code="app.top-bar-logged-user-menu-my-donations-href"/>
                        </a>
                    </li>
                    <sec:authorize access="hasAnyRole('ADMIN', 'SUPER_ADMIN')">
                        <li style="margin-top: 5px">
                            <a class="btn btn--without-border btn--small" href="<c:url value="/admin/main"/>" style="width: 100px">
                                <spring:message code="app.top-bar-logged-user-menu-admin-zone-btn"/>
                            </a>
                        </li>
                    </sec:authorize>
                    <li style="padding-top: 5px">
                        <form action="<c:url value="/logout"/>" method="post" style="display: inline-block">
                            <input class="btn btn--without-border btn--small" style="width: 100px; margin-top: 5px"
                                   type="submit" value="<spring:message code="app.top-bar-logged-user-menu-logout-btn"/>"/>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                    </li>
                </ul>
            </li>
        </ul>
    </sec:authorize>

    <ul>
        <li><a href="<c:url value="/"/>" class="btn btn--without-border"><spring:message code="app.top-bar-start-btn"/> </a></li>
        <li><a href="<c:url value="/#steps"/>" class="btn btn--without-border"><spring:message code="app.top-bar-how-its-done-btn"/></a></li>
        <li><a href="<c:url value="/#about-us"/>" class="btn btn--without-border"><spring:message code="app.top-bar-about-us-btn"/></a></li>
        <li><a href="<c:url value="/#help"/>" class="btn btn--without-border"><spring:message code="app.top-bar-foundations-and-organizations-btn"/></a></li>
        <sec:authorize access="isAuthenticated()">
            <li><a href="<c:url value="/donation/form"/>" class="btn btn--without-border"><spring:message code="app.top-bar-donate-btn"/></a></li>
        </sec:authorize>
        <li><a href="#contact" class="btn btn--without-border"><spring:message code="app.top-bar-contact-btn"/></a></li>
    </ul>
</nav>