<%-- 
    Document   : index
    Created on : 22 mars 2025, 07:22:48
    Author     : mahefa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page d'accueil</title>
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    </head>
    <body>
        <div>
            <div class="sticky top-0 z-50">
                <%@include file="/includes/Header.jsp"%>
            </div>
            <div class="mx-2 flex flex-col items-center min-h-screen bg-gray-100 overflow-hidden">
                <div class="container  m-4">
                    <div class="max-w-3xl w-full mx-auto grid gap-4 grid-cols-1">
                        <!---stats-->
                        <div class="grid grid-cols-12 gap-4 ">
                            <div class="col-span-12 sm:col-span-4">
                                <div class="p-4 relative  bg-gray-800 border border-gray-800 shadow-lg  rounded-2xl">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-14 w-14  absolute bottom-4 right-3 text-green-400" viewBox="0 0 20 20" fill="currentColor">
                                    <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z" />
                                    <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z" />
                                    </svg>
                                    <div class="text-2xl text-gray-100 font-medium leading-8 mt-5">20</div>
                                    <div class="text-sm text-gray-500">Components</div>
                                </div>
                            </div>
                            <div class="col-span-12 sm:col-span-4">
                                <div class="p-4 relative  bg-gray-800 border border-gray-800 shadow-lg  rounded-2xl">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-14 w-14  absolute bottom-4 right-3 text-blue-500" viewBox="0 0 20 20" fill="currentColor">
                                    <path d="M2 11a1 1 0 011-1h2a1 1 0 011 1v5a1 1 0 01-1 1H3a1 1 0 01-1-1v-5zM8 7a1 1 0 011-1h2a1 1 0 011 1v9a1 1 0 01-1 1H9a1 1 0 01-1-1V7zM14 4a1 1 0 011-1h2a1 1 0 011 1v12a1 1 0 01-1 1h-2a1 1 0 01-1-1V4z" />
                                    </svg>

                                    <div class="text-2xl text-gray-100 font-medium leading-8 mt-5">99</div>
                                    <div class="text-sm text-gray-500">Projects</div>
                                </div>
                            </div>
                            <div class="col-span-12 sm:col-span-4">
                                <div class="p-4 relative  bg-gray-800 border border-gray-800 shadow-lg  rounded-2xl">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-14 w-14  absolute bottom-4 right-3 text-yellow-300" viewBox="0 0 20 20" fill="currentColor">
                                    <path fill-rule="evenodd" d="M3 3a1 1 0 000 2v8a2 2 0 002 2h2.586l-1.293 1.293a1 1 0 101.414 1.414L10 15.414l2.293 2.293a1 1 0 001.414-1.414L12.414 15H15a2 2 0 002-2V5a1 1 0 100-2H3zm11.707 4.707a1 1 0 00-1.414-1.414L10 9.586 8.707 8.293a1 1 0 00-1.414 0l-2 2a1 1 0 101.414 1.414L8 10.414l1.293 1.293a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                                    </svg>

                                    <div class="text-2xl text-gray-100 font-medium leading-8 mt-5">50</div>
                                    <div class="text-sm text-gray-500">Pen Items</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
