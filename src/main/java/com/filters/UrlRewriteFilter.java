package com.filters;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class UrlRewriteFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialisation si nécessaire
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String path = req.getRequestURI().replace(req.getContextPath(), ""); // Récupère le chemin sans le contexte
        String newPath = "/pages"; // Dossier où se trouvent les JSP

        if (path.startsWith("/api/") || path.endsWith("-servlet")) {
            System.out.println("Requête pour un servlet, on ne filtre pas : " + path);
            chain.doFilter(request, response);
            return;
        }

        if (path.isEmpty() || path.equals("/")) {
            path = "/home"; // Page par défaut
        }

        // Vérifier si le fichier JSP correspondant existe
        String jspPath = newPath + path + ".jsp";
        ServletContext context = req.getServletContext();
        if (context.getResource(jspPath) != null) {
            req.getRequestDispatcher(jspPath).forward(req, res);
        } else {
            req.getRequestDispatcher(newPath + "/404.jsp").forward(req, res); // Page d'erreur
        }
    }

    @Override
    public void destroy() {
        // Nettoyage si nécessaire
    }
}
