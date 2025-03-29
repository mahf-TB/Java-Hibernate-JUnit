<%-- 
    Document   : add
    Created on : 29 mars 2025, 22:58:31
    Author     : mahefa
--%>

<%@page import="com.dao.SalleDAO"%>
<%@page import="com.model.Salle"%>
<%@page import="com.model.Professeur"%>
<%@page import="java.util.List"%>
<%@page import="com.services.ProfesseurService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulaire d'ajouter un prof</title>

        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <style>
            .-z-1 {
                z-index: -1;
            }

            .origin-0 {
                transform-origin: 0%;
            }

            input:focus ~ label,
            input:not(:placeholder-shown) ~ label,
            textarea:focus ~ label,
            textarea:not(:placeholder-shown) ~ label,
            select:focus ~ label,
            select:not([value='']):valid ~ label {
                /* @apply transform; scale-75; -translate-y-6; */
                --tw-translate-x: 0;
                --tw-translate-y: 0;
                --tw-rotate: 0;
                --tw-skew-x: 0;
                --tw-skew-y: 0;
                transform: translateX(var(--tw-translate-x)) translateY(var(--tw-translate-y)) rotate(var(--tw-rotate))
                    skewX(var(--tw-skew-x)) skewY(var(--tw-skew-y)) scaleX(var(--tw-scale-x)) scaleY(var(--tw-scale-y));
                --tw-scale-x: 0.75;
                --tw-scale-y: 0.75;
                --tw-translate-y: -1.5rem;
            }

            input:focus ~ label,
            select:focus ~ label {
                /* @apply text-black; left-0; */
                --tw-text-opacity: 1;
                color: rgba(0, 0, 0, var(--tw-text-opacity));
                left: 0px;
            }
        </style>

    </head>
    <body>
        <%
            SalleDAO profDAO = new SalleDAO();
            List<Salle> salles = profDAO.findAll();
            // liste des professeur
            ProfesseurService profService = new ProfesseurService();
            List<Professeur> professeurs = profService.getAllProfs();

        %>
        <div class="h-screen overflow-hidden">
            <%@include file="/includes/Header.jsp"%>
            <div class="flex mt-10 h-screen justify-center bg-white">
                <div class="mx-auto w-full max-w-xl">
                    <h1 class="text-4xl font-medium uppercase ">Créer un nouveau planning</h1>
                    <p class="mt-3 text-xs text-gray-500">Les champ avec * son obligatoire</p>

                    <form  method="POST" action="/GestionSalles/occuper-servlet" class="mt-5">
                        <input type="hidden" name="action" value="ajouter">

                        <div class="grid gap-6">
                            <!-- Type evenement  -->
                            <div class="relative z-0 w-full ">
                                <select
                                    name="type"
                                    value=""
                                    onclick="this.setAttribute('value', this.value);"
                                    class="pt-3 pb-2 block w-full px-0 mt-0 bg-transparent border-0 border-b-2 appearance-none z-1 focus:outline-none focus:ring-0 focus:border-black border-gray-200"
                                    >
                                    <option value="" selected disabled hidden></option>
                                    <option value="COURS">COURS </option>
                                    <option value="REUNION">REUNION </option>
                                    <option value="EVENEMENT">EVENEMENT </option>

                                </select>
                                <label for="type" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Select an type d'events</label>
                                <span class="text-sm text-red-600 hidden" id="error">Option has to be selected</span>
                            </div>
                            <!-- Date du events  -->
                            <div class="relative z-0 w-full ">
                                <input
                                    type="text"
                                    name="date"
                                    placeholder=" "
                                    onclick="this.setAttribute('type', 'date');"
                                    class="pt-3 pb-2 block w-full px-0 mt-0 bg-transparent border-0 border-b-2 appearance-none focus:outline-none focus:ring-0 focus:border-black border-gray-200"
                                    />
                                <label for="date" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Date</label>
                                <span class="text-sm text-red-600 hidden" id="error">Date is required</span>
                            </div>
                            <!-- Heure debut et fin  -->
                            <div class="grid gap-4 sm:grid-cols-2">
                                <div class="relative z-0 w-full">
                                    <input
                                        type="text"
                                        name="heureDebut"
                                        placeholder=" "
                                        onclick="this.setAttribute('type', 'time');"
                                        class="pt-3 pb-2 block w-full px-0 mt-0 bg-transparent border-0 border-b-2 appearance-none focus:outline-none focus:ring-0 focus:border-black border-gray-200"
                                        />
                                    <label for="heureDebut" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Time</label>
                                    <span class="text-sm text-red-600 hidden" id="error">Time is required</span>
                                </div>

                                <div class="relative z-0 w-full">
                                    <input
                                        type="text"
                                        name="heureFin"
                                        placeholder=" "
                                        onclick="this.setAttribute('type', 'time');"
                                        class="pt-3 pb-2 block w-full px-0 mt-0 bg-transparent border-0 border-b-2 appearance-none focus:outline-none focus:ring-0 focus:border-black border-gray-200"
                                        />
                                    <label for="heureFin" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Time</label>
                                    <span class="text-sm text-red-600 hidden" id="error">Time is required</span>
                                </div>
                            </div>
                            <!-- SELECT UN PROFESSEUR -->
                            <div class="relative z-0 w-full ">
                                <select
                                    name="profId"
                                    value=""
                                    onclick="this.setAttribute('value', this.value);"
                                    class="pt-3 pb-2 block w-full px-0 mt-0 bg-transparent border-0 border-b-2 appearance-none z-1 focus:outline-none focus:ring-0 focus:border-black border-gray-200"
                                    >
                                    <option value="" selected disabled hidden></option>
                                    <%                                        if (professeurs != null && !professeurs.isEmpty()) {
                                            for (Professeur prof : professeurs) {
                                    %>
                                    <option value="<%= prof.getId() %>"><%= prof.getNom() + " " + prof.getPrenom()%> </option>
                                    <%
                                            }
                                        }
                                    %>


                                </select>
                                <label for="profId" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Select un professeur</label>
                                <span class="text-sm text-red-600 hidden" id="error">Option has to be selected</span>
                            </div>
                            <!-- SELECT UN SALLE DE CLASSE  -->
                            <div class="relative z-0 w-full ">
                                <select
                                    name="salleId"
                                    value=""
                                    onclick="this.setAttribute('value', this.value);"
                                    class="pt-3 pb-2 block w-full px-0 mt-0 bg-transparent border-0 border-b-2 appearance-none z-1 focus:outline-none focus:ring-0 focus:border-black border-gray-200"
                                    >
                                    <option value="" selected disabled hidden></option>
                                    <%
                                        if (salles != null && !salles.isEmpty()) {
                                            for (Salle salle : salles) {
                                    %>
                                    <option value="<%= salle.getId() %>"><%= salle.getDesignation() + " (" + salle.getCodeSalle() + ")"%> </option>
                                    <%
                                            }
                                        }
                                    %>

                                </select>
                                <label for="salleId" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Select un salle</label>
                                <span class="text-sm text-red-600 hidden" id="error">Option has to be selected</span>
                            </div>

                        </div>
                        <div class="flex justify-start mt-10 space-x-2">
                            <a href="/GestionSalles/profs/list" class="rounded-md bg-gray-200 px-10 py-2 text-gray-800">Retour</a>
                            <button type="submit" class="rounded-md bg-black px-10 py-2 text-white">Enregistrer</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            'use strict'

            document.getElementById('button').addEventListener('click', toggleError);
            const errMessages = document.querySelectorAll('#error');

            function toggleError() {
                // Show error message
                errMessages.forEach((el) => {
                    el.classList.toggle('hidden');
                });

                // Highlight input and label with red
                const allBorders = document.querySelectorAll('.border-gray-200');
                const allTexts = document.querySelectorAll('.text-gray-500');
                allBorders.forEach((el) => {
                    el.classList.toggle('border-red-600');
                });
                allTexts.forEach((el) => {
                    el.classList.toggle('text-red-600');
                });
            }
        </script>
    </body>
</html>

