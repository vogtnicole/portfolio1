/*
 * Copyright © 2018 Dennis Schulmeister-Zimolong
 * 
 * E-Mail: dhbw@windows3.de
 * Webseite: https://www.wpvs.de/
 * 
 * Dieser Quellcode ist lizenziert unter einer
 * Creative Commons Namensnennung 4.0 International Lizenz.
 */
package dhbwka.wwi.vertsys.javaee.kleinanzeigenportal.web;

import dhbwka.wwi.vertsys.javaee.kleinanzeigenportal.ejb.KategorieBean;
import dhbwka.wwi.vertsys.javaee.kleinanzeigenportal.ejb.VerkaufsanzeigenBean;
import dhbwka.wwi.vertsys.javaee.kleinanzeigenportal.jpa.AngebotArt;
import dhbwka.wwi.vertsys.javaee.kleinanzeigenportal.jpa.Kategorie;
import dhbwka.wwi.vertsys.javaee.kleinanzeigenportal.jpa.Verkaufsanzeige;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet für die Startseite bzw. jede Seite, die eine Liste der Aufgaben
 * zeigt.
 */
@WebServlet(urlPatterns = {"/app/uebersicht/"})
public class VerkaufsanzeigenListServlet extends HttpServlet {

    @EJB
    private KategorieBean categoryBean;

    @EJB
    private VerkaufsanzeigenBean anzeigenBean;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Verfügbare Kategorien und Stati für die Suchfelder ermitteln
        request.setAttribute("categories", this.categoryBean.findAllSorted());
        request.setAttribute("angebotsarten", AngebotArt.values());

        // Suchparameter aus der URL auslesen
        String searchText = request.getParameter("search_text");
        String searchCategory = request.getParameter("search_category");
        String angebotArt = request.getParameter("search_angebotsarten");

        // Anzuzeigende Aufgaben suchen
        Kategorie category = null;
        AngebotArt art = null;

        if (searchCategory != null) {
            try {
                category = this.categoryBean.findById(Long.parseLong(searchCategory));
            } catch (NumberFormatException ex) {
                category = null;
            }
        }
        if (angebotArt != null) {
            try {
                art = AngebotArt.valueOf(angebotArt);
            } catch (IllegalArgumentException ex) {
                art = null;
            }
        }
            List<Verkaufsanzeige> anzeigen = this.anzeigenBean.search(searchText, category, art);
            request.setAttribute("anzeigen", anzeigen);

            // Anfrage an die JSP weiterleiten
            request.getRequestDispatcher("/WEB-INF/app/verkaufsanzeige_list.jsp").forward(request, response);
        }
    
}
