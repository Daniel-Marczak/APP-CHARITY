<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<footer>
    <div id="contact" class="contact">
        <h2><spring:message code="app.index-contact-form-heading-h2"/></h2>
        <h3><spring:message code="app.index-contact-form-heading-h3"/></h3>
        <form id="contact-form" class="form--contact" method="post" action="<c:url value='/contact'/>">
            <div class="form-group form-group--50">
                <c:if test="${sessionScope.user == null}">
                    <label>
                        <input class="footer-contact-name" type="text" name="name" minlength="3" maxlength="25"
                               placeholder='<spring:message code="app.index-contact-form-name-ph"/>'/>
                    </label>
                </c:if>
                <c:if test="${sessionScope.user != null}">
                    <label>
                        <input class="footer-contact-name" type="text" name="name" readonly value="${sessionScope.user.name}"/>
                    </label>
                </c:if>
                <div class="hidden contact-error-div-name" style="width: 270px">
                    <spring:message code="validation.error-contact-form-name"/>
                </div>
            </div>
            <div class="form-group form-group--50">
                <c:if test="${sessionScope.user == null}">
                    <div>
                        <label>
                            <input class="footer-contact-surname" type="text" name="surname" minlength="3" maxlength="25"
                                   placeholder='<spring:message code="app.index-contact-form-surname-ph"/>'/>
                        </label>
                    </div>
                </c:if>
                <c:if test="${sessionScope.user != null}">
                    <label>
                        <input class="footer-contact-surname" type="text" name="surname" readonly value="${sessionScope.user.surname}"/>
                    </label>
                </c:if>
                <div class="hidden contact-error-div-surname" style="width: 270px">
                    <spring:message code="validation.error-contact-form-surname"/>
                </div>
            </div>
            <div class="form-group">
                <div>
                    <label>
                        <input type="text" class="footer-contact-message" name="message" minlength="15" maxlength="301"
                                  placeholder='<spring:message code="app.index-contact-form-message-ph"/>'>
                    </label>
                    <div class="hidden contact-error-div-message-to-short">
                        <spring:message code="validation.error-contact-form-message-to-short"/>
                    </div>
                    <div class="hidden contact-error-div-message-to-long">
                        <spring:message code="validation.error-contact-form-message-to-long"/>
                    </div>
                </div>
            </div>
            <button class="btn footer-contact-message-send-btn hidden" style="margin-top: 25px" type="button">
                <spring:message code="app.index-contact-form-submit-btn"/>
            </button>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </div>
    <div class="bottom-line">
        <span class="bottom-line--copy">Copyright &copy; 2021</span>
        <div class="bottom-line--icons">
            <a href="#" class="btn btn--small">
                <spring:message code="app.footer-scroll-to-top-btn"/>
            </a>
        </div>
    </div>

</footer>

<script src="<c:url value="/resources/js/app.js"/>"></script>
<script src="<c:url value="/resources/js/user-footer.js"/>"></script>


