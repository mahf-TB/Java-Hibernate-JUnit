<%-- 
    Document   : list
    Created on : 22 mars 2025, 07:18:29
    Author     : mahefa
--%>

<%@page import="com.services.ProfesseurService"%>
<%@page import="com.model.Professeur"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liste des professeurs</title>
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    </head>
    <body>
        <div class="bg-gray-100 h-screen overflow-hidden">
            <%

                List<Professeur> profs = (List<Professeur>) request.getAttribute("professeurs");
                String query = (String) request.getAttribute("query");
                if (query == null) {
                    query = "";
                }
                List<Professeur> professeurs = null;
                if (profs != null) {
                    professeurs = profs;
                } else {
                    ProfesseurService profService = new ProfesseurService();
                    professeurs = profService.getAllProfs();
                }
            %>
            <%@include file="/includes/Header.jsp"%>
            <div class="flex flex-wrap lg:mx-40 mb-5">
                <div class="w-full max-w-full mb-6  mx-auto">
                    <div class="relative flex-[1_auto] flex flex-col break-words min-w-0 bg-clip-border rounded-[.95rem] bg-white m-5">
                        <div class="relative flex flex-col min-w-0 break-words border border-dashed bg-clip-border rounded-2xl border-stone-200 bg-light/30">
                            <!-- card header -->
                            <div class="px-9 pt-5 flex justify-between items-stretch flex-wrap min-h-[70px] pb-0 bg-transparent">
                                <h3 class="flex flex-col items-start justify-center m-2 ml-0 font-medium text-xl/tight text-dark">
                                    <span class="mr-3 font-semibold text-sm"> Professeurs</span>
                                    <span class="mt-1 font-medium text-gray-400 text-xs">Liste des professeurs </span>
                                </h3>

                                <form action="/GestionSalles/profs-servlet" method="GET">
                                    <div class="relative flex items-center my-2">
                                        <div class="flex  w-full mx-7 lg:max-w-[600px] rounded-full border-gray-400 border-opacity-65   border bg-gray-100 px-2">
                                            <input type="hidden" name="action" value="search">
                                            <input type="text" id="searchInput" name="query"  
                                                   value="<%= query%>"
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

                                        <a href="add" class="rounded-xl bg-black px-10 py-2 text-white">
                                            Ajouter
                                        </a>
                                    </div>
                                </form>
                            </div>
                            <!-- end card header -->
                            <!-- card body  -->
                            <div class="flex-auto block py-8 pt-4 px-9">
                                <div class="overflow-x-auto">
                                    <table class="w-full my-0 align-middle text-dark border-gray-200">
                                        <thead class="align-bottom bg-gray-900">
                                            <tr class="font-semibold text-xs text-gray-400">
                                                <th class="p-3 text-start  uppercase">Code</th>
                                                <th class="p-3 text-start  uppercase">Noms</th>
                                                <th class="p-3 text-start uppercase">Prenom</th>
                                                <th class="p-3 text-start uppercase">Grade</th>
                                                <th class="p-3 text-end min-w-[100px] uppercase">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                if (professeurs != null && !professeurs.isEmpty()) {
                                                    for (Professeur prof : professeurs) {
                                            %>
                                            <tr class="border-b border-dashed last:border-b-0 border-gray-400 hover:bg-gray-200 transition-colors duration-150 ease-in-out">
                                                <td class="p-3 pr-0 text-start">
                                                    <span class="font-semibold text-light-inverse text-xs"><%= prof.getCodeProf()%></span>
                                                </td>
                                                <td class="p-3 pr-0 text-start">
                                                    <span class="text-center align-baseline inline-flex px-2 py-1 mr-auto items-center font-semibold text-xs rounded-lg">
                                                        <%= prof.getNom()%>     
                                                    </span>
                                                </td>
                                                <td class="p-3 pr-12 text-start">
                                                    <span class="text-center align-baseline inline-flex px-4 py-3 mr-auto items-center font-semibold text-xs leading-none  rounded-lg"> 
                                                        <%=  prof.getPrenom()%>
                                                    </span>
                                                </td>
                                                <td class="pr-0 text-start">
                                                    <span class="font-semibold  text-xs">                                       
                                                        <%= prof.getGrade()%></span>
                                                </td>
                                                <td class="p-3 pr-0 text-end">
                                                    <div class="z-50 flex items-center gap-2 justify-end">
                                                        <a href="/GestionSalles/profs-servlet?action=edit&id=<%= prof.getId()%>" 
                                                           class="px-4 py-2 bg-blue-500 text-white text-xs rounded-md">
                                                            Modifier
                                                        </a>
                                                        <button onclick="openModalDelete('<%= prof.getId()%>')" class="px-4 py-2 bg-red-600 text-white text-xs rounded-md">
                                                            Supprimer
                                                        </button>
                                                        <%@include file="/includes/deletProfs-modal.jsp"%>
                                                    </div>
                                                </td>
                                            </tr>

                                            <%
                                                }
                                            } else {
                                            %>
                                            <tr>
                                                <td colspan="5" >
                                                    <div class="p-5 bg-gray-200 flex items-center justify-center">
                                                        <span>Aucun professeur trouvé...</span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <% }%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
