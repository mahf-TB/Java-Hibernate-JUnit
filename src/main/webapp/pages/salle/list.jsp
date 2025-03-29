<%-- 
    Document   : list
    Created on : 22 mars 2025, 07:18:29
    Author     : mahefa
--%>

<%@page import="com.dao.SalleDAO"%>
<%@page import="com.model.Salle"%>
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
            <%@include file="/includes/Header.jsp"%>
            <div class="flex flex-wrap lg:mx-40 mb-5">
                <div class="w-full max-w-full px-3 mb-6  mx-auto">
                    <div class="relative flex-[1_auto] flex flex-col break-words min-w-0 bg-clip-border rounded-[.95rem] bg-white m-5">
                        <div class="relative flex flex-col min-w-0 break-words border border-dashed bg-clip-border rounded-2xl border-stone-200 bg-light/30">
                            <!-- card header -->
                            <div class="px-9 pt-5 flex justify-between items-stretch flex-wrap min-h-[70px] pb-0 bg-transparent">
                                <h3 class="flex flex-col items-start justify-center m-2 ml-0 font-medium text-xl/tight text-dark">
                                    <span class="mr-3 font-semibold text-sm"> Salle de classe</span>
                                    <span class="mt-1 font-medium text-gray-400 text-xs">Liste des salle de classe </span>
                                </h3>
                                <div class="relative flex flex-wrap items-center my-2">
                                    <%@include file="/includes/salleAdd-modal.jsp"%>
                                </div>
                            </div>
                            <!-- end card header -->
                            <!-- card body  -->
                            <div class="flex-auto block py-8 pt-4 px-9">
                                <div class="overflow-x-auto">
                                    <table class="w-full my-0 align-middle text-dark border-gray-200">
                                        <thead class="align-bottom bg-gray-900">
                                            <tr class="font-semibold text-xs text-gray-400">
                                                <th class="p-3 text-start  uppercase">Code</th>
                                                <th class="p-3 text-start  uppercase">Designation</th>
                                                <th class="p-3 text-start uppercase">capacite</th>
                                                <th class="p-3 text-center min-w-[100px] uppercase">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                SalleDAO profDAO =  new SalleDAO();
                                                
                                                List<Salle> salles = null;
                                                salles = profDAO.findAll();
                                                if (salles != null && !salles.isEmpty()) {
                                                    for (Salle sll : salles) {
                                            %>
                                            <tr class="border-b border-dashed last:border-b-0 border-gray-400 hover:bg-gray-200 transition-colors duration-150 ease-in-out">
                                                <td class="p-3 pr-0 text-start">
                                                    <span class="font-semibold text-light-inverse text-xs"><%= sll.getCodeSalle()%></span>
                                                </td>
                                                <td class="p-3 pr-0 text-start">
                                                    <span class="text-center align-baseline inline-flex px-2 py-1 mr-auto items-center font-semibold text-xs rounded-lg">
                                                        <%= sll.getDesignation()%>     
                                                    </span>
                                                </td>
                                                <td class="p-3 pr-12 text-start">
                                                    <span class="text-center align-baseline inline-flex px-4 py-3 mr-auto items-center font-semibold text-xs leading-none  rounded-lg"> 
                                                        <%=  sll.getCapacite()%>
                                                    </span>
                                                </td>
                                                
                                                <td class="p-3 pr-0 text-end">
                                                    <div class="z-50 flex items-center gap-2 justify-center">
                                                        <button onclick="openModalUp('<%= sll.getId()%>', '<%= sll.getCodeSalle()%>', '<%= sll.getDesignation()%>', '<%= sll.getCapacite()%>'" 
                                                                class="px-4 py-2 bg-blue-500 text-white text-xs rounded-md">
                                                            Modifier
                                                        </button>
                                                        <button onclick="openModalDelete('<%= sll.getId()%>')" class="px-4 py-2 bg-red-600 text-white text-xs rounded-md">
                                                            Supprimer
                                                        </button>
                                                        <%@include file="/includes/updateProfs-modal.jsp"%>
                                                        <%@include file="/includes/deletProfs-modal.jsp"%>
                                                    </div>
                                                </td>
                                            </tr>

                                            <%
                                                }
                                            } else {
                                            %>
                                            <tr>
                                                <td colspan="5" class="p-5 flex items-center justify-center">Aucun professeur trouvé.</td>
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
