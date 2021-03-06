<%-- 
    Document   : benutzerBearbeiten
    Created on : 28.02.2018, 14:22:56
    Author     : larau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib tagdir="/WEB-INF/tags/templates" prefix="template"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<template:base>
    <jsp:attribute name="title">
        BenutzerBearbeiten
    </jsp:attribute>

    <jsp:attribute name="head">
        <link rel="stylesheet" href="<c:url value="/css/benutzerBearbeiten.css"/>" />
    </jsp:attribute>

    <jsp:attribute name="menu">
        <div class="menuitem">
            <a href="<c:url value="/app/uebersicht/"/>">Übersicht</a>
        </div>
    </jsp:attribute>

    <jsp:attribute name="content">
        <div class="container">
            <form method="post" class="stacked">
                <div class="column">
                    <%-- CSRF-Token --%>
                    <input type="hidden" name="csrf_token" value="${csrf_token}">
                    
                    <%-- Eingabefelder --%>
                   <h2>Benutzerdaten</h2>
                    <label for="signup_username">
                        Benutzername:
                        <span class="required">*</span>
                    </label>
                    <div class="side-by-side">
                        <input type="text" name="bearbeiten_username" value="${bearbeiten_form.values["bearbeiten_username"][0]}">
                    </div>

                    <label for="signup_password1">
                        Altes Passwort:
                        <span class="required">*</span>
                    </label>
                    <div class="side-by-side">
                        <input type="password" name="bearbeiten_password1" value="${bearbeiten_form.values["bearbeiten_password1"][0]}">
                    </div>

                    <label for="signup_newPassword">
                        Neues Passwort:
                        <span class="required">*</span>
                    </label>
                    <div class="side-by-side">
                        <input type="password" name="bearbeiten_newPassword" value="${bearbeiten_form.values["bearbeiten_newPassword"][0]}">
                    </div>
                    
                    <label for="signup_newPassword2">
                        Neues Passwort (wdh.):
                        <span class="required">*</span>
                    </label>
                    <div class="side-by-side">
                        <input type="password" name="bearbeiten_newPassword2" value="${bearbeiten_form.values["bearbeiten_newPassword2"][0]}">
                    </div>
                    
                    <h2>Anschrift</h2>
                    <label for="vorNachname">
                        Vor- und Nachname:
                        <span class="required">*</span>
                    </label>
                    <div class="side-by-side">
                        <input type="text" name="vorNachname" value="${bearbeiten_form.values["vorNachname"][0]}">
                    </div>    
                    <label for="strasseHausnr">
                        Straße und Hausnummer:
                        <span class="required">*</span>
                    </label>
                    <div class="side-by-side">
                        <input type="text" name="strasseHausnr" value="${bearbeiten_form.values["strasseHausnr"][0]}">
                    </div>  
                    <label for="plz">
                        Postleitzahl und Ort:
                        <span class="required">*</span>
                    </label>
                    <div class="side-by-side">
                        <input type="text" name="plz" value="${bearbeiten_form.values["plz"][0]}">
                        <input type="text" name="ort" value="${bearbeiten_form.values["ort"][0]}">
                    </div>
                    
                    <h2>Kontaktdaten</h2>
                    <label for="plz">
                        Telefon und E-Mail:
                        <span class="required">*</span>
                    </label>
                    <div class="side-by-side">
                        <input type="text" name="telefon" value="${bearbeiten_form.values["telefon"][0]}">
                        <input type="text" name="email" value="${bearbeiten_form.values["email"][0]}">
                    </div>           

                    <%-- Button zum Abschicken --%>
                    <button class="icon-login" type="submit">
                        Ändern
                    </button>
                </div>
                <%-- Fehlermeldungen --%>
                <c:if test="${!empty bearbeiten_form.errors}">
                    <ul class="errors">
                        <c:forEach items="${bearbeiten_form.errors}" var="error">
                            <li>${error}</li>
                            </c:forEach>
                    </ul>
                </c:if>    
            </form>
        </div>
    </jsp:attribute>
</template:base>