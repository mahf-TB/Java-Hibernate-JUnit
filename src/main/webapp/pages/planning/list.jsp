<%-- 
    Document   : list
    Created on : 22 mars 2025, 21:29:11
    Author     : mahefa
--%>

<%@page import="com.model.Occuper"%>
<%@page import="java.util.List"%>
<%@page import="com.services.OccuperService"%>
<%@page import="com.dao.OccuperDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liste des planning</title>
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    </head>
    <body>
        <div class="bg-white ">
            <%@include file="/includes/Header.jsp"%>
            <section class="container px-6 py-10 mx-auto mb-14">
                <div class="flex items-center justify-between">
                    <div>
                        <h1 class="text-xl font-semibold text-gray-800 capitalize lg:text-2xl ">
                            Découvrez nos  <span class="underline decoration-blue-500">Plannings Occuper</span>
                        </h1>
                        <p class="text-gray-500 text-sm">
                            Consultez les plannings disponibles pour une gestion optimale des salles.
                        </p>
                    </div>
                    <div class="flex  w-full lg:max-w-[600px] rounded-full border-gray-400 border-opacity-65   border bg-gray-100 px-2">
                        <input type="hidden" name="action" value="search">
                        <input type="text" id="searchInput" name="query"  
                               class="flex w-full text-xs bg-transparent px-3 text-gray-700 rtl:text-right outline-0" 
                               placeholder="Recherche par nom ou prenom ou code" />
                        <div class="border-gray-400 border-opacity-70 my-1 border-l "></div>

                        <button type="submit" class="cursor-pointer relative rounded-full bg-transparent px-2 py-2">
                            <svg class="fill-none size-6"  viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g id="SVGRepo_bgCarrier" stroke-width="0" />
                            <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round" />
                            <g id="SVGRepo_iconCarrier"><path d="M14.9536 14.9458L21 21M17 10C17 13.866 13.866 17 10 17C6.13401 17 3 13.866 3 10C3 6.13401 6.13401 3 10 3C13.866 3 17 6.13401 17 10Z" stroke="#999" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /></g>
                            </svg>
                        </button>
                    </div>
                </div>



                <div class="grid grid-cols-1 gap-8 mt-8 xl:mt-12 xl:gap-12 md:grid-cols-2 xl:grid-cols-3">
                    <!-- Boucle pour afficher chaque planification -->
                    <%
                        OccuperService occServe = new OccuperService();
                        List<Occuper> occps = null;
                        occps = occServe.getAllPlanningOccuper();
                        if (occps != null && !occps.isEmpty()) {
                            for (Occuper occ : occps) {
                    %>
                    <div class="p-4 space-y-4 border-2 border-blue-400 rounded-xl bg-white shadow-lg">
                        <div class="flex items-center gap-4">
                            <span class="inline-block text-blue-500">
                                <!-- Icône pour chaque tâche -->
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-8 h-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 18.657A8 8 0 016.343 7.343S7 9 9 10c0-2 .5-5 2.986-7C14 5 16.09 5.777 17.656 7.343A7.975 7.975 0 0120 13a7.975 7.975 0 01-2.343 5.657z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.879 16.121A3 3 0 1012.015 11L11 14H9c0 .768.293 1.536.879 2.121z" />
                                </svg>
                            </span>
                            <!-- Nom du professeur comme titre -->
                            <h1 class="text-lg lg:text-xl font-semibold text-gray-800 capitalize border-b-2 border-blue-400 pb-1">
                                <%= occ.getProf().getNom()%>
                            </h1>
                        </div>
                        <!-- Description de la session -->
                        <p class="text-gray-600  text-sm">
                            Cours de programmation avancée 
                        </p>
                        <!-- Informations supplémentaires -->
                        <div class="mt-4 space-y-2 text-xs text-gray-600 ">
                            <div class="flex space-x-2  ">
                                <!-- svg  -->
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                                </svg>
                                <p><strong>Date : </strong> <%= occ.getDate()%></p> 
                            </div>
                            <div class="flex space-x-2  ">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-compass" width="18" height="18" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z"></path>
                                <polyline points="8 16 10 10 16 8 14 14 8 16"></polyline>
                                <circle cx="12" cy="12" r="9"></circle>
                                </svg>
                                <p><strong>Heure : </strong> <%= occ.getHeureDebut() + " - " + occ.getHeureFin()%></p>
                            </div>
                            <div class="flex space-x-2 ">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                                </svg>
                                <p><strong>Salle : </strong>  <%= occ.getSalle().getDesignation()%></p> 
                            </div>
                            <div class="flex space-x-2 ">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke-width="1.5"
                                    stroke="currentColor"
                                    class="w-4 h-4 shrink-0"
                                    >
                                <path
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z"
                                    />
                                </svg>
                                <p><strong>Professeur : </strong>  <%= occ.getProf().getNom() + " " + occ.getProf().getPrenom()%></p>
                            </div>
                        </div>
                        <!-- Boutons Modifier et Supprimer -->
                        <div class="flex space-x-4 mt-4 justify-end">
                            <button class="flex items-center justify-center w-8 h-8 text-white bg-blue-500 rounded-full hover:bg-blue-600 transition-colors duration-200">
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 4h4v4M16 4l5 5M4 12v7a1 1 0 001 1h11a1 1 0 001-1v-7M4 12l5 5" />
                                </svg>
                            </button>
                            <!-- Bouton Supprimer -->
                            <button onclick="openModalDelete('<%= occ.getId()%>')" class="flex items-center justify-center w-8 h-8 text-white bg-red-500 rounded-full hover:bg-red-600 transition-colors duration-200">
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                                </svg>
                            </button>
                            <%@include file="/includes/deleteOccuper.jsp"%>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </section>

            <div id="planning-container">

            </div>
            <!-- Bouton flottant pour un don -->
            <div class="fixed inset-x-0 md:inset-x-auto bottom-6 md:right-8 xl:right-10 xl:bottom-8">
                <div class="md:w-72 px-6 md:px-0">
                    <div class="p-2 bg-blue-600 rounded-lg shadow-lg sm:p-3">
                        <div class="flex flex-wrap items-center justify-between">
                            <a href="add" class="flex items-center flex-1 w-0">
                                <span class="flex p-2 bg-blue-800 rounded-lg">
                                    <svg xmlns="http://www.w3.org/2000/svg"
                                         class="h-6 w-6 text-white" fill="none"
                                         viewBox="0 0 24 24" stroke="currentColor"
                                         stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                          d="M11 5.882V19.24a1.76 1.76 0 01-3.417.592l-2.147-6.15M18 13a3 3 0 100-6M5.436 13.683A4.001 4.001 0 017 6h1.832c4.1 0 7.625-1.234 9.168-3v14c-1.543-1.766-5.067-3-9.168-3H7a3.988 3.988 0 01-1.564-.317z" />
                                    </svg>
                                </span>
                                <p class="ml-3 font-medium tracking-wide text-white truncate">
                                    Plannifie-vous 
                                </p>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            let socket;

            function connectWebSocket() {
                socket = new WebSocket("ws://localhost:8080/GestionSalles/api/planning");

                socket.onopen = function () {
                    console.log("Connexion WebSocket ouverte.");
                };

                socket.onmessage = function (event) {
                    console.log("Mise à jour reçue :", event.data);
                    refreshPlanning();
                };

                socket.onclose = function (event) {
                    console.log("Connexion WebSocket fermée, reconnexion...");
                };

                socket.onerror = function (error) {
                    console.error("Erreur WebSocket :", error);
                };
            }

            function refreshPlanning() {
                fetch("list.jsp")
                        .then(response => response.text())
                        .then(data => {
                            document.getElementById("planning-container").innerHTML = data;
                        })
                        .catch(error => console.error("Erreur lors du rafraîchissement :", error));
            }

            window.onload = function () {
                connectWebSocket();
            };
        </script>
    </body>
</html>
