<%-- 
    Document   : update
    Created on : 29 mars 2025, 21:47:54
    Author     : mahefa
--%>

<%@page import="com.model.Salle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulaire d'ajouter un prof</title>

        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    </head>
    <body>
        <div class="h-screen overflow-hidden">
            <%@include file="/includes/Header.jsp"%>
            <div class="flex mt-20 h-screen justify-center bg-white">
                <div class="mx-auto w-full max-w-lg">
                    <h1 class="text-4xl font-medium uppercase">Modifier un salle</h1>
                    <p class="mt-3 text-sm text-gray-500">Les champ avec <span class="text-red-500">*</span>  son obligatoire</p>

                    <form  method="POST" action="/GestionSalles/salle-servlet" class="mt-10">
                        <%
                            Salle salle = (Salle) request.getAttribute("salleDetails");
                        %>
                        <input type="hidden" name="action" value="modifier">
                        <input type="hidden" id="id" name="id" value="<%= salle.getId()%>">
                        <div class="grid gap-6 ">
                            <div class="relative z-0">
                                <input type="text" id="code" name="code" value="<%= salle.getCodeSalle()%>" class="peer block w-full border-0 border-b border-gray-500 bg-transparent py-2.5 px-0 text-sm text-gray-900 focus:border-blue-600 focus:outline-none focus:ring-0" placeholder=" " required />
                                <label id="code" class="absolute top-3 text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 origin-[0] peer-placeholder-shown:translate-y-0 peer-placeholder-shown:scale-100 peer-focus:-translate-y-6 peer-focus:scale-75 peer-focus:text-blue-600">Code du salle<span class="text-red-500">*</span> </label>
                            </div>

                            <div class="relative z-0">
                                <input type="text" id="design" name="design" value="<%= salle.getDesignation()%>" class="peer block w-full border-0 border-b border-gray-500 bg-transparent py-2.5 px-0 text-sm text-gray-900 focus:border-blue-600 focus:outline-none focus:ring-0" placeholder=" " required />
                                <label id="design"  class="absolute top-3 text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 origin-[0] peer-placeholder-shown:translate-y-0 peer-placeholder-shown:scale-100 peer-focus:-translate-y-6 peer-focus:scale-75 peer-focus:text-blue-600"><span class="text-red-500">*</span> </label>
                            </div>

                            <div class="relative z-0">
                                <input type="number" id="capacite" name="capacite" value="<%= salle.getCapacite()%>" class="peer block w-full border-0 border-b border-gray-500 bg-transparent py-2.5 px-0 text-sm text-gray-900 focus:border-blue-600 focus:outline-none focus:ring-0" placeholder=" " required />
                                <label id="capacite" class="absolute top-3 text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 origin-[0] peer-placeholder-shown:translate-y-0 peer-placeholder-shown:scale-100 peer-focus:-translate-y-6 peer-focus:scale-75 peer-focus:text-blue-600">Capacite<span class="text-red-500">*</span> </label>
                            </div>
                        </div>
                        <div class="flex justify-start mt-10 space-x-2">

                            <a href="/GestionSalles/salle/list" class="rounded-md bg-gray-200 px-10 py-2 text-gray-800">Retour</a>
                            <button type="submit" class="cursor-pointer rounded-md bg-black px-10 py-2 text-white">Mèttre à jour</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </body>
</html>